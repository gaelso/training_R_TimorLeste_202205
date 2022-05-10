## Training on Lao PDR National Forest Inventory data analysis with R
## 29/03 - 02/04/2021 Vientiane, Lao PDR
## Gael Sola (FAO), Chittana Phompila (NUOL)


### 
### Data visualization ######################################################
###


## We will spend more time on data filtering in the next session, now we just 
## use the filter() function to isolate potential error 
library(tidyverse)

tree_out <- tree %>%
  filter(h >= 50)

## --- Highlight outliers ---------------------------------------------------

ggplot(tree, aes(x = dbh, y = h, color = lc_class)) +
  geom_point() +
  geom_point(data = tree_out, color = 'red', shape = 1, size = 6)


## +++ practice, filter the tree with H > 60 and highlight them in a graph +++



## --- Scatter plot with text -----------------------------------------------

## We can see the outliers, it would be even better to see their ID
ggplot(tree, aes(x = dbh, y = h, label = tree_id)) +
  geom_text()

ggplot(tree, aes(x = dbh, y = h, label = tree_id)) +
  geom_label()

ggplot(tree_out, aes(x = dbh, y = h, label = tree_id)) +
  geom_label()

## There is a package to make the label easier to read. You ned to install first
library(ggrepel)

ggplot(tree_out, aes(x = dbh, y = h, label = tree_id)) +
  geom_point() +
  geom_label_repel()

ggplot(tree, aes(x = dbh, y = h, label = tree_id)) +
  geom_point() +
  geom_label_repel(data = tree_out, color ='red') +
  geom_point(data = tree_out, color = 'red', shape = 1, size = 6)


## +++ EX 3 +++
##  create 3 different types of graphes playing with colors, shapes, 
##  sizes, labels, etc.


