# ======================================================================
# w3 can access claim --help
# Description
# Claim delegated capabilities for the authorized account.
# Usage
# $ w3 can access claim [options]

#' w3_can_access_claim
#' @description Claim delegated capabilities for the authorized account.
#' @return Character. output of w3 can access claim
#' @export
#' @example w3_can_access_claim()

w3_can_access_claim <- function() {
  system2("w3", args = c("can", "access", "claim"))
}
