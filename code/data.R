# Lahaman -----------------------------------------------------------------
head(Master)

# pitchRx -----------------------------------------------------------------
dat <- scrape("2015-05-21", "2015-05-21")
locations <- select(dat$pitch, pitch_type, start_speed, px, pz, des, num, gameday_link)
names <- select(dat$atbat, pitcher, batter, pitcher_name, batter_name, num, gameday_link, event, stand)
data <- names %>% filter(pitcher_name == "Jacob DeGrom") %>% inner_join(locations, ., by = c("num", "gameday_link"))
