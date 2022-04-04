## Training on Lao PDR National Forest Inventory data analysis with R
## 29/03 - 02/04/2021 Vientiane, Lao PDR
## Gael Sola (FAO), Chittana Phompila (NUOL)


### 
### Functions ###############################################################
###


## --- Most useful function: HELP! ------------------------------------------
help("sample")
?rep

## --- Core functions ------------------------------------------------------- 

## Load packages
library(tidyverse)

## Load files
source("R/session2/01d-data frames and tibbles.R")

## Others
ls()

test <- "Hello"
rm(test) ## Verify test is removed in the Environment tab

dir.create("results")


## --- Maths ----------------------------------------------------------------
exp(1)
log(exp(1))
log10(100)
sqrt(4)

## Statistics
set.seed(15) ## To have all the same value we need to set a seed
sample(x = 1:10, size = 1) ## Take random value between 1 and 10

rnorm(n = 100) ## Normal distribution of mean 0 and sd 1
hist(rnorm(n = 100))
hist(rnorm(n = 10000))


## --- Data overview --------------------------------------------------------
summary(tib1)
mean(tib1$dbh)
mean(tib1$h)
mean(tib1$h, na.rm = TRUE)
sum(tib1$dbh)

str(tib1)
View(tib1) ## Careful it has uppercase V, same as click on tib1 in Environment pane
table(tib1$plot_id)


## --- Load and save tables -------------------------------------------------

write_csv(x = tib1, file = "results/tib1.csv")

tib1_init <- read_csv("results/tib1.csv")


## +++ EX 9 +++
## 1. Calculate the exponential of 13 * 11. Divide all by log(13) and take the square root of everything. How much is the result?
## 2. What is the mean of tree_id in tib1?
## 3. What is the sum of h in tib1?
## 4. Get the summary of your table tib_tree.
## 5. Save tib_tree in the folder results and name tib_tree.csv
## +++


############################## END ##########################################