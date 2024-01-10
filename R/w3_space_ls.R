# ======================================================================
# w3 space ls --help
# Description: List spaces known to the agent
# Usage
# $ w3 space ls [options]

#' w3_space_ls
#' @description List spaces known to the agent
#' @return Character. output of w3 space ls
#' @export
#' @example w3_space_ls()

w3_space_ls <- function() {
  system2("w3", args = c("space", "ls"))
}
