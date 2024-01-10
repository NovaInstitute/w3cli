# ======================================================================
# w3 space info --help
# Description: Show information about a space.
# Defaults to the current space.
# Usage
# $ w3 space info [options]
# Options
# -s, --space    The space to print information about.
# --json         Format as newline delimited JSON

#' w3_space_info
#' @description Show information about a space.
#' @param space Character. The space to print information about.
#' @param json Logical. Format as newline delimited JSON
#' @return Character. output of w3 space info
#' @export

w3_space_info <- function(space = NULL, json = FALSE) {
  moreargs <- list("--space" = space, "--json" = json)
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  moreargs <- moreargs[!sapply(moreargs, is.logical)]
  system2("w3", args = c("space", "info", moreargs))
}
