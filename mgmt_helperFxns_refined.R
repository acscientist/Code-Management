#' ------------------------------------------------------------------------------
#' Helper Functions for Data Science Workflows
#' ------------------------------------------------------------------------------
#' What:
#'   - Inventory of reusable helper functions for common data science tasks.
#'
#' Why:
#'   - Improve code readability, maintainability, and reuse across projects.
#'   - Standardize routine operations like filtering, checking, and coercing.
#'
#' How:
#'   - Built using base R and common utility packages.
#' ------------------------------------------------------------------------------


# setup -------------------------------------------------------------------
## packages ---------------------------------------------------------------
if (!require(pacman)) install.packages("pacman", dependencies = TRUE)
pacman::p_load(dplyr, purrr, stringr, lubridate, tibble)


# execute -----------------------------------------------------------------


#' --- NOT IN: Identify values not present in another object --------------

"fxn.not.in" <- base::Negate(match)
"%not.in%" <- function(x, y) x[!x %in% y]

#' *example usage*
a <- 1:10
b <- a + 5
fxn.not.in(a, b)      # returns logical vector (NA, TRUE, FALSE)
a[a %not.in% b]       # returns unmatched values


#' --- Check NA Proportion: Report percentage of missing data -------------

fxn.prop_na <- function(x) {
  if (!is.vector(x)) stop("Input must be a vector.")
  round(sum(is.na(x)) / length(x), 4)
}


#' --- Safe Coercion: Convert to numeric with warning suppression ---------

fxn.to_numeric <- function(x) {
  suppressWarnings(as.numeric(as.character(x)))
}


#' --- String Cleaning: Remove leading/trailing whitespace ----------------

fxn.trim_ws <- function(x) {
  if (!is.character(x)) stop("Input must be a character vector.")
  str_trim(x, side = "both")
}


#' --- Column Type Summary: Count variable types in a data frame ----------

fxn.type_summary <- function(df) {
  if (!is.data.frame(df)) stop("Input must be a data frame.")
  sapply(df, class) |> table()
}


#' --- Preview Structure: Sample rows and structure of a data frame -------

fxn.quick_look <- function(df, n = 5) {
  if (!is.data.frame(df)) stop("Input must be a data frame.")
  print(str(df))
  print(head(df, n = n))
}


#' --- Check All Unique: Flag columns with all unique values --------------

fxn.unique_cols <- function(df) {
  if (!is.data.frame(df)) stop("Input must be a data frame.")
  sapply(df, function(col) length(unique(col)) == nrow(df))
}


#' --- Date Validity: Test if character strings are parsable as dates -----

fxn.valid_dates <- function(x) {
  lubridate::is.Date(as.Date(x, format = "%Y-%m-%d")) |>
    suppressWarnings()
}


#' --- Example Use Cases --------------------------------------------------

sample_df <- tibble::tibble(
  id = 1:5,
  value = c("  A ", " B", "C ", " D", NA),
  numeric_as_char = c("1", "2", "three", "4", "5")
)

fxn.prop_na(sample_df$value)
fxn.trim_ws(sample_df$value)
fxn.to_numeric(sample_df$numeric_as_char)
fxn.type_summary(sample_df)
fxn.quick_look(sample_df)
fxn.unique_cols(sample_df)
fxn.valid_dates(c("2020-01-01", "not a date", "2023-12-31"))

