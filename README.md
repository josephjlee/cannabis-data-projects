Cannabis data projects
================
Martin Frigaard
2019-11-21

# Data projects with cannabis data

Below are the projects I am building with cannabis data.

## Data model

These are cannabis data sets I’ve gathered from around the web.

``` r
fs::dir_tree("cannabis-data-model")
```

    #>  cannabis-data-model
    #>  ├── 00-setup.R
    #>  ├── 01-wrangle.Rmd
    #>  ├── 01-wrangle.md
    #>  ├── CITATION
    #>  ├── INSTALL.R
    #>  ├── LICENSE
    #>  ├── README.Rmd
    #>  ├── README.md
    #>  ├── cannabis-data-model.Rproj
    #>  ├── code
    #>  │   ├── 01-import.R
    #>  │   ├── 02-tidy.R
    #>  │   ├── 03-wrangle.R
    #>  │   ├── 04-visualize.R
    #>  │   ├── 05-model.R
    #>  │   ├── 06-communicate.R
    #>  │   └── runall.R
    #>  ├── data
    #>  │   ├── kushy-datasets
    #>  │   │   ├── Brands
    #>  │   │   │   └── brands-kushy_api.2017-11-14.sql
    #>  │   │   ├── Products
    #>  │   │   │   └── products-kushy_api.2017-11-14.sql
    #>  │   │   ├── README.md
    #>  │   │   ├── Shops
    #>  │   │   │   └── shops-kushy_api.2017-11-14.sql
    #>  │   │   ├── Strains
    #>  │   │   │   └── strains-kushy_api.2017-11-14.sql
    #>  │   │   ├── brands-kushy_api.2017-11-14.csv
    #>  │   │   ├── products-kushy_api.2017-11-14.csv
    #>  │   │   ├── shops-kushy_api.2017-11-14.csv
    #>  │   │   └── strains-kushy_api.2017-11-14.csv
    #>  │   ├── marijuana-data-processing
    #>  │   │   ├── NSDUH-totals-2016
    #>  │   │   │   ├── CSV-File-Description.txt
    #>  │   │   │   ├── NSDUHsaeTotals-Tab01-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab02-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab03-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab04-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab05-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab06-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab07-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab08-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab09-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab10-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab11-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab12-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab13-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab14-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab15-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab16-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab17-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab18-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab19-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab20-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab21-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab22-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab23-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab24-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab25-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab26-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab27-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab28-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab29-2016.csv
    #>  │   │   │   └── NSDUHsaeTotals-Tab30-2016.csv
    #>  │   │   ├── Project.ipynb
    #>  │   │   ├── README.md
    #>  │   │   ├── economy
    #>  │   │   │   ├── CONGSP.csv
    #>  │   │   │   ├── Energy Census and Economic Data US 2010-2014.csv
    #>  │   │   │   ├── NGMP19740.csv
    #>  │   │   │   ├── marijuana_gross_sales.csv
    #>  │   │   │   ├── marijuana_sales_tax_2015.csv
    #>  │   │   │   └── tax_revenue2018.csv
    #>  │   │   ├── european-countries
    #>  │   │   │   ├── HBSC_26_EN.csv
    #>  │   │   │   ├── HBSC_27_EN.csv
    #>  │   │   │   ├── HBSC_28_EN.csv
    #>  │   │   │   ├── HBSC_91_EN.csv
    #>  │   │   │   ├── HBSC_92_EN.csv
    #>  │   │   │   └── HBSC_93_EN.csv
    #>  │   │   ├── other-data
    #>  │   │   │   ├── crime_denver.csv
    #>  │   │   │   ├── legal_marijuana_support.csv
    #>  │   │   │   └── state_marijuana_laws_10_2016.csv
    #>  │   │   └── usage-data
    #>  │   │       ├── drug-use-by-age.csv
    #>  │   │       └── marijuana-use-2016.csv
    #>  │   └── raw
    #>  │       └── Online_Retail.csv
    #>  ├── doc
    #>  │   ├── lab-notes.md
    #>  │   └── project-manuscript.md
    #>  ├── figs
    #>  │   ├── cat-KushyBrands-1.png
    #>  │   ├── cat-KushyProducts-1.png
    #>  │   ├── cat-KushyShops-1.png
    #>  │   ├── cat-KushyStrains-1.png
    #>  │   ├── headset-example.png
    #>  │   ├── kushy_brands_inspect_na-1.png
    #>  │   ├── kushy_products_inspect_na-1.png
    #>  │   ├── kushy_shops_inspect_na-1.png
    #>  │   └── kushy_strains_inspect_na-1.png
    #>  ├── requirements.txt
    #>  ├── results
    #>  │   └── README.md
    #>  └── to-do.md

