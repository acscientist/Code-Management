#' ------------------------------------------------------------------------------
#' Batch Sourcing of R Scripts from a Folder
#' ------------------------------------------------------------------------------
#' Purpose:
#'   To execute all `.R` scripts in a specified folder using multiple strategies,
#'   ensuring flexibility, error tracking, and minimal output.
#'
#' Why:
#'   Useful for automating workflows, bootstrapping environments, or executing
#'   entire libraries of reusable code (e.g., function templates).
#'
#' Notes:
#'   - Use `invisible()` to suppress output where applicable.
#'   - Custom error-handling improves clarity in debugging.
#'   - Case-insensitive pattern matching allows both `.R` and `.r` file extensions.
#' ------------------------------------------------------------------------------

#' --- Method 1: Custom Function with Error Handling and Verbose Logging ---

fxn.sourceEntireFolder <- function(path.folder,
                                   verbose = FALSE,
                                   showWarnings = TRUE) {
  #' Validate the folder path
  if (!dir.exists(path.folder)) {
    stop("The specified folder does not exist: ", path.folder)
  }
  
  #' Identify .R files (case-insensitive)
  files <- list.files(path.folder, pattern = "\\.[rR]$", full.names = TRUE)
  
  #' Handle case where no files are found
  if (length(files) == 0 && showWarnings) {
    warning("No R files found in ", path.folder)
  }
  
  #' Initialize logs
  sourced_files <- character(0)
  error_files <- character(0)
  error_messages <- character(0)
  
  #' Loop through and source each file
  for (f in files) {
    if (verbose) cat("Sourcing:", f, "\n")
    
    result <- tryCatch({
      source(f, local = FALSE, echo = FALSE)
    }, error = function(e) {
      error_files <<- c(error_files, f)
      error_messages <<- c(error_messages, paste("Error in file", f, ":", e$message))
      if (verbose) cat("Error sourcing file:", f, "\n")
      return(NULL)
    })
    
    #' Log successful files
    if (!inherits(result, "try-error")) {
      sourced_files <- c(sourced_files, f)
    }
  }
  
  #' Summary output
  message("Sourcing completed. Files sourced successfully: ", length(sourced_files))
  if (length(error_files) > 0) {
    message("Files that encountered errors: ", paste(error_files, collapse = ", "))
    cat("Errors encountered during sourcing:\n")
    cat(paste(error_messages, collapse = "\n"), "\n")
  }
  
  #' Return structured results
  return(list(successfully_sourced = sourced_files,
              errors = error_files))
}


#' --- Method 2: Quick Execution Using sapply (All Files) ---

## Only use if all files in the folder are `.R` scripts
sapply(list.files("folder", full.names = TRUE), source)


#' --- Method 3: Filter for Only .R Files Explicitly ---

## More robust; only sources `.R` or `.r` scripts
sapply(list.files("folder", full.names = TRUE, pattern = "\\.[rR]$"), source)


#' --- Method 4: Functional Approach Using purrr::walk() ---

## Requires tidyverse (or purrr)
## Elegant functional alternative; reads full paths
library(tidyverse)
list.files("folder", full.names = TRUE, pattern = "\\.[rR]$") %>%
  walk(source)
