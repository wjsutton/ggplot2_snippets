# Venn diagram with ggplot and ggforce
# plot circles to grid and then write annotations
library(ggplot2)
library(ggforce)    # Adds geom_circle

# Data frame to specify circle and text positions
data <- data.frame(x = c(0, 1, -1),
                   y = c(-0.5, 1, 1),
                   tx = c(0, 1.5, -1.5),
                   ty = c(-1, 1.3, 1.3),
                   cat = c("SET A", 
                           "SET B", 
                           "SET C"))

# Plot circles and text; add annotations for overlapping segments
venn <- ggplot(data, aes(x0 = x , y0 = -y, r = 1.5, fill = cat)) + 
  geom_circle(alpha = 0.3, size = 0, color = "white" ,show.legend = FALSE, fill="blue") + 
  geom_text(aes(x = tx , y = -ty, label = cat), size = 5) +
  annotate(geom="text", x=0, y=-1.5, label="B + C",color="white", size = 3) +
  annotate(geom="text", x=-0.9, y=0, label="A + C",color="white", size = 3) +
  annotate(geom="text", x=0.9, y=0, label="A + B",color="white", size = 3) +
  annotate(geom="text", x=0, y=-0.5, label="A + B\n + C",color="white", size = 3) +
  coord_equal() +
  theme(
    panel.grid.major = element_blank() # Remove gridlines (major)
    ,panel.grid.minor = element_blank() # Remove gridlines (minor)
    ,panel.background = element_blank() # Remove grey background
    ,plot.title = element_text(hjust = 0, size = 20, colour = "#323232") # Title size and colour
    ,plot.subtitle = element_text(hjust = 0, size = 12, colour = "#323232") # Subtitle size and colour
    ,plot.caption = element_text(vjust = 0.3, size = 12, colour = "#323232") # Caption size and colour
    ,axis.ticks.y = element_blank() # Remove tick marks (Y-Axis)
    ,axis.text.y = element_blank() # Remove Axis size and colour (Y-Axis)
    ,axis.title.y = element_text(size = 12, colour = "#323232") # Axis label size and colour (Y-Axis)
    ,axis.ticks.x = element_blank() # Remove tick marks (X-Axis)
    ,axis.text.x  = element_blank() # Remove Axis size and colour (X-Axis)
    ,axis.title.x = element_text(size = 12, colour = "#323232") # Axis label size and colour (X-Axis)
    ,legend.position = "bottom"
    ,plot.title.position = "plot"
    ,plot.caption.position =  "plot"
  ) +
  labs(title = 'My awesome descriptive title' # Title text
       ,subtitle = "Note: this is a subtitle" # Subtitle text
       ,x = element_blank() # X-Axis text 
       ,y = element_blank() # Y-Axis text 
       ,caption = "Author: My Name, Source: ")

# Save the plot
ggsave("simple_3_circle_venn.png" # filename
       ,plot = venn # variable for file
       ,width = 5, height = 4, dpi = 300, units = "in") # dimensions and image quality

