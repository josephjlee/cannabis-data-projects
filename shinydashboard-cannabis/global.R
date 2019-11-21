#=====================================================================#
# This is code to create: global.R
# Authored by and feedback to: mjfrigaard
# MIT License
# Version: 1.0
#=====================================================================#


# packages ----------------------------------------------------------------

library(shiny)
library(shinySignals) # devtools::install_github("hadley/shinySignals")
library(dplyr)
library(shinydashboard)
library(bubbles) # devtools::install_github("jcheng5/bubbles")
source("bloomfilter.R")


# prototype data frame ----------------------------------------------------
# An empty prototype of the data frame we want to create
prototype <- data.frame(
  date = character(), 
  time = character(),
  size = numeric(), 
  r_version = character(), 
  r_arch = character(),
  r_os = character(), 
  package = character(), 
  version = character(),
  country = character(), 
  ip_id = character(), 
  received = numeric()
)


# packageStream -----------------------------------------------------------
# Connects to streaming log data for cran.rstudio.com and
# returns a reactive expression that serves up the cumulative
# results as a data frame
packageStream <- function(session) {
  # Connect to data source
  sock <- base::socketConnection(host = "cransim.rstudio.com", 
                                 port = 6789, 
                                 blocking = FALSE, 
                                 open = "r")
  # Clean up when session is over
  session$onSessionEnded(function() {
    close(sock)
  })

# newLines reactive -------------------------------------------------------
  # Returns new lines
  newLines <- reactive({
    invalidateLater(1000, session)
    readLines(sock)
  })

  # 
  # Parses newLines() into data frame ----
  reactive({
    if (length(newLines()) == 0) {
      return()
    }
    read.csv(textConnection(newLines()),
      header = FALSE, 
      stringsAsFactors = FALSE,
      col.names = names(prototype)
    ) %>% 
        dplyr::mutate(received = as.numeric(Sys.time()))
  })
}


# packageData function -------------------------------------------------------
# Accumulates pkgStream rows over time; throws out any older than timeWindow
# (assuming the presence of a "received" field)
packageData <- function(pkgStream, timeWindow) {
  shinySignals::reducePast(pkgStream, function(memo, value) {
    rbind(memo, value) %>%
      filter(received > as.numeric(Sys.time()) - timeWindow)
  }, prototype)
}

# downloadCoun function  ----------------------------------------------------
# Count the total nrows of pkgStream
downloadCount <- function(pkgStream) {
  shinySignals::reducePast(pkgStream, function(memo, df) {
    if (is.null(df)) {
      return(memo)
    }
    memo + nrow(df)
  }, 0)
}


# userCount function -------------------------------------------------------
# Use a bloom filter to probabilistically track the number of unique
# users we have seen; using bloom filter means we will not have a
# perfectly accurate count, but the memory usage will be bounded.
userCount <- function(pkgStream) {
  # These parameters estimate that with 5000 unique users added to
  # the filter, we'll have a 1% chance of false positive on the next
  # user to be queried.
  bloomFilter <- BloomFilter$new(5000, 0.01)
  
  total <- 0
  
  reactive({
    df <- pkgStream()
    if (!is.null(df) && nrow(df) > 0) {
      # ip_id is only unique on a per-day basis. To make them unique
      # across days, include the date. And call unique() to make sure
      # we don't double-count dupes in the current data frame.
      ids <- paste(df$date, df$ip_id) %>% unique()
      # Get indices of IDs we haven't seen before
      newIds <- !sapply(ids, bloomFilter$has)
      # Add the count of new IDs
      total <<- total + length(newIds)
      # Add the new IDs so we know for next time
      sapply(ids[newIds], bloomFilter$set)
    }
    total
  })
}
