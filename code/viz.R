# adding ggplot2 functions to customize animateFX() output won't work, but
# you can pass a list to the layer argument like this:
x <- list(
  facet_grid(pitcher_name ~ stand, labeller = label_both), 
  theme_bw(), 
  coord_equal()
)
animateFX(pitches, layer = x)