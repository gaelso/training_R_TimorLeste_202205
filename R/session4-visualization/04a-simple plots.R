
## Training on National Forest Inventory: Overview and data analysis for carbon 
## 09-13/05/2022, Dili, Timor Leste
## Gael Sola (FAO)



## --- Setup ----------------------------------------------------------------

## All scripts must start with loading the necessary libraries
#library(tidyverse)
library(tibble)
library(readr)
library(dplyr)
library(ggplot2)

## Then load the data

tree_init <- read_csv("data/tree.csv")
  
plot_init <- read_csv("data/plot.csv")

# tree_test <- read.csv("data/tree.csv")
# 
# tree_init
# tree_test

tree <- tree_init %>%
  left_join(plot_init)
tree


## !!! We will spend more time on these functions in the next session !!!
summary(tree)
table(tree$plot_id)
table(tree$site)
table(tree$plot_id, tree$site)


## --- simple plot ----------------------------------------------------------

plot(tree$tree_dbh, tree$tree_height_top)


## ggplot: simple graph
ggplot(tree, aes(x = tree_dbh, y = tree_height_top)) +
  geom_point()

## To change the color for all points, place it in the geometry:
ggplot(tree, aes(x = tree_dbh, y = tree_height_top)) +
  geom_point(color = 'red')

## To change the aesthetics based on a category variables, place it inside the aes()
tree$lc
table(tree$lc)

ggplot(tree, aes(x = tree_dbh, y = tree_height_top, color = lc)) +
  geom_point()

ggplot(tree, aes(x = tree_dbh, y = tree_height_top, shape = lc)) +
  geom_point()

ggplot(tree, aes(x = tree_dbh, y = tree_height_top, size = lc)) +
  geom_point()

ggplot(tree, aes(x = tree_dbh, y = tree_height_top, shape = lc, color = lc)) +
  geom_point(size = 2)

ggplot(tree, aes(x = tree_dbh, y = tree_height_top)) +
  geom_point() +
  facet_wrap(~lc)


## Add labels
ggplot(tree, aes(x = tree_dbh, y = tree_height_top, color = lc)) +
  geom_point()

ggplot(tree, aes(x = tree_dbh, y = tree_height_top, color = lc)) +
  geom_point() +
  labs(x = "Diameter at breast height (cm)",
       y = "Tree height (m)",
       color = "Land use"
       )

ggplot(tree, aes(x = tree_dbh, y = tree_height_top, color = lc)) +
  geom_point() +
  labs(x = "Diametro (cm)",
       y = "Altura (m)",
       color = "Tipu uza rai"
       )

tree %>%
  ggplot(aes(x = tree_dbh, y = tree_height_top, color = lc)) +
  geom_point() +
  labs(x = "Diametro (cm)",
       y = "Altura (m)",
       color = "Tipu uza rai"
       )

tree %>%
  filter(lc == "Dense forest") %>%
  ggplot(aes(x = tree_dbh, y = tree_height_top, color = lc)) +
  geom_point() +
  labs(x = "Diametro (cm)",
       y = "Altura (m)",
       color = "Tipu uza rai"
  )

tree %>%
  filter(lc %in% c("Dense forest", "Sparse forest")) %>%
  ggplot(aes(x = tree_dbh, y = tree_height_top, color = lc)) +
  geom_point() +
  labs(x = "Diametro (cm)",
       y = "Altura (m)",
       color = "Tipu uza rai"
  )

tree %>%
  filter(lc %in% c("Dense forest", "Sparse forest")) %>%
  ggplot(aes(x = tree_dbh, y = tree_height_top, color = lc)) +
  geom_point() +
  labs(x = "Diametro (cm)",
       y = "Altura (m)",
       color = "Tipu uza rai"
  ) +
  facet_wrap(~lc) +
  theme(legend.position = "none")


## +++ EX 1 +++
## Create 2 graphs of your choice with different colors and shapes. 
## Create custom labels for your graphs.
## +++





