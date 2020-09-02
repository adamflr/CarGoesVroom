# Teams 2020
library(rvest)
library(tidyverse)
url <- "https://en.wikipedia.org/wiki/2020_Formula_One_World_Championship"

temp <- url %>% 
  read_html() %>% 
  html_nodes("table")

dat_teams <- html_table(temp[2], fill = T)
dat_teams <- as.data.frame(dat_teams)
dat_teams <- dat_teams[2:11, 1:4]
dat_teams <- dat_teams %>% 
  mutate_all(function(x) gsub(pattern = "\\[.*\\]", "", x, fixed = F))

dat_teams$color <- paste0("#", c("9B0000", "FFFFFF", "DC0000", "F0D787", "FF8700", "00D2BE", "F596C8", "1E41FF", "FFF500", "0081F9"))

dat_teams$Short.name <- c("Alfa Romeo", "Alpha Tauri", "Ferrari", "Haas", "McLaren", "Mercedes", "Racing Point", "Red Bull", "Renault", "Williams")

ggplot(dat_teams, aes(x = 0, y = 1:10, label = Short.name)) +
  geom_text(hjust = "left") +
  geom_point(aes(x = -1), fill = dat_teams$color, size = 10, shape = 21) +
  xlim(-1,10)

dat_drivers <- html_table(temp[8], fill = T)[[1]]

dat_drivers <- dat_drivers[1:(dim(dat_drivers)[1] - 2),1:20]
dat_drivers %>% 
  mutate_at(vars(-Pos., -Driver), function(x) gsub("F|P|Ret|DNS|WD", "", x))
