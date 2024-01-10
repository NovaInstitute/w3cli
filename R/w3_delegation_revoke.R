# ======================================================================
# w3 delegation revoke --help
# Description
# Revoke a delegation by CID.
# Usage
# $ w3 delegation revoke <delegation-cid> [options]
# Options
# -p, --proof    Name of a file containing the delegation and any additional proofs needed to prove authority to revoke

#' w3_delegation_revoke
#' @description Revoke a delegation by CID.
#' @param delegation_cid Character.
#' @param proof Character. Name of a file containing the delegation and any additional proofs needed to prove authority to revoke
#' @return Character. output of w3 delegation revoke
#' @export
#' @example w3_delegation_revoke("bafy...", "proof.json")

w3_delegation_revoke <- function(delegation_cid,
                                 proof = NULL) {
  # check that delegation_cid provided
  if (missing(delegation_cid)) {
    stop("delegation_cid must be provided")
  }
  moreargs <- list("--proof" = proof)
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  system2("w3", args = c("delegation", "revoke", delegation_cid, moreargs))
}