## Shinydashboard

This is a dashboard for cannabis data.

``` r
fs::dir_tree("shinydashboard-cannabis")
```

    #>  shinydashboard-cannabis
    #>  ├── DESCRIPTION
    #>  ├── README.Rmd
    #>  ├── README.md
    #>  ├── bloomfilter.R
    #>  ├── data
    #>  │   ├── cranlog.csv
    #>  │   ├── kushy-datasets
    #>  │   │   ├── README.md
    #>  │   │   ├── brands-kushy_api.2017-11-14.csv
    #>  │   │   ├── products-kushy_api.2017-11-14.csv
    #>  │   │   ├── shops-kushy_api.2017-11-14.csv
    #>  │   │   └── strains-kushy_api.2017-11-14.csv
    #>  │   ├── marijuana-data-processing
    #>  │   │   ├── NSDUH-totals-2016
    #>  │   │   │   ├── CSV-File-Description.txt
    #>  │   │   │   ├── NSDUHsaeTotals-Tab01-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab02-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab03-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab04-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab05-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab06-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab07-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab08-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab09-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab10-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab11-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab12-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab13-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab14-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab15-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab16-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab17-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab18-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab19-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab20-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab21-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab22-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab23-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab24-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab25-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab26-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab27-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab28-2016.csv
    #>  │   │   │   ├── NSDUHsaeTotals-Tab29-2016.csv
    #>  │   │   │   └── NSDUHsaeTotals-Tab30-2016.csv
    #>  │   │   ├── Project.ipynb
    #>  │   │   ├── README.md
    #>  │   │   ├── economy
    #>  │   │   │   ├── CONGSP.csv
    #>  │   │   │   ├── Energy Census and Economic Data US 2010-2014.csv
    #>  │   │   │   ├── NGMP19740.csv
    #>  │   │   │   ├── marijuana_gross_sales.csv
    #>  │   │   │   ├── marijuana_sales_tax_2015.csv
    #>  │   │   │   └── tax_revenue2018.csv
    #>  │   │   ├── european-countries
    #>  │   │   │   ├── HBSC_26_EN.csv
    #>  │   │   │   ├── HBSC_27_EN.csv
    #>  │   │   │   ├── HBSC_28_EN.csv
    #>  │   │   │   ├── HBSC_91_EN.csv
    #>  │   │   │   ├── HBSC_92_EN.csv
    #>  │   │   │   └── HBSC_93_EN.csv
    #>  │   │   ├── other-data
    #>  │   │   │   ├── crime_denver.csv
    #>  │   │   │   ├── legal_marijuana_support.csv
    #>  │   │   │   └── state_marijuana_laws_10_2016.csv
    #>  │   │   └── usage-data
    #>  │   │       ├── drug-use-by-age.csv
    #>  │   │       └── marijuana-use-2016.csv
    #>  │   └── raw
    #>  │       └── Online_Retail.csv
    #>  ├── docs
    #>  ├── figs
    #>  │   ├── bubbles-1.png
    #>  │   ├── cat-KushyBrands-1.png
    #>  │   ├── cat-KushyProducts-1.png
    #>  │   ├── cat-KushyShops-1.png
    #>  │   ├── cat-KushyStrains-1.png
    #>  │   ├── kushy_brands_inspect_na-1.png
    #>  │   ├── kushy_products_inspect_na-1.png
    #>  │   ├── kushy_shops_inspect_na-1.png
    #>  │   └── kushy_strains_inspect_na-1.png
    #>  ├── global.R
    #>  ├── server.R
    #>  ├── shinydashboard-cannabis.Rproj
    #>  └── ui.R
