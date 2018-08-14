phone <- read.csv("~/Desktop/SterlingTrackingNumbers2.csv")
phone_export <- read.csv("~/Desktop/phone export2.csv")

phone <- phone %>% 
  select(Phone.Number, Phone.Label) %>% 
  filter(Phone.Number != "") %>% 
  rename("phone_label" = Phone.Label)

phone_export <- phone_export %>% 
  select(dnis, phone_label)

# View(phone_export)
# View(phone)

number_selection <- left_join(phone_export, phone, by = "phone_label")
# View(number_selection)

number_selection <- number_selection %>% 
  filter(Phone.Number != "") %>% 
  group_by(phone_label) %>% 
  count() %>% 
  filter(!str_detect(phone_label, "Direct Transfer"))
# View(number_selection)

number_selection <- left_join(number_selection, phone_export, by = "phone_label")
# View(number_selection)

number_selection <- number_selection %>% 
  distinct() %>% 
  arrange(dnis) %>% 
  select(phone_label, dnis, n)
View(number_selection)

slide <- pptx(template = "~/Desktop/flextable.pptx")

names_selection <- number_selection
number_selection_flex <- number_selection %>% 
  FlexTable(body.text.props = textProperties(font.size = 12, font.family = "Calibri"), header.columns = F) %>% 
  addHeaderRow(value = names(names_selection), text.properties = textProperties(font.size = 14, font.family = "Arial", font.weight = "bold", color = "white")) %>% 
  setFlexTableBorders(inner.vertical = borderNone(), inner.horizontal = borderNone(), outer.vertical = borderNone(), outer.horizontal = borderNone()) %>% 
  setZebraStyle(odd = "#eaeaea", even = "white") %>% 
  setFlexTableBackgroundColors(i = 1, colors = "#0A3C6E", to = "header")

flex_for_export <- slide %>% 
  addSlide("table") %>% 
  addFlexTable(number_selection_flex) %>% 
  writeDoc("~/Desktop/calls.pptx")
