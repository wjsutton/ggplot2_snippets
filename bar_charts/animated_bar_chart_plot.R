### Bar Chart Race Gif
# AKA: Animated Bar Chart Race

# Load Libraries
library(gganimate)
library(gifski)
library(dplyr)
library(babynames)

# Get data and find top 10 by year
girls_names <- babynames %>% filter(sex=="F")

top_10_names_by_year <- girls_names %>%
  group_by(year) %>%
  top_n(10)

top_10_names_by_year$bar_rank <- rep(c(1:10),nrow(top_10_names_by_year)/10)

# Build plot
bar_chart <- ggplot(top_10_names_by_year, aes(bar_rank, year, name)) +
  geom_tile(aes(y = prop/2, height = prop, width = 0.9), color = NA) +
  geom_text(aes(y = prop, label = paste(name, " ")), hjust = 1, size = 4, color = "white") +
  geom_text(aes(y=prop,label = paste0(" ",round(prop*100,1),"%"), hjust=0.1), size = 4) +
  geom_text(aes(10, 0.05),label = {as.character(top_10_names_by_year$year)}, size = 20, hjust = 0, vjust = -0.2,color = "grey") +
  coord_flip(clip = "off", expand = FALSE) +
  scale_x_reverse() +
  ylim(0, 0.08) +
  guides(color = FALSE, fill = FALSE) +
  labs(title = "Top 10 Names for Girls Born in {closest_state}"
       ,subtitle = element_blank()
       ,x = element_blank()
       ,y = 'Proportion of babies born with this name'
       ,caption = "Author: @WJSutton12, Source: R package 'babynames'") +
  theme(
    panel.grid.major = element_blank() # Remove gridlines (major)
    ,panel.grid.minor = element_blank() # Remove gridlines (minor)
    ,panel.background = element_blank() # Remove grey background
    ,plot.title = element_text(hjust = 0, size = 20, colour = "#323232") # Title size and colour
    ,plot.subtitle = element_text(hjust = 0, size = 12, colour = "#323232") # Subtitle size and colour
    ,plot.caption = element_text(vjust = 0.3, size = 12, colour = "#323232") # Caption size and colour
    ,axis.ticks.y = element_blank() # Remove tick marks (Y-Axis)
    ,axis.text.y = element_blank() # Remove Axis size and colour (Y-Axis)
    ,axis.title.y =  element_blank() #element_text(size = 12, colour = "#323232") # Axis label size and colour (Y-Axis)
    ,axis.ticks.x = element_blank() # Remove tick marks (X-Axis)
    ,axis.text.x  = element_blank() # Remove Axis size and colour (X-Axis)
    ,axis.title.x = element_text(size = 12, colour = "#323232") # Axis label size and colour (X-Axis)
    ,legend.position = "bottom"
    ,plot.title.position = "plot"
    ,plot.caption.position =  "plot"
  ) +
  transition_states(year, transition_length = 4, state_length = 0.5) +
  ease_aes('cubic-in-out')

# Set the animation and save as gif
anim <- animate(bar_chart,200, duration = 40, width = 5, height = 4, units = "in", res = 150, start_pause=3, end_pause=10)  
anim_save("bar_chart_race.gif", anim)