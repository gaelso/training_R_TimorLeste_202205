
## Training on National Forest Inventory: Overview and data analysis for carbon 
## 09-13/05/2022, Dili, Timor Leste
## Gael Sola (FAO)



## Load previous work
source("R/session4-visualization/04b-other geometries.R")

## We will spend more time on data filtering in the next session, now we just 
## use the filter() function to isolate potential error 

tree_out <- tree %>%
  filter(tree_dbh >= 50, tree_height_top <= 10)

## --- Highlight outliers ---------------------------------------------------

ggplot(tree, aes(x = tree_dbh, y = tree_height_top, color = lc)) +
  geom_point() +
  geom_point(data = tree_out, color = 'red', shape = 1, size = 6)


## +++ Practice +++
## Filter the tree with H >= 15 m and highlight them in a graph +++



## --- Scatter plot with text -----------------------------------------------

## We can see the outliers, it would be even better to see their ID
ggplot(tree, aes(x = tree_dbh, y = tree_height_top, label = tree_id)) +
  geom_text()

ggplot(tree, aes(tree_dbh, y = tree_height_top, label = tree_id)) +
  geom_label()

ggplot(tree_out, aes(tree_dbh, y = tree_height_top, label = tree_id)) +
  geom_label()

## There is a package to make the label easier to read. You ned to install first
library(ggrepel)

ggplot(tree_out, aes(x = tree_dbh, y = tree_height_top, label = tree_id)) +
  geom_point() +
  geom_label_repel()

ggplot(tree, aes(x = tree_dbh, y = tree_height_top, label = tree_id)) +
  geom_point() +
  geom_label_repel(data = tree_out, color ='red') +
  geom_point(data = tree_out, color = 'red', shape = 1, size = 6)


## +++ EX 3 +++
##  create 3 different types of graphes playing with colors, shapes, 
##  sizes, labels, etc.


