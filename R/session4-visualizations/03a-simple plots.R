
## Training on National Forest Inventory: Overview and data analysis for carbon 
## 09-13/05/2022, Dili, Timor Leste
## Gael Sola (FAO)



## --- Setup ----------------------------------------------------------------

## All scripts must start with loading the necessary libraries
library(tidyverse)

## Then load the data

tree_init <- read_csv("data/tree_all.csv") %>%
  filter(class == "live tree")
  
subplot_init <- read_csv("data/subplot_all.csv")

plot_init <- read_csv("data/plot_coord.csv")

n <- dim(tree_init)[1]

tree <- tree_init %>%
  left_join(subplot_init) %>%
  select(file, tree_id, dbh, subplot_no, plot_id, subplot_id, lc_class, province_name) %>%
  mutate(
    h_model  = exp(0.893 + 0.760 * log(dbh) - 0.0340 * (log(dbh))^2),
    h_res    = exp(rnorm(n = n, mean = 0, sd = 0.243)),
    h_error  = sample(x = c(rep(1, 9), 2), n, replace = TRUE),
    h_est    = h_model * h_res,
    h        = h_est * h_error
  ) %>%
  filter(plot_id %in% c(1, 441))
  
tree

## !!! We will spend more time on these functions in the next session !!!

summary(tree)
table(tree$h_error)
table(tree$subplot_id)


## --- simple plot ----------------------------------------------------------

plot(tree$dbh, tree$h)


## ggplot: simple graph
ggplot(tree, aes(x = dbh, y = h)) +
  geom_point()

## To change the color for all points, place it in the geometry:
ggplot(tree, aes(x = dbh, y = h)) +
  geom_point(color = 'red')

## To change the aesthetics based on a category variables, place it inside the aes()
ggplot(tree, aes(x = dbh, y = h, color = lc_class)) +
  geom_point()

ggplot(tree, aes(x = dbh, y = h, shape = lc_class)) +
  geom_point()

ggplot(tree, aes(x = dbh, y = h, size = lc_class)) +
  geom_point()

ggplot(tree, aes(x = dbh, y = h, shape = lc_class, color = lc_class)) +
  geom_point()

ggplot(tree, aes(x = dbh, y = h)) +
  geom_point() +
  facet_wrap(~lc_class)


## Add labels
ggplot(tree, aes(x = dbh, y = h, color = lc_class)) +
  geom_point()


ggplot(tree, aes(x = dbh, y = h, color = lc_class)) +
  geom_point() +
  labs(x = "Diameter at breast height (cm)",
       y = "Tree height (m)",
       color = "Land use")



## +++ EX 1 +++
## Create 2 graphes of your choice with different colors and shapes. 
## Create custom labels for your graphs.

