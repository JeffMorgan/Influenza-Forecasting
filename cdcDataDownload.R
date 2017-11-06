# Option 1: Install from CRAN
# install.packages("cdcfluview")

# Option 2: Install from GitHub (most up-to-date version)
# devtools::install_github("hrbrmstr/cdcfluview")

library(cdcfluview)

# National ILINet data for 1997/98 - 2016/17 seasons
usflu <- get_flu_data(region = "national", data_source = "ilinet", years = 1997:2016)

# HHS Regional ILINet data for 1997/98 - 2016/17 seasons
regionflu <- get_flu_data(region = "HHS", sub_region = 1:10, data_source = "ilinet", years = 1997:2016)

