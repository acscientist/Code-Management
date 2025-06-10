# Helper Functions --------------------------------------------------------
#'
#' **Purpose**
#' ... List reusable helper functions for common data science tasks.
#'
#' **Utility**
#' ... Improve code readability, maintainability, and reuse across projects.
#' ... Standardize routine operations like filtering, checking, and transforming.
#'
#' **Notes**
#' ... `Base R` functions are less likely to receive major updates than `non-Base R` packages
#' ... ... Fewer disruptions in code functionality and backward compatibility are encountered
#' ------------------------------------------------------------------------



# Setup -------------------------------------------------------------------

## Packages ---------------------------------------------------------------
#' if `pacman` package not installed, install it
if (!require(pacman)) {
  install.packages("pacman", dependencies = TRUE)
}
#' load packages by calling `p_load` directly from the `pacman` namespace
#' ... if executed this way, no need to load the package into the global environment
pacman::p_load(dplyr, purrr, stringr, lubridate, tibble)

## Data -------------------------------------------------------------------
sample_df <- data.frame(
  value_num_a = 1:5,
  value_num_b = c(1, 2, 5, 6, 9),
  value_char = c("  A ", " B", "C ", " D", NA),
  value_num_as_char = c("1", "2", "three", "4", "5")
)



# Execute -----------------------------------------------------------------

## Not In -----------------------------------------------------------------
#' ... Identify which values in one vector are not present in another
#' ... Two methods

#' method 1: pass vectors as arguments to function
#' ... returns logical values (`TRUE` or `FALSE`)
"fxn.not.in" <- base::Negate("%in%")
fxn.not.in(sample_df$value_num_a, sample_df$value_num_b)
fxn.not.in(sample_df$value_num_b, sample_df$value_num_a)

#' method 2: execute function as intermediate argument between vectors
#' ... returns actual values
"%not.in%" <- function(x, y) {
  !x %in% y
}
sample_df$value_num_a[sample_df$value_num_a %not.in% sample_df$value_num_b]
sample_df$value_num_b[sample_df$value_num_b %not.in% sample_df$value_num_a]

## NA Proportion ----------------------------------------------------------
#' Report percentage of missing data
fxn.prop_na <- function(x) {
  if (!is.vector(x)) stop("Input must be a vector.")
  round(sum(is.na(x)) / length(x), 4)
}

#' example
fxn.prop_na(sample_df$value_char)

## Safe Coercion ----------------------------------------------------------
#' Convert to numeric with warning suppression
fxn.to_numeric <- function(x) {
  suppressWarnings(as.numeric(as.character(x)))
}

#' example
fxn.to_numeric(sample_df$value_num_as_char)

## String Cleaning --------------------------------------------------------
#' Remove leading/trailing whitespace
fxn.trim_ws <- function(x) {
  if (!is.character(x)) stop("Input must be a character vector.")
  str_trim(x, side = "both")
}

#' example
fxn.trim_ws(sample_df$value_char)

## Summarize Column Type --------------------------------------------------
#' Count variable types in a data frame
fxn.type_summary <- function(df) {
  if (!is.data.frame(df)) stop("Input must be a data frame.")
  sapply(df, class) |> table()
}

#' example
fxn.type_summary(sample_df)

## Preview DF Values/Structure --------------------------------------------
#' Sample rows and structure of a data frame
fxn.quick_look <- function(df, n = 5) {
  if (!is.data.frame(df)) stop("Input must be a data frame.")
  print(str(df))
  print(head(df, n = n))
}

#' example
fxn.quick_look(sample_df)

## Check Unique -----------------------------------------------------------
#' Flag columns with all unique value_chars
fxn.unique_cols <- function(df) {
  if (!is.data.frame(df)) stop("Input must be a data frame.")
  sapply(df, function(col) length(unique(col)) == nrow(df))
}

#' example
fxn.unique_cols(sample_df)



# Miscellaneous -----------------------------------------------------------
