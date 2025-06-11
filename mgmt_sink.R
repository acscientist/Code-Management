#' ------------------------------------------------------------------------------
#' Outputting Files from Plots and Console Logs
#' ------------------------------------------------------------------------------
#' What:
#'   - Save graphical outputs and console outputs to files using base R.
#'
#' Why:
#'   - Export plots for reports, presentations, or publication.
#'   - Log intermediate results or summaries from console for reproducibility.
#'
#' How:
#'   - Use `grDevices` for plot exports.
#'   - Use `sink()` for capturing text-based output.
#' ------------------------------------------------------------------------------


# SETUP -------------------------------------------------------------------

## Set working directory (update path as needed)
setwd("~/Documents/R_exports")  # <- update path as appropriate


# EXPORT PLOTS ------------------------------------------------------------

## Function to export a simple plot in multiple formats
fxn.export_plot <- function(plot_expr, filename_base = "plot_export") {
  stopifnot(is.expression(substitute(plot_expr)))
  
  formats <- c("pdf", "png", "jpeg", "bmp", "tiff", "svg")
  
  for (fmt in formats) {
    file <- paste0(filename_base, ".", fmt)
    dev_func <- get(fmt, envir = asNamespace("grDevices"))
    
    dev_func(file)           # open graphics device
    eval(substitute(plot_expr))  # evaluate the plot expression
    dev.off()                # close device
    message("Exported: ", file)
  }
}

## EXAMPLE:
fxn.export_plot({
  plot(cars, main = "Speed vs Stopping Distance")
}, filename_base = "cars_plot")


# CAPTURE CONSOLE OUTPUT --------------------------------------------------

## Example use of sink() to log output

# Define output log file
log_file <- "console_output_log.txt"

# Start sink
sink(log_file)

## Commands to log
cat("Summary of cars dataset\n")
summary(cars)

cat("\nStructure of cars dataset\n")
str(cars)

# End sink
sink()

message("Console output written to: ", log_file)


# NOTES -------------------------------------------------------------------
# - All exported files are saved to the current working directory.
# - Always use dev.off() after opening a graphics device, or R session may hang.
# - sink() captures console output only, not graphical output.
# - For HTML or Markdown logs, consider using knitr/rmarkdown for more structure.





# outputting files from plots (base r) ------------------------------------
## - outputs will be exported to working directory

## set working directory
setwd()

## establish output file - multiple format options
grDevices::pdf("title.pdf")
grDevices::jpeg("title.pdf")
grDevices::png("title.pdf")

## plots
# plot(SOMETHING TO PLOT)

## close output file once done
grDevices::dev.off()



# use the sink function --------------------------------------------------

## activate sink
sink("mem_fxns.txt")

## do some stuff
## code goes here

## turn off sink
sink()