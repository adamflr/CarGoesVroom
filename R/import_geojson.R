# Import geojson
library(sf)
library(tidyverse)

setwd("Data/data/")
dat_tracks <- tibble(file = list.files()) %>% 
  mutate(coord = map(file, ~ st_read(.x)))

for(i in 1:17){
  plot(dat_tracks$coord[[i]], main = dat_tracks$file[[i]])
}

track_list <- st_read("Data/data/be-2019.geojson")
plot(temp)
st_coordinates(temp) %>% plot(t="l")

temp[1,] %>% st_coordinates()
