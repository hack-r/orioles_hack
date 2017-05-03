

# Lahaman -----------------------------------------------------------------
if(reload){
  lahaman <- readRDS("lahaman_data.RDS")
} else{
  
  head(Master)  
}


# pitchRx -----------------------------------------------------------------
# http://cpsievert.github.io/pitchRx/

# By default, scrape() returns a list of 5 data frames. 
# The 'pitch' data frame contains the actual PITCHf/x data which is recorded on a 
# pitch-by-pitch basis. Supports writing directly to a DB.

if(reload){
  pitchfx <- readRDS("pitchfx.RDS")
  gids    <- data(gids, package = "pitchRx")
} else{
  gids      <- data(gids, package = "pitchRx")
  dat       <- scrape("2015-01-01", "2017-12-31") # Features: "atbat"  "action" "pitch"  "po" "runner"
  locations <- select(dat$pitch, pitch_type, start_speed, px, pz, des, num, gameday_link)
  names     <- select(dat$atbat, pitcher, batter, pitcher_name, batter_name, num, gameday_link, event, stand)
  # data      <- names %>% 
  #   filter(pitcher_name == "Jacob DeGrom") %>% 
  #   inner_join(locations, ., by = c("num", "gameday_link"))
  
  #db <- src_sqlite("pitchfx.sqlite3", create = T)
  #scrape(start = "2008-01-01", end = Sys.Date(), connect = db$con)
  
}



