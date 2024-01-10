# ======================================================================

# w3 can upload rm --help
# Description
# Remove an upload from the uploads listing.
# Usage
# $ w3 can upload rm <root-cid>

#' w3_can_upload_rm
#' @description Remove an upload from the uploads listing.
#' @param root_cid Character.
#' @return Character. output of w3 can upload rm
#' @export
#' @example w3_can_upload_rm("root_cid")

w3_can_upload_rm <- function(root_cid) {
  # check that root_cid provided
  if (missing(root_cid)) {
    stop("root_cid must be provided")
  }
  system2("w3", args = c("can", "upload", "rm", root_cid))
}
