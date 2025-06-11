# File Management ---------------------------------------------------------
#' **Purpose**
#' ... List, inventory, and edit R files from a working directory or its sub-directories.
#'
#' **Utility**
#' ... This workflow supports code organization and refinement for uploading to GitHub.
#'
#' **Notes**
#' ... `Base R` functions are less likely to receive major updates than `non-Base R` packages, which results in fewer disruptions in code functionality and backward compatibility being encountered
#' ------------------------------------------------------------------------------


# setup -------------------------------------------------------------------

#' Load or install required package manager
if (!require(pacman)) {
  install.packages("pacman", dependencies = TRUE)
}

#' Get working directory
getwd()



# Execute -----------------------------------------------------------------

## List Files -------------------------------------------------------------

#' Display list of files in the current **working directory**
#' ... then store the names in a data frame
list.files(getwd())
files.in.folder <- list.files(getwd()) |> data.frame()
files.in.folder

#' Display list of files in the current wd's **sub-directory** or **other file path location**
#' ... then store the names in a data frame
#' ... precede each additional sub-folder (and file within a folder) with a forward slash ('/')
list.files("R_basics_subfolderX")
list.files("/Users/USERNAME/Documents/Docs_R/R_basics_subfolderX")
files.in.folder <- list.files("R_basics_subfolderX") |> data.frame()


## Open / Create Files ----------------------------------------------------

#' If file does not exist, it will be created using the file name passed to `file.edit`
#' ... This method will can be used to create `.R` or `.Rmd` files by changing the file extension suffix
file.edit("R_basics_functionX.R")
file.edit("R_basics_functionX.Rmd")

