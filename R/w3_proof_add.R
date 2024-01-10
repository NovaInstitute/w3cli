# ======================================================================
# w3 proof add --help
# Description
# Add a proof delegated to this agent.
# Usage
# $ w3 proof add <proof> [options]
# Options
# --json        Format as newline delimited JSON
# --dry-run     Decode and view the proof but do not add it

#' w3_proof_add
#' @description Add a proof delegated to this agent.
#' @param proof Character.
#' @param json Logical. Format as newline delimited JSON
#' @param dry_run Logical. Decode and view the proof but do not add it
#' @return Character. output of w3 proof add
#' @export
#' @example w3_proof_add("proof.json", FALSE, FALSE)

w3_proof_add <- function(proof,
                         json = FALSE,
                         dry_run = FALSE) {
  # check that proof provided
  if (missing(proof)) {
    stop("proof must be provided")
  }
  moreargs <- list("--json" = json, "--dry-run" = dry_run)
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  moreargs <- moreargs[!sapply(moreargs, is.logical)]
  system2("w3", args = c("proof", "add", proof, moreargs))
}
