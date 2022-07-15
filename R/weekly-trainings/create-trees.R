

## +++
## Create trees based on random functions and pan-tropical allometric equation
## from Chave et al. 2014.
## Gael Sola, FAO, June 2022
## +++



## Libraries

library(ggplot2)



## Parameters:
## + Number of trees: n
## + DBH min and max in cm: dbh_min, dbh_max  

n <- 100
dbh_min <- 10
dbh_max <- 100



## Create trees with:
## - Random diameter between dbh_min and dbh_max
## - Modeled height with an allometric equation
## - Simulated height by adding a random error following a normal distribution 
##   of mean 0 and standard deviation 0.243 (function rnorm() simulates normal distributions)

set.seed(10)

vec_dbh <- sample(dbh_min:dbh_max, n, replace = T)

vec_height_model <- exp(0.893 - 0.2 + 0.760 * log(vec_dbh) - 0.0340 * (log(vec_dbh))^2)

vec_height_error <- exp(rnorm(n = n, mean = 0, sd = 0.243))



tree <- data.frame(
  tree_id = 1:n,
  tree_dbh = vec_dbh,
  tree_height_model = vec_height_model,
  tree_height_error = vec_height_error,
  tree_height_top = vec_height_model * vec_height_error
)

## Checks
summary(tree)


  
## Visualizations

ggplot(tree, aes(x = tree_dbh)) +
  geom_point(aes(y = tree_height_top)) +
  theme_bw()

ggplot(tree, aes(x = tree_dbh)) +
  geom_text(aes(y = tree_height_top, label = tree_id))

ggplot(tree, aes(x = tree_dbh)) +
  geom_point(aes(y = tree_height_top), size = 2) +
  geom_line(aes(y = tree_height_model), col = "red") +
  geom_segment(aes(xend = tree_dbh, y = tree_height_model, yend = tree_height_top)) +
  theme_bw() +
  labs(x = "DBH (cm)", y = "H (m)")






