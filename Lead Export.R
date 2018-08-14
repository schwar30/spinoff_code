library(dplyr)
library(stringr)
library(ReporteRs)

phone <- read.csv("~/Desktop/SterlingTrackingNumbers2.csv")
phone_export <- read.csv("~/Desktop/lead export.csv")

phone <- phone %>% 
  select(Phone.Number, Phone.Label) %>% 
  filter(Phone.Number != "") %>% 
  rename("phone_label" = Phone.Label)%>% 
  filter(!str_detect(phone_label, "Direct Transfer"))

phone$Phone.Number <- gsub("[[:punct:]]", "", phone$Phone.Number)
phone$Phone.Number <- gsub("\\s", "", phone$Phone.Number)
phone$Phone.Number <- as.numeric(phone$Phone.Number)

phone_export <- phone_export %>% 
  select(Campaign, IVR.Number, SentTo) %>% 
  # rename("phone_label" = SentTo) %>% 
  filter(IVR.Number != "") %>% 
  rename("Phone.Number" = IVR.Number)

phone$Phone.Number <- as.numeric(phone$Phone.Number)

# View(phone_export)
# View(phone)

number_selection <- left_join(phone_export, phone, by = "Phone.Number")
# View(number_selection)

number_selection <- number_selection %>% 
  filter(Campaign == "Phone") %>% 
  group_by(phone_label) %>% 
  count() %>% 
  filter(phone_label != "")
View(number_selection)

# number_selection <- left_join(number_selection, phone_export, by = "phone_label")
# View(number_selection)

number_selection <- number_selection %>% 
  distinct() %>% 
  arrange(dnis)
View(number_selection)


