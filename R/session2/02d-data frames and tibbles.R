## Training on Lao PDR National Forest Inventory data analysis with R
## 29/03 - 02/04/2021 Vientiane, Lao PDR
## Gael Sola (FAO), Chittana Phompila (NUOL)


###
### Objects #################################################################
###

## --- Data frames ----------------------------------------------------------

## Create a data frame
df <- data.frame(
  species = c("Acacia", "Acacia", "Teak", "Dalbergia", "Eucalyptus", "Dalbergia"),
  dbh = c(22, 23.6, 95.4, 12, 47.5, 30),
  h = c(12, 20, 35, 15, 23, 11)
)

## === Note that contrary to list , data frame must have the same number of 
## === values in each column (df has 6 values per column)

## Display the data frame
df


## Select elements of a data frame
df[,1]       # Matrix style
df[1,1]      # Matrix style
df[1, "dbh"] # Matrix style with column name instead of column number
df$dbh       # List style
df$dbh[1]    # List style


## +++ EX 6 +++
## 1. Select the column h in the data frame df
## 2. Select the first value of the column h in df 
## 3. Select the first row of df
## +++


## +++ EX 7 +++
## 1. Create a data frame my_df with 4 columns a, b, c, d and 5 lines 
## 2. At least one column should contain numbers and 1 column contains text.
## 3. How to select the 5th value of the column c?
## +++



## --- Tibbles --------------------------------------------------------------

library(tidyverse)

## Convert data frame to tibble
tib <- as_tibble(df)
tib


## Create tibble from scratch
set.seed(1)
tib1 <- tibble(
  plot_id = c(rep(x = "plot1", 20), rep(x = "plot2", 20)),
  tree_id = rep(x = 1:20, 2),
  dbh     = sample(x = 10:100, size = 40, replace = T),
  h       = exp(0.893 + 0.760 * log(dbh) - 0.0340 * (log(dbh))^2) * exp(rnorm(n = 40, mean = 0, sd = 0.243)),
)

tib1$h[3] <- NA

## Quick plot to see the data
plot(x = tib1$dbh, y = tib1$h)


## +++ EX 8 +++
## 1. Convert your data frame my_df to a tibble my_tib.
## 2. Display my_df in the console (Ctrl+Enter), display my_tib, what are the differences?
## 3. Create a tibble tib_tree with 
##     - 2 plots, 
##     - 10 trees per plot identified with plot_id and tree_id, 
##     - dbh and h that you create yourself or randomly.
## 4. Make a small plot of dbh and h of your tibble tib_tree
## +++



############################## END ##########################################

