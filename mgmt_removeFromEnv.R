# Environment Management --------------------------------------------------
#' **Purpose**
#' ... To provide a set of examples for removing R objects from the environment based on name, pattern, and exclusion logic.
#'
#' **Utility**
#' ... This template demonstrates useful methods of managing objects within an active R session's global environment. This is especially important when working with large data sets to avoid computational burden due to consumption of working memory.
#'
#' **Notes**
#' ... `Base R` functions are less likely to receive major updates than `non-Base R` packages, which results in fewer disruptions in code functionality and backward compatibility being encountered
#' ... A more detailed explanation of memory cleaning operations can be found on Hadley Wickham's website:
#' ... ... http://adv-r.had.co.nz/memory.html
#' ... For this example, dummy objects must be recreated after each code is executed
#' ------------------------------------------------------------------------------



# Remove by Name ----------------------------------------------------------

## All Listed Objects -----------------------------------------------------
#' Create objects in the global environment
x.1 <- 1
y.1 <- 2
z.1 <- 3
x.2 <- "a"
y.2 <- "b"
z.2 <- "c"

#' Display objects
ls()

#' Can remove one or multiple objects
rm(list = "x.1")
rm(list = c("x.1", "x.2"))

#' Check which objects remain
ls()

## All Objects Except Listed ----------------------------------------------
#' Create objects in the global environment
x.1 <- 1
y.1 <- 2
z.1 <- 3
x.2 <- "a"
y.2 <- "b"
z.2 <- "c"

#' Display objects
ls()

#' Retain only specified objects using `setdiff()` with `ls()`
rm(list = setdiff(ls(), c("x.1", "x.2")))

#' Check which objects remain
ls()



# Remove by Pattern -------------------------------------------------------

## All Matches ------------------------------------------------------------

#' Create objects in the global environment
x.1 <- 1
y.1 <- 2
z.1 <- 3
x.2 <- "a"
y.2 <- "b"
z.2 <- "c"

#' Display objects
ls()

#' Remove objects whose names match a pattern (e.g., end in ".2")
rm(list = ls(pattern = ".2"))

#' Check which objects remain
ls()




## All Except Matches -----------------------------------------------------

#' Create objects in the global environment
x.1 <- 1
y.1 <- 2
z.1 <- 3
x.2 <- "a"
y.2 <- "b"
z.2 <- "c"

#' Display objects
ls()

#' Keep only objects with names matching a regex pattern (e.g., "x.")
rm(list = setdiff(ls(), ls(pattern = "x.")))

#' Check which objects remain
ls()



# Remove Everything -------------------------------------------------------

#' Create objects in the global environment
x.1 <- 1
y.1 <- 2
z.1 <- 3
x.2 <- "a"
y.2 <- "b"
z.2 <- "c"

#' Display objects
ls()

#' Remove all objects
rm(list = ls())

#' Check which objects remain
ls()
