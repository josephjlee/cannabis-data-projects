#=====================================================================#
# This is code to create: ui.R
# Authored by and feedback to: mjfrigaard
# MIT License
# Version: 1.0

#=====================================================================#

# 01.0 > dashboardPage -------------------------------------------------

dashboardPage(

# 02.0 > > dashboardHeader (title) -------------------------------------

dashboardHeader(title = "Cannabis app"),

# 03.0 > > dashboardSidebar ---------------------------------------------
  
  dashboardSidebar(
      
# 04.0 > > > sliderInput (Warn when rate exceeds) -------------------------

    sliderInput(inputId = "rateThreshold", 
                
                label = "Warn when rate exceeds",
                
                min = 0, max = 50, value = 3, step = 0.1
    ),

# 04.1 > > > sidebarMenu (Dashboard & Raw data) -------------------------
# these are the two sidebars to select either the dashboard or the 
# raw data (in a table)

    sidebarMenu(
        
      menuItem("Dashboard", tabName = "dashboard"),
      
      menuItem("Raw data", tabName = "rawdata")
      
    )

  ),

 # 05.0 > > dashboardBody  ----------------------------------------------

  dashboardBody(
      
  # 05.1 > > > tabItems ---------------------------------------------------

    tabItems(
        
# 05.2 > > > > tabItem (dashboard) ---------------------------------------
        
      tabItem("dashboard",
              
# 05.3 > > > > > fluidRow (rate, count, users) ----------------------------

        fluidRow(
            
          valueBoxOutput("rate"),
          
          valueBoxOutput("count"),
          
          valueBoxOutput("users")
          
        ), # > > END 05.3 < < fluidRow (rate, count, users) -----------------

# 05.4 > > > > > fluidRow (Popularity by package & Top packages) ------------

        fluidRow(
            
          box(
              
            width = 8, 
            
            status = "info", 
            
            solidHeader = TRUE,
            
            title = "Popularity by package (last 5 min)",
            
            bubblesOutput("packagePlot", 
                          
                          width = "100%", 
                          
                          height = 600)
          ),
          
          box(
            width = 4, 
            
            status = "info",
            
            title = "Top packages (last 5 min)",
            
            tableOutput("packageTable")
            
          )
          
        ) # > > END 05.4 < < fluidRow (Popularity packages & Top packages)

      ), # > > END 05.2 < < tabItem (dashboard) --------

# 06.0 > > > > tabItem (rawdata) ---------------------------------------

      tabItem("rawdata",
              
        numericInput("maxrows", "Rows to show", 25),
        
        verbatimTextOutput("rawtable"),
        
        downloadButton("downloadCsv", "Download as CSV")
        
      )  # > > END 06.0 < < tabItem (rawdata) ----------------------

    ) # > > > END 05.1 < < < tabItems -----------------------------

  ) # > > END 05.0 < < dashboardBody -----------------------------

) # > END 01.0 < dashboardPage  -----------------------------

