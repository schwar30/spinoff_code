# install.packages("googlesheets")
library(googlesheets)
library(dplyr)

paid_search <- read.csv("~/Desktop/Paid Search Leads.csv")
paid_search <- paid_search[1:100, 1:26]

mtcars_sheet <- gs_new(title = "paid test", ws_title = "first_sheet", input = paid_search,
                       col_extent = ncol(paid_search), 
                       row_extent = nrow(paid_search))

mtcars_sheet <- mtcars_sheet %>% 
  gs_edit_cells(ws = "first_sheet", anchor = "L2", input = rownames(mtcars), byrow = F)

View(mtcars)
View(paid_search)

class(mtcars)
class(paid_search)
