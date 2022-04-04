## Training on Lao PDR National Forest Inventory data analysis with R
## 29/03 - 02/04/2021 Vientiane, Lao PDR
## Gael Sola (FAO), Chittana Phompila (NUOL)


### 
### Data visualization ######################################################
###


## --- lines ----------------------------------------------------------------

ggplot(tree, aes(x = dbh, y = h_model)) +
  geom_line()

ggplot(tree, aes(x = dbh, y = h, color = lc_class)) +
  geom_line()

ggplot(tree, aes(x = h_model, y = h_est, color = lc_class)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1)


## !!! To represent different x- or y-values with different geometries, 
##     place the aes() inside the geom_*() functions:
ggplot(tree, aes(x = dbh, y = h_est)) +
  geom_point(aes(color = lc_class)) +
  geom_segment(aes(xend = dbh, yend = h_model), color = "grey70") +
  geom_line(aes(y = h_model)) +
  theme_bw() +
  labs(
    x = "Diameter at Breast Height (cm)", 
    y = "Simulated Height (m)",
    color = "Land cover class"
    ) +
  theme(legend.position = "bottom")


## +++ EX 2 +++
## Reproduce the previous graph but with the color based on land cover class.


## --- boxplot --------------------------------------------------------------
ggplot(tree, aes(x = lc_class, y = dbh)) +
  geom_boxplot()

ggplot(tree, aes(x = subplot_id, y = dbh, color = lc_class)) +
  geom_boxplot()

## When the x labels are too large you can flip the graph
ggplot(tree, aes(x = subplot_id, y = dbh, color = lc_class)) +
  geom_boxplot() +
  coord_flip()

## +++ Practice boxplot with h_est or h +++


