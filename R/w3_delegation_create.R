# ======================================================================
# w3 delegation create --help
# Description
# Create a delegation to the passed audience for the given abilities with the _current_ space as the resource.
# Usage
# $ w3 delegation create <audience-did> [options]
# Options
# -c, --can           One or more abilities to delegate.
# -n, --name          Human readable name for the audience receiving the delegation.
# -t, --type          Type of the audience receiving the delegation, one of: device, app, service.
# -e, --expiration    Unix timestamp when the delegation is no longer valid. Zero indicates no expiration.  (default 0)
# -o, --output        Path of file to write the exported delegation data to.
# -h, --help          Displays this message

#' w3_delegation_create
#' @description Create a delegation to the passed audience for the given abilities with the _current_ space as the resource.
#' @param audience_did Character.
#' @param can Character. One or more abilities to delegate.
#' @param name Character. Human readable name for the audience receiving the delegation.
#' @param type Character. Type of the audience receiving the delegation, one of: device, app, service.
#' @param expiration Character. Unix timestamp when the delegation is no longer valid.
#' @param output Character. Path of file to write the exported delegation data to.
#' @return Character. output of w3 delegation create
#' @export
#' @example w3_delegation_create("did:3:bafy...", "read", "my_app", "app", "0", "delegation.json")

w3_delegation_create <- function(audience_did,
                                 can = NULL,
                                 name = NULL,
                                 type = NULL,
                                 expiration = NULL,
                                 output = NULL) {
  # check that audience_did provided
  if (missing(audience_did)) {
    stop("audience_did must be provided")
  }
  moreargs <- list("--can" = can, "--name" = name,
                   "--type" = type, "--expiration" = expiration,
                   "--output" = output)
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  system2("w3", args = c("delegation", "create", audience_did, moreargs))
}
