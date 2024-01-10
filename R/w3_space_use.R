# ======================================================================

# w3 space use --help
# Description: Set the current space in use by the agent
# Usage
# $ w3 space use <did> [options]

#' w3_space_use
#' @description Set the current space in use by the agent
#' @param did Character.
#' @return Character. output of w3 space use
#' @export
#'
w3_space_use <- function(did) {
  # check that did provided
  if (missing(did)) {
    stop("did must be provided")
  }
  system2("w3", args = c("space", "use", did))
}
