library(tidyverse)
library(stringr)
library(xml2)

links_df <- read.csv("tv-live-graphics-list.csv") %>% 
  filter(type != "list_of_files")

# Create chart node
links_xml <- xml_new_root("links")


# Add data rows
for (i in 1:nrow(links_df)) {
  row_node <- xml_add_child(links_xml, "dataPoint")
  for (col_name in names(links_df)) {
    xml_add_child(row_node, col_name, as.character(links_df[i, col_name]))
  }
}



# Write XML to file
write_xml(links_xml, "links.xml")
