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


rm(list = ls())
setwd("~/Documents/daten/R/allbus_14/")

all <- read_dta("~/Documents/daten/R/allbus_14/ZA5240_v2-1-0.dta")
# all2 <- read_por("~/Documents/daten/R/allbus_14/ZA5240_v2-1-0.por")


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


### indexmatrix erstellen
i <- apply(all, 1, function(x) x == kodierungen[, 1]) %>% t

### indezieren und in NA umkodieren
all[i] <- NA

### Missing Kram
all.miss <- count_missings(all)

all.miss$p <- paste( lapply(all, function(x) attributes(x)$label), names(all), sep = " ")




plot_missings(all.miss[1:100, ], "y", lbs = 8) + xlim(0, 500)
