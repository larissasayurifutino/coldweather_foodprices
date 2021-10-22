rm(list = ls()); gc(reset = TRUE)
library(htmltools)
library(reactable)

feijao <- read.csv("DATA/POF/03_aquisicao_alimentar_feijao.csv", sep = ";", dec = ",")
names(feijao)

orange_pal <- function(x) rgb(colorRamp(c("#ffe4cc", "#ff9500"))(x), maxColorValue = 255)

reactable(
          feijao,
          columns = list(
            reg = colDef(name = "Região"),
            variedade = colDef(name = "Variedade"),
            com_seg_alim = colDef(name = "Seg.Alim"),
            Leve = colDef(name = "Ins.Alim Leve",
              # cell = function(value) {
              #   if (value >= feijao$com_seg_alim) paste0("+", value) else value
              # },
              style = function(value) {
                color <- if (value > feijao$com_seg_alim) {
                  "#f37735"
                } else if (value < feijao$com_seg_alim) {
                  "#8c8c8c"
                }
                list(fontWeight = 600, color = color)
              }
            ),
            Moderada = colDef(name = "Ins.Alim Mod.",
          # cell = function(value) {
          #   if (value >= feijao$com_seg_alim) paste0("+", value) else value
          # },
          style = function(value) {
            color <- if (value > feijao$com_seg_alim) {
              "#f37735"
            } else if (value < feijao$com_seg_alim) {
              "#8c8c8c"
            }
            list(fontWeight = 600, color = color)
          }
           ),
            Grave = colDef(name = "Ins.Alim Grave",
              # cell = function(value) {
              #   if (value >= feijao$com_seg_alim) paste0("+", value) else value
              # },
              style = function(value) {
                color <- if (value > feijao$com_seg_alim) {
                  "#f37735"
                } else if (value < feijao$com_seg_alim) {
                  "#8c8c8c"
                }
                list(fontWeight = 600, color = color)
              }
            )
          )
)



