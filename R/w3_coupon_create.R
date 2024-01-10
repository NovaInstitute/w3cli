# ======================================================================
# w3 coupon create  --help
# Usage
# $ w3 coupon create <did> [options]
# Options
# --password          Password for created coupon.
# -c, --can           One or more abilities to delegate.
# -e, --expiration    Unix timestamp when the delegation is no longer valid. Zero indicates no expiration.  (default 0)
# -o, --output        Path of file to write the exported delegation data to.
# -h, --help          Displays this message

#' w3_coupon_create
#' @description Create a coupon for a space
#' @param did Character.
#' @param password Character. Password for created coupon.
#' @param can Character. One or more abilities to delegate.
#' @param expiration Character. Unix timestamp when the delegation is no longer valid.
#' @param output Character. Path of file to write the exported delegation data to.
#' @return Character. output of w3 coupon create
#' @export
#' @example w3_coupon_create("did:3:bafy...", "password", "read", "0", "coupon.json")

w3_coupon_create <- function(did,
                             password = NULL,
                             can = NULL,
                             expiration = NULL,
                             output = NULL) {
  # check that did provided
  if (missing(did)) {
    stop("did must be provided")
  }
  moreargs <- list("--password" = password, "--can" = can,
                   "--expiration" = expiration, "--output" = output)
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  system2("w3", args = c("coupon", "create", did, moreargs))
}
