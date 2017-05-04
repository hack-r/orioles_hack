# adding ggplot2 functions to customize animateFX() output won't work, but
# you can pass a list to the layer argument like this:
x <- list(
  facet_grid(pitcher_name ~ stand, labeller = label_both), 
  theme_bw(), 
  coord_equal()
)
animateFX(pitches, layer = x)

animateFX(pitches, avg.by = "pitch_types", layer = x)

#Interactive 3D plots
# 
# pitchRx also makes use of rgl graphics. If I want a more revealing look as Mariano Rivera’s pitches, I can subset the pitches data frame accordingly. Note that the plot below is interactive, so make sure you have JavaScript & WebGL enabled (if you do, go ahead - click and drag)!
#   
  Rivera <- subset(pitches, pitcher_name == "Mariano Rivera")
interactiveFX(Rivera)