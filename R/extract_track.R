# Track?
# Teams 2020
library(rvest)
library(tidyverse)
url <- "https://upload.wikimedia.org/wikipedia/commons/5/54/Spa-Francorchamps_of_Belgium.svg"

temp <- url %>% 
  read_html()

temp <- xml_find_all(temp, "body/svg/g/path")[8]
temp <- xml_node(temp, xpath = "@d") %>% as_list()
temp <- temp[[1]][[1]]

temp <- gsub("m|c", "", temp)
temp <- gsub("  ", " ", temp)

temp <- strsplit(temp, " ")[[1]]
temp <- temp[-1]

temp <- strsplit(temp, ",") %>% unlist()
dat <- data.frame(x1 = temp[seq(3,134,2)], x2 = temp[seq(4,134,2)])

plot(dat, t = "l")
#5609

temp <- url %>% 
  read_html()

temp <- xml_find_all(temp, "body/svg/g/path")[2]
temp <- xml_node(temp, xpath = "@d") %>% as_list()
temp <- temp[[1]][[1]]

temp <- gsub("m|c|z", "", temp)
temp <- gsub("  ", " ", temp)

temp <- strsplit(temp, " ")[[1]]
temp <- temp[-1]

temp <- strsplit(temp, ",") %>% unlist()
dat <- data.frame(x1 = temp[seq(3,length(temp),2)], x2 = temp[seq(4,length(temp),2)])

dat <- dat %>% mutate(x1 = cumsum(x1), x2 = - cumsum(x2)) 
dat <- rbind(dat, dat[1,])
plot(dat, asp = 1, t = "l")


