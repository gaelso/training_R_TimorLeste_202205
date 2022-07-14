
## Training on National Forest Inventory: Overview and data analysis for carbon 
## 09-13/05/2022, Dili, Timor Leste
## Gael Sola (FAO)



## Load packages, data and previous figures
source("R/session4-visualization/04c-outlier detection.R")


## --- Miscellaneous --------------------------------------------------------

## Theme
ggplot(tree, aes(x = tree_dbh, y = tree_height_sim, color = lc)) +
  geom_point() +
  theme_bw()

ggplot(tree, aes(x = tree_dbh, y = tree_height_sim, color = lc)) +
  geom_point() +
  theme_dark()

ggplot(tree, aes(x = tree_dbh, y = tree_height_sim, color = lc)) +
  geom_point() +
  theme_linedraw()

## Check ggplot themes on Google. theme_bw() is a good choice if you intend to print


## --- Faceting ------------------------------------------------------------

ggplot(tree, aes(x = tree_dbh, y = tree_height_sim, color = lc)) +
  geom_point() +
  theme_bw() + 
  facet_wrap(~plot_id)

ggplot(tree, aes(x = tree_dbh, y = tree_height_sim, color = lc)) +
  geom_point() +
  theme_bw() + 
  facet_wrap(~site + plot_id)

ggplot(tree, aes(x = tree_dbh, y = tree_height_sim, color = lc)) +
  geom_point() +
  theme_bw() + 
  facet_grid(species_id ~ site)




## +++ Practice faceting with plot_id +++


## --- Boxplot + points -----------------------------------------------------

ggplot(tree, aes(x = lc, y = tree_dbh)) +
  geom_boxplot() +
  geom_jitter(aes(color = lc))


## --- Removing legend ------------------------------------------------------

ggplot(tree, aes(x = lc, y = tree_dbh)) +
  geom_boxplot() +
  geom_jitter(aes(color = lc)) +
  theme(legend.position = 'none')


## --- Spatial points -------------------------------------------------------

## (optional)

## --- Shapefiles -----------------------------------------------------------
## !!! If there is interest in displaying shapefiles, i can demonstrate the sf package.

## (optional)
  

## --- Group plots with ggpubr ----------------------------------------------

## (Optional)
