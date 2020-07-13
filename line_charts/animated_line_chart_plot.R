# Load Packages
library(httr)
library(readxl)
library(ggplot2)
library(gganimate)

# Get data
GET("https://query.data.world/s/2mskg3cu4s4buldij4yvatedrb4jev", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- read_excel(tf)
names(df) <- c("birth_year","percent_of_life")

# Build plot
plot <- ggplot(df, aes(birth_year, percent_of_life)) + 
  geom_area(color = '#720000',fill = '#720000') + 
  xlim(1905,2019) +
  scale_y_continuous(labels = scales::percent) +
  geom_segment(aes(xend = 0, yend = 1), linetype = 2, colour = '#720000') + 
  geom_point(size = 2,color = '#720000') + 
  guides(color = '#720000', fill = '#720000') +
  labs(title = 'The Percentage of Your Life America Has Been At War, 1905-2019'
       ,subtitle = 'If you were born in 1990 America has been at war for 67% of your life.'
       ,x = 'Birth Year'
       ,y = 'Percentage of Your Life The US Has Been At War'
       ,caption = 'Author: @WJSutton12, Data: Washington Post') +
  theme(plot.title = element_text(hjust = 0, size = 14),
        plot.subtitle = element_text(hjust = 0, size = 10),
        plot.caption = element_text(vjust = 0.3, size = 10),
        axis.ticks.y = element_blank(),  
        axis.ticks.x = element_blank(), 
        axis.title.x = element_text(size = 12),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        plot.margin = margin(1,1,1,1, "cm")) + 
  transition_reveal(birth_year)

# Set animation
anim <- animate(plot,200, duration = 10, width = 500, height = 400,start_pause=0, end_pause=30)

# Save animation
anim_save("percentage_of_your_life_america_has_been_at_war.gif", anim)