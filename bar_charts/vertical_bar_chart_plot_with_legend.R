# Load libraries
library(ggplot2)
library(reshape2)

# Create data
data <- data.frame(
  name=c("A","B","C","D","E"),  
  group=c("X","X","Y","Z","Y"),
  value=c(3,12,5,18,45)
)

# Reorder Legend
#data$group <- factor(data$group,levels(data$group)[c(1,3,2)])

barplot <- ggplot(data, aes(x=reorder(name, -value), y=value, fill = group)) + # enter data frame
  geom_bar(stat = "identity"
           ,colour = "black") + # colour bars
  scale_fill_manual("Legend", values = c("X" = "#323232", "Y" = "grey", "Z" = "white")) +
  geom_text(aes(label = value # data labels
               ,y =  value + max(value)*0.01) # positioned just outside bar
            ,vjust = 0 # align text with bar
            ,size = (5/14)*12 # sizing in line with theme text
            ,colour = "#323232") + # colour text
  theme(
    panel.grid.major = element_blank() # Remove gridlines (major)
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
  ) +
  geom_hline(yintercept=0, color = "black", size=1) + # Axis line size and colour (X-Axis)
  labs(title = 'My awesome descriptive title' # Title text
       ,subtitle = "Note: this is a subtitle" # Subtitle text
       ,x = 'Dimensions' # X-Axis text 
       ,y = 'Value (units)' # Y-Axis text 
       ,caption = "Author: My Name, Source: ") + # Caption text
  scale_y_continuous(limits = c(
    ifelse(min(data$value)>=0,0,min(data$value)*1.1) # Minimum Y-Axis scale 
    ,max(data$value)*1.1) # Maximum Y-Axis scale 
    ,expand = c(0,0) # Removing blank space around plot 
  )

# Save the plot
ggsave("vertical_bar_chart_with_legend.png" # filename
       ,plot = barplot # variable for file
       ,width = 5, height = 4, dpi = 300, units = "in") # dimensions and image quality
