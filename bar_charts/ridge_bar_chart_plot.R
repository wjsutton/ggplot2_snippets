# library
library(ggridges)
library(ggplot2)

# Diamonds dataset is provided by R natively
#head(diamonds)

ridge_bar <- ggplot(diamonds, aes(x = price, y = cut, fill = cut)) +
  geom_density_ridges(alpha = .6, colour =  "black",stat="binline", bins=100) +
  #scale_fill_manual("Legend", values = c("Fair" = "#3374FF", "Good" = "#B3CBFF", "Very Good" = "#FFE880", "Premium" = "#B3CBFF", "Ideal" = "#FFE880")) +
  theme(panel.grid.major = element_blank() # Remove gridlines (major)
        ,panel.grid.minor = element_blank() # Remove gridlines (minor)
        ,panel.background = element_blank() # Remove grey background
        ,plot.title = element_text(hjust = 0, size = 20, colour = "#323232") # Title size and colour
        ,plot.subtitle = element_text(hjust = 0, size = 12, colour = "#323232") # Subtitle size and colour
        ,plot.caption = element_text(vjust = 0.3, size = 12, colour = "#323232") # Caption size and colour
        ,axis.ticks.y = element_blank() # Remove tick marks (Y-Axis)
        ,axis.text.y = element_text(hjust = 1, colour = "#323232", size = 12) # Axis size and colour (Y-Axis)
        ,axis.ticks.x = element_blank() # Remove tick marks (X-Axis)
        ,axis.text.x  = element_text(size = 12, colour = "#323232") #element_blank() # Remove axis scale (X-Axis)
        ,axis.title.x = element_text(size = 12, colour = "#323232") # Axis label size and colour (X-Axis)
        ,legend.position = "none"
  ) +
  geom_hline(yintercept=0, color = "black", size=1) + # Axis line size and colour (X-Axis)
  labs(title = 'My awesome descriptive title' # Title text
       ,subtitle = "Note: this is a subtitle" # Subtitle text
       ,x = 'Value (units)' # X-Axis text 
       ,y = element_blank() # Y-Axis text 
       ,caption = "Author: My Name, Source: ")# + # Caption text

# Save the plot
ggsave("ridge_bar_chart.png" # filename
       ,plot = ridge_bar # variable for file
       ,width = 5, height = 4, dpi = 300, units = "in") # dimensions and image quality
