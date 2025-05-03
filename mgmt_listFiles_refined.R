#' ------------------------------------------------------------------------------
#' File Inventory and Management Script
#' ------------------------------------------------------------------------------
#' Purpose:
#'   To dynamically list, inventory, and optionally edit R files from a working
#'   directory (wd) and its subdirectories for the purposes of portfolio development.
#'
#' Relevance:
#'   This workflow supports codebase organization, refinement tracking, and
#'   preparation for GitHub uploads. It uses base R functions for flexibility and
#'   leverages simple helper functions for negation operations.
#' ------------------------------------------------------------------------------

#' --- Setup Environment ---

#' Load or install required package manager
if (!require(pacman)) {
  install.packages("pacman", dependencies = TRUE)
}

#' --- Initialize Metadata Container ---
meta <- list() #' Placeholder list for storing runtime logs, counts, etc.

#' --- List Files from Working Directory ---

## Display list of all files in the current working directory
list.files(getwd())

#' Store filenames in a data frame for further processing
#' *store names of files* in wd
files.in.folder <- list.files(getwd()) |> data.frame()
files.in.folder

#' --- Open or Create R Script Files ---
#' ... if file does not exist, it will be created using the file name passed to `file.edit`
#' ... will only work for R scripts, not .Rmd files
file.edit("R_basics_functionX.R")

#' --- List Files from Subdirectories ---
#' *list files* in sub-folders of the working directory
#' ... precede each additional sub-folder, or file within a folder, by a forward slash ('/')
list.files("R_basics_sub")
files.in.folder <- list.files("R_basics_sub") |> data.frame()

## Open or create script files in the subdirectory
#' ... if file does not exist, it will be created using the file name passed to `file.edit`
#' ... will only work for R scripts, not .Rmd files
file.edit("R_basics_sub/R_basics_calc_bootstrapping_catchall.R")
file.edit("R_basics_sub/R_basics_calc_bootstrapping_final.R")

#' --- Use Absolute File Paths if Needed ---
## Useful when not operating inside a structured R project folder
list.files("/Users/USERNAME/Documents/Docs_R/R_Stats")
files.in.folder <- list.files("/Users/USERNAME/Documents/Docs_R/R_Stats") |> data.frame()
