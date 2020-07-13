# Libraries
library(ggplot2)
library(dplyr)
library(directlabels)
library(babynames)

# Keep only 1 name
don <- babynames %>% 
  filter(name=="Ashley") %>%
  filter(sex=="F")

# create subset for annotations
last_value <- don[nrow(don),]
max_value <- don %>% filter(n == max(don$n))

# Plot
lineplot <- ggplot(don, aes(x=year, y=n)) +
  geom_area(fill="#7f7fff", alpha = 0.4) +
  geom_line(color="#7f7fff", size=2) +
  theme(
    panel.grid.major = element_blank() # Remove gridlines (major)
    ,panel.grid.minor = element_blank() # Remove gridlines (minor)
    ,panel.background = element_blank() # Remove grey background
    ,plot.title = element_text(hjust = 0, size = 20, colour = "#323232") # Title size and colour
    ,plot.subtitle = element_text(hjust = 0, size = 12, colour = "#323232") # Subtitle size and colour
    ,plot.caption = element_text(vjust = 0.3, size = 12, colour = "#323232") # Caption size and colour
    ,axis.ticks.y = element_blank() # Remove tick marks (Y-Axis)
    ,axis.text.y = element_text(hjust = 1, colour = "#323232", size = 12) # Axis size and colour (Y-Axis)
    ,axis.title.y = element_text(size = 12, colour = "#323232") # Axis label size and colour (Y-Axis)
    ,axis.ticks.x = element_blank() # Remove tick marks (X-Axis)
    ,axis.text.x  = element_text(hjust = 1, colour = "#323232", size = 12) # Axis size and colour (X-Axis)
    ,axis.title.x = element_text(size = 12, colour = "#323232") # Axis label size and colour (X-Axis)
  ) +
  labs(title = 'My awesome descriptive title' # Title text
       ,subtitle = "Note: this is a subtitle" # Subtitle text
       ,x = 'Value (units)' # X-Axis text 
       ,y = 'Value (units)' # Y-Axis text 
       ,caption = "Author: My Name, Source: ") + # Caption text
  scale_y_continuous(limits = c(
    ifelse(min(don$n)>=0,0,min(don$n)*1.05) # Minimum Y-Axis scale
    ,max(don$n)*1.10) # Maximum Y-Axis scale 
    ,expand = c(0,0) # Removing blank space around plot (Y-Axis)
  ) +
  annotate("text" # adding last value on line as annotation 
           ,x = last_value$year
           ,y = last_value$n +(max(don$n) * 0.05)
           ,label = round(last_value$n,1)
           ,color = "#323232") +
  annotate("text" # adding max value on line as annotation 
           ,x = max_value$year
           ,y = max_value$n * 1.05
           ,label = round(max_value$n,1)
           ,color = "#323232")

# Save the plot
ggsave("line_chart_single.png" # filename
       ,plot = lineplot # variable for file
       ,width = 5, height = 4, dpi = 300, units = "in") # dimensions and image quality
