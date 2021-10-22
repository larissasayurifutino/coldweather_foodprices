# https://glin.github.io/reactable/articles/cookbook/cookbook.html

library(formattable)

amer_lat <- read.csv("DATA/GHI/amer_lat_2018.csv")
names(amer_lat)


formattable(amer_lat[1:5, c(1, 4)], 
            list(
              GHI = color_bar("orange")
              #GHI = color_tile("white", "orange")#,
              # area(col = perc) ~ normalize_bar("pink", 0.2),
              # GHI = formatter("span",
              #                      style = x ~a style(color = ifelse(x, "green", "red")),
              #                      x ~ icontext(ifelse(x, "plus", "minus"), ifelse(x, "Yes", "No"))),
              # below_avg = formatter("span",
              #                       style = x ~ style(color = ifelse(x, "green", "red")),
              #                       x ~ icontext(ifelse(x, "ok", "remove"), ifelse(x, "Yes", "No")))
            )
)
