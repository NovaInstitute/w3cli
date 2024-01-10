# ======================================================================
# w3 space add --help
# Description
# Add a space to the agent.
# The proof is a CAR encoded delegation to _this_ agent.
# Usage $ w3 space add <proof> [options]

#'  space add
#'  @description Add a space to the agent.
#'  @param proof Character. The proof is a CAR encoded delegation to _this_ agent.
#'  @return Character. output of w3 space add
#'  @export

w3_space_add <- function(proof) {
  # check that proof provided
  if (missing(proof)) {
    stop("proof must be provided")
  }
  system2("w3", args = c("space", "add", proof))
}
