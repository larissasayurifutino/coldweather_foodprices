library(ggplot2)
library(viridis)
library(dplyr)
library(tidyr)
library(stringr)

milho <- read.csv2("DATA/CONAB/milho_uf.csv")

milho <- milho %>%
  group_by(UF) %>%
  mutate(max = max(Safra.13.14, Safra.14.15, Safra.15.16, Safra.16.17,
                   Safra.17.18, Safra.18.19, Safra.19.20, Safra.20.21))

milho_long <- pivot_longer(data = milho, 
                           cols = c(starts_with("Safra")), names_to = "Safra")

milho_long$Safra <- str_replace(string = milho_long$Safra, 
            pattern = "Safra.", 
            replacement = "")

milho_long <- milho_long %>%
  mutate(perc = (value/max)*100)


milho_long %>% filter(Safra %in% c('20.21'))



ggplot(milho_long, aes(x = Safra, y = UF, fill= perc)) + 
  geom_tile() +
  scale_fill_distiller(palette = "YlOrRd") +
  guides(fill=guide_legend(title="Percentual do máximo produzido por UF")) +
  theme(legend.position = "bottom")
