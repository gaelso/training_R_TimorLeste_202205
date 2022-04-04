## Training on Lao PDR National Forest Inventory data analysis with R
## 29/03 - 02/04/2021 Vientiane, Lao PDR
## Gael Sola (FAO), Chittana Phompila (NUOL)


### 
### Data visualization ######################################################
###

## --- Miscellaneous --------------------------------------------------------

## Theme

ggplot(tree, aes(x = dbh, y = h_est, color = lc_class)) +
  geom_point() +
  theme_bw()

ggplot(tree, aes(x = dbh, y = h_est, color = lc_class)) +
  geom_point() +
  theme_dark()

ggplot(tree, aes(x = dbh, y = h_est, color = lc_class)) +
  geom_point() +
  theme_linedraw()

## Check ggplot themes on Google. theme_bw() is a good choice if you intend to print


## --- Faceting ------------------------------------------------------------

ggplot(tree, aes(x = dbh, y = h_est, color = lc_class)) +
  geom_point() +
  theme_bw() + 
  facet_wrap(~subplot_id)

ggplot(tree, aes(x = dbh, y = h_est, color = lc_class)) +
  geom_point() +
  theme_bw() + 
  facet_wrap(~plot_id + subplot_id)

## +++ Practice faceting with province +++


## --- Boxplot + points -----------------------------------------------------

ggplot(tree, aes(x = lc_class, y = dbh)) +
  geom_boxplot() +
  geom_jitter(aes(color = lc_class))


## --- Removing legend ------------------------------------------------------

ggplot(tree, aes(x = lc_class, y = dbh)) +
  geom_boxplot() +
  geom_jitter(aes(color = lc_class)) +
  theme(legend.position = 'none')


## --- Spatial points -------------------------------------------------------

ggplot(plot_init, aes(x = x, y = y, color = lc_class_main)) +
  geom_point()
## Not correct by default as the distance between x units and y units is not the same

ggplot(plot_init, aes(x = x, y = y, color = lc_class_main)) +
  geom_point() +
  coord_fixed()

## --- Shapefiles -----------------------------------------------------------
## !!! If there is interest in displaying shapefiles, i can demonstrate the sf package.

library(sf) ## Need to install first

sf_plot <- st_as_sf(plot_init, coords = c("x", "y"), crs = 4236) %>%
  filter(!is.na(lc_class_main), !(lc_class_main %in% c("OTH", "SW")))
sf_lao <- st_read(dsn = "data/GIS/LAO_adm/LAO_adm0.shp", quiet = TRUE) ## Download from google drive or https://gadm.org/

ggplot() +
  geom_sf(data = sf_lao, color = 'black', fill = NA) +
  geom_sf(data = sf_plot, aes(color = lc_class_main)) +
  theme_bw() +
  labs(color = "Land cover class")
  

## --- Group plots with ggpubr ----------------------------------------------

## (Optional)
