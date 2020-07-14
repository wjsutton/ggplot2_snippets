# Load Packages
library(httr)
library(readxl)
library(ggplot2)
library(gganimate)

# Get data
GET("https://query.data.world/s/2mskg3cu4s4buldij4yvatedrb4jev", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- read_excel(tf)
names(df) <- c("birth_year","percent_of_life")

# Build plot
plot <- ggplot(df, aes(birth_year, percent_of_life)) + 
  geom_area(color = '#720000',fill = '#720000') + 
  xlim(1905,2019) +
  scale_y_continuous(labels = scales::percent) +
  geom_segment(aes(xend = 0, yend = 1), linetype = 2, colour = '#720000') + 
  geom_point(size = 2,color = '#720000') + 
  guides(color = '#720000', fill = '#720000') +
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
       ,caption = "Author: My Name, Source: ") +
  transition_reveal(birth_year)

# Set animation
anim <- animate(plot,200, duration = 10, width = 5, height = 4, units = 'in', res = 100, start_pause=0, end_pause=30)

# Save animation
anim_save("percentage_of_your_life_america_has_been_at_war.gif", anim)