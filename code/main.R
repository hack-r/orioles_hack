# (c) Miller, J.D.
# 2017

# Options and Libraries ---------------------------------------------------
set.seed(21337)
setwd("..//data")

pacman::p_load(Lahman, dplyr, pitchRx)

reload <- T # Re-load saved data, if FALSE then scrape from source

# Pull Raw Data -----------------------------------------------------------
source("..//code//data.R")

# Text Mining -------------------------------------------------------------
source("..//code//bio_tm.R")

# Feature Engineering -----------------------------------------------------
source("..//code//fe.R")

# EDA ---------------------------------------------------------------------
source("..//code//eda.R")

# Data Visualizations -----------------------------------------------------
source("..//code//viz.R")

# Models ------------------------------------------------------------------
source("..//code//models.R")