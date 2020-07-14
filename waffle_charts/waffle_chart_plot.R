#install.packages("extrafont")
#install.packages("waffle", repos = "https://cinc.rud.is")
library(waffle)
library(ggplot2)

# 2019 UK Election results
data <- data.frame(
  parts = c("Con","Lab","SNP","Other"),
  values = c(365, 202, 48, 35)
)

waffle <- ggplot(data, aes(fill=parts, values=values)) +
  geom_waffle(color = "white", size=1, n_rows = 25) +
  scale_x_discrete(expand=c(0,0)) + # removes x axis
  scale_y_discrete(expand=c(0,0)) + # removes y axis
  scale_fill_manual("Party", values = c("Con" = "#1E90FF","Lab" = "#DC143C","SNP"="#CCCC00","Other" = "#D3D3D3")) +
  coord_equal() + 
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
    ,legend.position = "bottom"
  ) +
  labs(title = 'My awesome descriptive title' # Title text
       ,subtitle = "Note: this is a subtitle" # Subtitle text
       ,x = '1 Square = 1 UK Constituency' # X-Axis text 
       ,y = element_blank() # Y-Axis text 
       ,caption = "Author: My Name, Source: ")

# Save the plot
ggsave("waffle_chart.png" # filename
       ,plot = waffle # variable for file
       ,width = 5, height = 4, dpi = 300, units = "in") # dimensions and image quality


