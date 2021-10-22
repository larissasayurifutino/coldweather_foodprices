library(htmltools)
library(reactable)

#https://glin.github.io/reactable/articles/cookbook/cookbook.html
#https://flagpedia.net/download/icons

orange_pal <- function(x) rgb(colorRamp(c("#ffe4cc", "#ff9500"))(x), maxColorValue = 255)
amer_lat$band <- substr(x = tolower(amer_lat$code), 1, 2)

reactable(pageSizeOptions = 18,
  amer_lat[c(1:5, 10, 12, 15, 17, 18), c(1, 4)],
  columns = list(
    country = colDef(name = "País"),
    # band = colDef(cell = function(value) {
    #   image <- img(src = sprintf("OTHERS/w40/%s.png", value), alt = value)
    #   tagList(
    #     div(style = list(display = "inline-block", width = "45px"), image),
    #     value
    #   )
    # }),
    GHI = colDef(style = function(GHI) {
      normalized <- (GHI - min(amer_lat$GHI)) / (max(amer_lat$GHI) - min(amer_lat$GHI))
      color <- orange_pal(normalized)
      list(background = color)
    })
  )
)
