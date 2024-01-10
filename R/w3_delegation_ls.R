# ======================================================================
# delegation ls --help
# Description
# List delegations created by this agent for others.
# Usage
# $ w3 delegation ls [options]
# Options
# --json        Format as newline delimited JSON

#' w3_delegation_ls
#' @description List delegations created by this agent for others.
#' @param json Logical. Format as newline delimited JSON
#' @return Character. output of w3 delegation ls
#' @export
#' @example w3_delegation_ls()

w3_delegation_ls <- function(json = FALSE) {
  moreargs <- list("--json" = json)
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  moreargs <- moreargs[!sapply(moreargs, is.logical)]
  system2("w3", args = c("delegation", "ls", moreargs))
}
