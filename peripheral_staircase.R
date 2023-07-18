#' ---
#' title: peripheral_staircase
#' author: "Kiyofumi Miyoshi"
#' date: "2023/06/30"
#' ---
#'

#' The 1-up 2-down staircase would converge into 71% accuracy  
#' P(incorrect) = P(correct)^2 = 0.5, P(correct) = 0.71

#+ message = F, warning = F
library(tidyverse)
library(readxl)

#'# data loading and descriptive statistics
#+ message = F, warning = F
d <- read_excel(dir("data", "_orientation_discrimination_2023-06-30_11h24.06.373.*xlsx$", full.names = T)) # the first argument specifies the folder name including your csv
print(d)

plot(d[, 3]) # sequence of stimulus intensity
d[, 1] %>% as.data.frame() %>% na.omit() -> ri 
ri <- as.numeric(ri[, 1])
ri # reversal intensity

n <- length(ri) # number of reversals
n

mean(ri[(n - 4):n]) # average of last 5 values as an estimate of threshold