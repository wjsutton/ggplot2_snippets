# Libraries
library(ggplot2)
library(dplyr)
library(babynames)

# Load dataset
data <- babynames %>% 
  filter(name %in% c("Mary","Emma", "Ida", "Ashley", "Amanda", "Jessica","Patricia", "Linda", "Deborah",   "Dorothy", "Betty", "Helen")) %>%
  filter(sex=="F")

# Duplicating column for color components
tmp <- data %>%
  mutate(name2=name)

small_multiples <- tmp %>%
  ggplot( aes(x=year, y=n)) +
  geom_line( data=tmp %>% dplyr::select(-name), aes(group=name2), color="grey", size=0.5, alpha=0.5) + # ploting all lines
  geom_line( aes(color=name), color="#7f7fff", size=0.8 ) + # plotting just blue lines
  theme(
    panel.grid.major = element_blank() # Remove gridlines (major)
    ,panel.grid.minor = element_blank() # Remove gridlines (minor)
    ,panel.background = element_blank() # Remove grey background
    ,plot.title = element_text(hjust = 0, size = 20, colour = "#323232") # Title size and colour
    ,plot.subtitle = element_text(hjust = 0, size = 12, colour = "#323232") # Subtitle size and colour
    ,plot.caption = element_text(vjust = 0.3, size = 12, colour = "#323232") # Caption size and colour
    ,axis.ticks.y = element_blank() # Remove tick marks (Y-Axis)
    ,axis.text.y = element_text(hjust = 1, colour = "#323232", size = 8) # Axis size and colour (Y-Axis)
    ,axis.title.y = element_text(size = 10, colour = "#323232") # Axis label size and colour (Y-Axis)
    ,axis.ticks.x = element_blank() # Remove tick marks (X-Axis)
    ,axis.text.x  = element_text(hjust = 1, colour = "#323232", size = 8) # Axis size and colour (X-Axis)
    ,axis.title.x = element_text(size = 10, colour = "#323232") # Axis label size and colour (X-Axis)
    ,strip.background = element_blank() # removing individual title backgrounds
    ,strip.text.x = element_text(size = 10, colour = "#323232") # text size for individual titles
  ) +
  labs(title = 'My awesome descriptive title' # Title text
       ,subtitle = "Note: this is a subtitle" # Subtitle text
       ,x = 'Value (units)' # X-Axis text 
       ,y = 'Value (units)' # Y-Axis text 
       ,caption = "Author: My Name, Source: ") +
  facet_wrap(~name)

# Save the plot
ggsave("line_chart_small_multiples.png" # filename
       ,plot = small_multiples # variable for file
       ,width = 5, height = 4, dpi = 300, units = "in") # dimensions and image quality
