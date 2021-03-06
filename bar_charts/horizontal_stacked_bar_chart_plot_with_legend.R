# Load libraries
library(ggplot2)
library(reshape2)

# Create data
data <- data.frame(
  name=c("A","B","A","B","C","C"),  
  colour=c("X","X","Y","Y","Y","Z"),
  value=c(4,12,5,18,45,4)
)

# Reorder Legend
#data$group <- factor(data$group,levels(data$group)[c(1,3,2)])

barplot <- ggplot(data, aes(fill=colour, x=name, y=value)) + # enter data frame
  geom_bar(position="stack"
           ,stat = "identity"
           ,colour = "black") + # colour bars
  scale_fill_manual("Legend", values = c("X" = "#3374FF", "Y" = "#B3CBFF", "Z" = "#FFE880")) +
  coord_flip() + # flip vertical bars into horizontal bar
  geom_text(aes(label = value) # data labels
            ,size = (5/14)*12 # sizing in line with theme text
            ,position = position_stack(vjust = 0.5)
            ,colour = "#323232") + # colour text
  stat_summary(fun.y = sum, aes(label = ..y.., group = name), geom = "text", hjust = -.2) +
  theme(    panel.grid.major = element_blank() # Remove gridlines (major)
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
    ,legend.position = "bottom"
  ) +
  geom_hline(yintercept=0, color = "black", size=1) + # Axis line size and colour (X-Axis)
  labs(title = 'My awesome descriptive title' # Title text
       ,subtitle = "Note: this is a subtitle" # Subtitle text
       ,x = 'Dimensions' # X-Axis text 
       ,y = 'Value (units)' # Y-Axis text 
       ,caption = "Author: My Name, Source: ")# + # Caption text

# Save the plot
ggsave("stacked_horizontal_bar_chart.png" # filename
       ,plot = barplot # variable for file
       ,width = 5, height = 4, dpi = 300, units = "in") # dimensions and image quality
