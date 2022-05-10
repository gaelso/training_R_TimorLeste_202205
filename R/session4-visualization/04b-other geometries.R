
## Training on National Forest Inventory: Overview and data analysis for carbon 
## 09-13/05/2022, Dili, Timor Leste
## Gael Sola (FAO)


source("R/session4-visualization/04a-simple plots.R")

## --- lines ----------------------------------------------------------------

ggplot(tree, aes(x = tree_dbh, y = tree_height_model)) +
  geom_line()

ggplot(tree, aes(x = tree_dbh, y = tree_height_model, color = plot_id)) +
  geom_line()

ggplot(tree, aes(x = tree_height_model, y = tree_height_sim, color = lc)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1)


## !!! To represent different x- or y-values with different geometries, 
##     place the aes() inside the geom_*() functions:
ggplot(tree, aes(x = tree_dbh, y = tree_height_sim)) +
  geom_point(aes(color = lc)) +
  geom_line(aes(y = tree_height_model)) +
  theme_bw() +
  labs(
    x = "Diameter at Breast Height (cm)", 
    y = "Simulated Height (m)",
    color = "Land cover class"
    ) +
  theme(legend.position = "bottom")


## +++ EX 2 +++
## Reproduce the previous graph but with the color based on plot ID.


## --- boxplot --------------------------------------------------------------
ggplot(tree, aes(x = lc, y = tree_dbh)) +
  geom_boxplot()

ggplot(tree, aes(x = plot_id, y = tree_dbh, color = lc)) +
  geom_boxplot()

## When the x labels are too large you can flip the graph
ggplot(tree, aes(x = plot_id, y = tree_dbh, color = lc)) +
  geom_boxplot() +
  coord_flip()

## +++ Practice +++
## Create a boxplot with tree_height_sim or tree_height_top +++


