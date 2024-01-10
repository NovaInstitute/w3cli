# ======================================================================
# w3 proof ls --help
# Description
# List proofs of capabilities delegated to this agent.
# Usage
# $ w3 proof ls [options]
# Options
# --json        Format as newline delimited JSON

#' w3_proof_ls
#' @description List proofs of capabilities delegated to this agent.
#' @param json Logical. Format as newline delimited JSON
#' @return Character. output of w3 proof ls
#' @export
#' @example w3_proof_ls()

w3_proof_ls <- function(json = FALSE) {
  moreargs <- list("--json" = json)
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  moreargs <- moreargs[!sapply(moreargs, is.logical)]
  system2("w3", args = c("proof", "ls", moreargs))
}
