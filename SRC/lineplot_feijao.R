library(ggplot2)
library(tidyr)
library(stringr)

feijao <- read.csv2("../DATA/CONAB/feijao.csv")

feijao_long <- pivot_longer(data = feijao, 
                           cols = c(starts_with("Safra")), names_to = "Safra")

feijao_long$Safra <- str_replace(string = feijao_long$Safra, 
                                pattern = "Safra.", 
                                replacement = "")

ggplot(feijao_long, aes(x = Safra, y = value, group = reg, colour = reg))  + 
  geom_point() + 
  geom_line() +
  geom_text(aes(x = 1, y = 2790, label= 2702.1),                  
            color="#F8766D", 
            size=4) +
  geom_text(aes(x = 3, y = 2000, label= 2097.4),                  
            color="#F8766D", 
            size=4) +
  geom_text(aes(x = 8, y = 2030, label= 2154.8),                  
            color="#F8766D", 
            size=4) +
  geom_text(aes(x = 3, y = 550, label= 415.5),                  
            color="#00BFC4", 
            size=4) +
  geom_text(aes(x = 7, y = 1020, label= 934.9),                 
            color="#00BFC4", 
            size=4) +
  geom_text(aes(x = 8, y = 800, label= 701.3),                 
            color="#00BFC4", 
            size=4) +
  labs(x = "Safra", y = "Produção (1000 t)") +
  ylim(c(0, 3000)) + 
  guides(colour = guide_legend(title = "Região")) +
  theme(legend.position = "bottom")
