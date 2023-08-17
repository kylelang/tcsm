### Title:    Lecture 2 Code Examples
### Author:   Kyle M. Lang
### Created:  2023-08-17
### Modified: 2023-08-17

rm(list = ls(all = TRUE))

source("supportFunctions.R")

library(dplyr)
library(lavaan)
library(tidySEM)

install.packages("tidySEM", repos = "https://cloud.r-project.org")

dataDir <- "../data/"

diabetes <- readRDS(paste0(dataDir, "diabetes.rds"))

mod1 <- '
## Define the structural relations:
bp + glu ~ age + male

## Do not allow the input variables to covary:
age ~~ 0 * male
'

out <- diabetes %>% 
  mutate(male = ifelse(sex == "male", 1, 0)) %>% 
  sem(mod1, data = ., fixed.x = FALSE)

partSummary(out, 7:10)

