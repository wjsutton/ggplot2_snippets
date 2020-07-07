# Load libraries
library(ggplot2)
library(reshape2)

# Create data
data <- data.frame(
  x_axis=1:10 ,  
  y_axis=1:10
)

blankplot <- ggplot(data, aes(x=x_axis, y=y_axis)) + # enter data frame
  xlim(0,10) + # ignore (setting chart limits)
  ylim(0,10) + # ignore (setting chart limits)
  
  # Build a custom legend:
  # annotate squares on to grid
  annotate(xmin = 8, xmax = 8.5,
           ymin = 2, ymax = 2.5,  
           geom = "rect", fill = "#B3CBFF") +
  annotate(xmin = 8, xmax = 8.5, 
           ymin = 1, ymax = 1.5, 
           geom = "rect", fill = "#3374FF") +
  # annotate text labels on to grid
  annotate("text", x = 8.6, y = 2.25, label = " A", hjust = 0) +
  annotate("text", x = 8.6, y = 1.25, label = " B", hjust = 0) 

# Save the plot
ggsave("custom_cat_legend.png" # filename
       ,plot = blankplot # variable for file
       ,width = 5, height = 4, dpi = 300, units = "in") # dimensions and image quality
