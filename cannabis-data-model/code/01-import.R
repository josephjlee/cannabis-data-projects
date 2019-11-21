#=====================================================================#
# This is code to create:
# Authored by and feedback to:
# MIT License
# Version:
#=====================================================================#

# packages ----------------------------------------------------------------

library(tidyverse)
library(DataExplorer)
library(skimr)
library(inspectdf)
library(visdat)
library(janitor)
library(rmarkdown)
library(leaflet)
library(viridis)
library(tidymodels)

# Bring in the data
retail_dataimport <- read_csv("Online_Retail.csv",
                              col_types = cols(
                                InvoiceNo = col_character(),
                                StockCode = col_character(),
                                Description = col_character(),
                                Quantity = col_integer(),
                                InvoiceDate = col_datetime("%m/%d/%Y %H:%M"),
                                UnitPrice = col_double(),
                                CustomerID = col_integer(),
                                Country = col_character()))

