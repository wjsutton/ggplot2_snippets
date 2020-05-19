## Animated Voronoi Charts in R

This workflow builds from Eva Murray's tutorial on building a Voronoi chart in Tableau here: [Controlling space in football - Exasol](https://www.exasol.com/en/blog/controlling-space-in-football/). Eva demoed the process at a Tableau London User Group, which led me to think whether it could be achieved using R as well.

<div style="text-align:center">
<img src="/images/football_voronoi_20_speed_compressed.gif" style="width:80%;height:80%;">
</div>

**What is it?**

A Voronoi chart (or diagram) overlays a regular scatter chart and divides the chart up drawing line representing the area closest to each point on the scatter chart. For our example of football, this shows roughly how much space each player controls, i.e. if the ball was stationary in a player's area they should be able to gain possession before the other players. Other factors that can affect this which we haven't considered e.g. player speed and reaction times. 

**Outline of process**

1. Set up an individual frame
2. Write all frames to a folder
3. Knit frames together with ScreenToGif
4. Speed up gif and reduce the size using ezgif.com

**1. Set up an individual frame**

In R:

```r
# Load libraries
library(ggvoronoi)
library(gganimate)
library(dplyr)

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
```
This will generate an image "test.png" which you can check whether this is the output you want for you gif, if not amend the code above.

**2. Write all frames to a folder**

If you are happy with the image generated in step 1 now you just have to write a loop to generate all the frames. It is advisable to write these images to a separate folder, as it will make the import to ScreenToGif less taxing.

In R:

```r
# Loop through all frames
for(i in (min(total$Frame):max(total$Frame))){

  frame <- filter(total,Frame == i)

  plot <- ggplot(frame,aes(x,y)) +
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
  
  # Save the plot
  ggsave(filename = paste0("frames/frame_",i,".png") # filename
         ,plot = plot # variable for file
         ,width = 6, height = 4, dpi = 300, units = "in") # dimensions and image quality
  
  # Writing print to console so you can check where the code is
  print(paste0("Frame: ",i," done!"))
}
```

**3. Knit frames together with ScreenToGif**

- Open [ScreenToGif](https://www.screentogif.com/) 
- Select "Editor"
- Select "File > Load"
- Navigate to where you have saved the frames
- Select all and click "Open"
- Wait for the frames to load
- Select "Edit > Override" - this changes the delay between frames
- Enter "10" - this changes the time between frames to 10 milliseconds this is currently the shortest time between frames
- Select "File > Save as"
- Then check the following:

    - File Type: Gif
    - [x] Looped Gif
    - [x] Repeat Forever
    - [x] Detect unchanged pixels
    - [x] Save the file to a folder of your choice
- Select Save and wait for the gif to be made

**4. Speed up gif and reduce the size using ezgif.com**

If the gif is too slow you can speed it up using [ezgif.com/speed](https://ezgif.com/speed) upload your gif and then you can select to increase the speed and optimize the size of the gif.
