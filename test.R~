library(RColorBrewer)
library(reshape)
library(memisc)
library(Hmisc)
library(ggplot2)
library(cowplot)
library(foreign)
library(haven)
library(bamixed)
library(dplyr)
library(magrittr)



setwd("~/Documents/daten/R/allbus_14/")

all <- read_dta("~/Documents/daten/R/allbus_14/ZA5240_v2-1-0.dta")
# all2 <- read_por("~/Documents/daten/R/allbus_14/ZA5240_v2-1-0.por")

all <- recode_missings(all, a = c(99))


### Liste erstellen, welche für das Wertelabel "KEINE ANGABE" die zugehörige Kodierung
### enthält

jaaa <- vector(length = nrow(all))

jaaa <-    all %>% 
      lapply(.,  function(x)
               (attributes(x)$labels["KEINE ANGABE"])
             )

for(i in 1:length(jaaa)) {
    if(is.null(jaaa[[i]]) == TRUE) {
        jaaa[[i]] <- NA
    }
}

kodierungen <- jaaa %>% unlist() %>% as.data.frame

kodierungen[, 1]
i <- apply(all, 2, function(x) is.na(x))
index <- matrix(NA, nrow = nrow(all), ncol = ncol(all))
index %>% dim

for(i in 1:nrow(all)) {
   index[i]  <- apply(all, 2, function(x) x == kodierungen[, 1])
}


i <- apply(all, 2, function(x) x == kodierungen[, 1]) %>% as.data.frame()

iall <- apply(all[1:100], 2, function(x) sum(x == 9, na.rm = T))
dim(iall)
isums <- apply(i[1:100], 2, function(x) sum(x, na.rm = T))


table(all$V99)
all$V99
length(all$V99[all$V99 == 99])
attributes(all$V99)$labels
class(i)
dim(i)
isums[1:100]
iall[1:100]
isums == iall
jaaa[50:60]
