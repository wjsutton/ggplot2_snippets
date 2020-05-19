# Load libraries
library(dplyr)
library(ggplot2)
library(ggvoronoi)

# Load data source and give columns names
url <- 'https://raw.githubusercontent.com/exasol/sports-analytics/master/voronoi%20showcase/position_example.csv'
data <- read.csv(url,header = FALSE, stringsAsFactors = F, sep =';')
names(data) <- c("Match_ID","Match_Half","Team_ID","Player_ID","Frame","Time","x","y")

# Splitting ball position to its own column
ball <- dplyr::filter(data,Team_ID=="BALL")
players <- dplyr::filter(data,Team_ID!="BALL")
ball_adj <- ball[,c("Frame","x","y")]
names(ball_adj) <- c("ball_frame","ball_x","ball_y")
total <- left_join(players,ball_adj, by = c("Frame" = "ball_frame"))
total$colour <- factor(total$Team_ID)

# Filtering for just first frame
ff_total <- filter(total,Frame == 10000)

# Defining pitch size for voronoi plot
rectangle <- data.frame(x=c(55.5,55.5,-55.5,-55.5),y=c(-34,34,34,-34))

# Make first frame and test what image looks like
ff <- ggplot(ff_total,aes(x,y)) +
  geom_voronoi(aes(fill=colour),size=.125, outline = rectangle) +
  geom_vline(xintercept = 0,color = 'white',linetype='solid',size=0.5) +
  stat_voronoi(geom="path",outline = rectangle) +
  geom_point(size=3) +
  geom_point(aes(x = ball_x,y = ball_y),colour = "white", size = 1.5) +
  theme(
    panel.grid.major = element_blank() # Remove gridlines (major)
    ,panel.grid.minor = element_blank() # Remove gridlines (minor)
    ,panel.background = element_blank() # Remove grey background
    ,plot.title = element_text(hjust = 0, size = 20, colour = "#323232") # Title size and colour
    ,plot.subtitle = element_text(hjust = 0, size = 12, colour = "#323232") # Subtitle size and colour
    ,plot.caption = element_text(vjust = 0.3, size = 12, colour = "#323232") # Caption size and colour
    ,axis.ticks.y = element_blank() # Remove tick marks (Y-Axis)
    ,axis.text.y =  element_blank() # Remove scale marks (Y-Axis)
    ,axis.title.y = element_blank() # Remove axis label (Y-Axis) 
    ,axis.ticks.x = element_blank() # Remove tick marks (X-Axis)
    ,axis.text.x  = element_blank() # Remove axis scale (X-Axis)
    ,axis.title.x = element_blank() # Remove axis label (X-Axis) 
    ,legend.position="bottom"
  ) +
  scale_fill_discrete(name = element_blank(), labels = c("Team A", "Team B")) +
  labs(title = 'Controlling Space in a Football Match' # Title text
       ,caption = "Author: Will Sutton, Source: Exasol")

# Create test image
ggsave(filename = "test.png" # filename
       ,plot = ff # variable for file
       ,width = 6, height = 4, dpi = 300, units = "in") # dimensions and image quality