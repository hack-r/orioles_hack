

# Lahaman -----------------------------------------------------------------
if(reload){
  Teams               <- readRDS("Teams.RDS")
  teams0              <- readRDS("teams0.RDS")
  Batting             <- readRDS("Batting.df.RDS")
  BattingPost         <- readRDS("BattingPost.df.RDS")
  Pitching            <- readRDS("Pitching.df.RDS")
  Fielding            <- readRDS("Fielding.df.RDS")
  battingLabels       <- readRDS("battingLabels.df.RDS")
  fieldingLabels      <- readRDS("fieldingLabels.df.RDS")
  pitchingLabels      <- readRDS("pitchingLabels.df.RDS")
  Appearances         <- readRDS("Appearances.df.RDS")
  AwardsManagers      <- readRDS("AwardsManagers.df.RDS")
  AwardsPlayers       <- readRDS("AwardsPlayers.df.RDS")
  AllstarFull         <- readRDS("AllstarFull.df.RDS")
  AwardsShareManagers <- readRDS("AwardsShareManagers.df.RDS")
  AwardsSharePlayers  <- readRDS("AwardsSharePlayers.df.RDS")
  FieldingOF          <- readRDS("FieldingOF.df.RDS")
  FieldingPost        <- readRDS("FieldingPost.df.RDS")
  HallOfFame          <- readRDS("HallOfFame.df.RDS")
  Label               <- readRDS("Label.df.RDS")
  LahmanData          <- readRDS("LahmanData.df.RDS")
  Managers            <- readRDS("Managers.df.RDS")
  ManagersHalf        <- readRDS("ManagersHalf.df.RDS")
  Master              <- readRDS("Master.df.RDS")
  Pitching            <- readRDS("Pitching.df.RDS")
  pitchingLabels      <- readRDS("pitchingLabels.df.RDS")
  PitchingPost        <- readRDS("PitchingPost.df.RDS")
  playerInfo          <- readRDS("playerInfo.df.RDS")
  Salaries            <- readRDS("Salaries.df.RDS")
  Schools             <- readRDS("Schools.df.RDS")
  SeriesPost          <- readRDS("SeriesPost.df.RDS")
  teamInfo            <- readRDS("teamInfo.df.RDS")
  TeamsFranchises     <- readRDS("TeamsFranchises.df.RDS")
  TeamsHalf           <- readRDS("TeamsHalf.df.RDS")
  
} else{
  head(Master)  
  saveRDS(Teams, "Teams.RDS")
  saveRDS(Batting, "Batting.df.RDS")
  saveRDS(BattingPost, "BattingPost.df.RDS")
  saveRDS(Pitching,"Pitching.df.RDS")
  saveRDS(Fielding,"Fielding.df.RDS")
  saveRDS(battingLabels,"battingLabels.df.RDS")
  saveRDS(fieldingLabels,"fieldingLabels.df.RDS")
  saveRDS(pitchingLabels,"pitchingLabels.df.RDS")
  saveRDS(Appearances,"Appearances.df.RDS")
  saveRDS(AwardsManagers,"AwardsManagers.df.RDS")
  saveRDS(AwardsPlayers,"AwardsPlayers.df.RDS")
  saveRDS(AwardsShareManagers,"AwardsShareManagers.df.RDS")
  saveRDS(AwardsSharePlayers,"AwardsSharePlayers.df.RDS")
  saveRDS(FieldingOF,"FieldingOF.df.RDS")
  saveRDS(AllstarFull,"AllstarFull.df.RDS")
  saveRDS(FieldingPost,"FieldingPost.df.RDS")
  saveRDS(HallOfFame,"HallOfFame.df.RDS")
  saveRDS(Label,"Label.df.RDS")
  saveRDS(LahmanData,"LahmanData.df.RDS")
  saveRDS(Managers,"Managers.df.RDS")
  saveRDS(ManagersHalf,"ManagersHalf.df.RDS")
  saveRDS(Master,"Master.df.RDS")
  saveRDS(Pitching,"Pitching.df.RDS")
  saveRDS(pitchingLabels,"pitchingLabels.df.RDS")
  saveRDS(PitchingPost,"PitchingPost.df.RDS")
  saveRDS(playerInfo,"playerInfo.df.RDS")
  saveRDS(Salaries,"Salaries.df.RDS")
  saveRDS(Schools,"Schools.df.RDS")
  saveRDS(SeriesPost,"SeriesPost.df.RDS")
  saveRDS(teamInfo,"teamInfo.df.RDS")
  saveRDS(Teams,"Teams.df.RDS")
  saveRDS(TeamsFranchises,"TeamsFranchises.df.RDS")
  saveRDS(TeamsHalf,"TeamsHalf.df.RDS")
  
  
  teams0 <- Teams %>% 
    filter(yearID >= 1901 & lgID %in% c("AL", "NL")) %>%
    group_by(yearID, teamID) %>%
    mutate(TB = H + X2B + 2 * X3B + 3 * HR,
           WinPct = W/G,
           rpg = R/G,
           hrpg = HR/G,
           tbpg = TB/G,
           kpg = SO/G,
           k2bb = SO/BB,
           whip = 3 * (H + BB)/IPouts)
  saveRDS(teams0, "teams0.RDS")
}


# pitchRx -----------------------------------------------------------------
# http://cpsievert.github.io/pitchRx/

# By default, scrape() returns a list of 5 data frames. 
# The 'pitch' data frame contains the actual PITCHf/x data which is recorded on a 
# pitch-by-pitch basis. Supports writing directly to a DB.

if(reload){
  pitchfx <- readRDS("pitchfx.RDS")
  gids    <- readRDS("gids.RDS")
} else{
  data(gids, package = "pitchRx")
  saveRDS(gids, "gids.RDS")
  dat       <- scrape("2016-01-01", Sys.Date()) # Features: "atbat"  "action" "pitch"  "po" "runner"
  locations <- select(dat$pitch, pitch_type, start_speed, px, pz, des, num, gameday_link)
  names     <- select(dat$atbat, pitcher, batter, pitcher_name, batter_name, num, gameday_link, event, stand)
  # data      <- names %>% 
  #   filter(pitcher_name == "Jacob DeGrom") %>% 
  #   inner_join(locations, ., by = c("num", "gameday_link"))
  
  #db <- src_sqlite("pitchfx.sqlite3", create = T)
  #scrape(start = "2008-01-01", end = Sys.Date(), connect = db$con)
  
}



