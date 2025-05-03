#' ------------------------------------------------------------------------------
#' Demonstration of Object Removal Techniques in Base R
#' ------------------------------------------------------------------------------
#' Purpose:
#'   To provide a comprehensive set of examples for removing R objects from the 
#'   environment based on name, pattern, and exclusion logic.
#'
#' Relevance:
#'   This example highlights complexity (regex and set operations), effectiveness 
#'   (reliable object removal), and efficiency (minimal yet expressive syntax).
#' ------------------------------------------------------------------------------

#' --- Remove Objects by Explicit Name ---
#' Define several objects in the environment
x.1 <- 1
y.1 <- 2
z.1 <- 3

x.2 <- "a"
y.2 <- "b"
z.2 <- "c"

ls()  #' Show all objects

#' Remove specific objects by name
#' Must wrap names in quotes and combine with c()
rm(list = c("x.1", "x.2"))
ls()  #' Check which objects remain

#' --- Remove Objects by Pattern Matching ---
#' Recreate all test objects
x.1 <- 1.1
y.1 <- 2.2
z.1 <- 3.3

x.2 <- "a"
y.2 <- "b"
z.2 <- "c"

ls()

#' Remove objects whose names match a pattern (e.g., end in ".2")
rm(list = ls(pattern = ".2"))
ls()

#' --- Remove Everything Except Specific Objects ---
#' Create test objects again
x.1 <- 1
y.1 <- 2
z.1 <- 3

x.2 <- "a"
y.2 <- "b"
z.2 <- "c"

ls()

#' Retain only specified objects using `setdiff()` with `ls()`
rm(list = setdiff(ls(), c("x.1", "x.2")))
ls()

#' --- Remove Everything Except Objects Matching a Pattern ---
#' Recreate environment objects
x.1 <- 1
y.1 <- 2
z.1 <- 3

x.2 <- "a"
y.2 <- "b"
z.2 <- "c"

#' Keep only objects with names matching a regex pattern (e.g., "x.")
rm(list = setdiff(ls(), ls(pattern = "x.")))
ls()

#' --- Remove All Objects from Environment ---
#' Recreate a few objects
x.1 <- 1
y.1 <- 2
z.1 <- 3

x.2 <- "a"
y.2 <- "b"
z.2 <- "c"

ls()  #' Check objects before removal

#' Remove all objects
rm(list = ls())
ls()  #' Should return character(0), i.e., empty workspace
