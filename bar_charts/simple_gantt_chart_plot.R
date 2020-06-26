# Load libraries
library(ggplot2)
library(reshape2)
library(dplyr)

# Create Horizontal Stacked bar chart 
# then white our some bars 
# to create gantt chart

# Create projects data
data <- data.frame(
  name=c("A","B","C","D"),  
  start=c("2015-09-01","2016-03-01","2018-06-01","2019-01-01"),
  end=c("2016-03-01","2018-06-01","2019-01-01","2020-06-01")
)

data$type <- 'Project'

data$start <- as.Date(data$start)
data$end <- as.Date(data$end)

start_date <- min(data$start)
end_date <- max(data$end)

# Creating before and after project data
# These will be the white bars in our 
# stacked bar chart

post_project <- data.frame(
  name=data$name,
  start=data$end,
  end=end_date,
  type='Post Project'
)

pre_project <- data.frame(
  name=data$name,
  start=start_date,
  end=data$start,
  type='Pre Project'
)

data_stack <- rbind(pre_project,data,post_project)
data_stack <- filter(data_stack,start != end)


# Calculate Duration
data_stack$duration <- as.integer(data_stack$end-data_stack$start)
#data_stack$duration_label <- ifelse(type='Project',paste0(duration," days"),'')
  
# Legend as factor, no reorder needed
data_stack$type <- as.factor(data_stack$type)
data_stack$type <- factor(data_stack$type,rev(levels(data_stack$type)))


gantt <- ggplot(data_stack, aes(fill=type, x=name, y=duration)) + # enter data frame
  geom_bar(position="stack"
           ,stat = "identity"
           ,colour = "white" # colour borders
           ,show.legend = FALSE) + # remove legend
  scale_fill_manual("Legend", values = c("Pre Project" = "#FFFFFF", "Project" = "#3374FF", "Post Project" = "#FFFFFF")) +
  coord_flip() + # flip vertical bars into horizontal bar
  geom_text(aes(label = ifelse(type=='Project',paste0(duration," days"),'') # data labels
                ,y =  as.integer(end - start_date) + max(duration)*0.01) # positioned just outside bar
              ,size = (5/14)*12 # sizing in line with theme text
              ,colour = "#323232" #colour text
              ,hjust = 0) + #align text
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
    ,axis.text.x  = element_blank() # Remove axis scale (X-Axis)
    ,axis.title.x = element_text(size = 12, colour = "#323232") # Axis label size and colour (X-Axis)
  ) +
  geom_hline(yintercept=0, color = "black", size=0.5) + # Axis line size and colour (X-Axis)
  labs(title = element_blank() # Title text
       ,subtitle = element_blank() # Subtitle text
       ,x =  "Project" # X-Axis text 
       ,y = paste0(format(min(data_stack$start),"%b %Y"),' - ',format(max(data_stack$end),"%b %Y")) # Y-Axis text 
       ,caption = element_blank()) + # Caption text
  ylim(0,as.integer(max(data_stack$end) - min(data_stack$start))*1.1)

# Save the plot
ggsave("simple_gantt.png" # filename
       ,plot = gantt # variable for file
       ,width = 9, height = 3, dpi = 300, units = "in") # dimensions and image quality
