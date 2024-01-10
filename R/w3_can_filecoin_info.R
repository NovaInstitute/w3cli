# ======================================================================

# w3 can filecoin info --help
# Description
# Get filecoin information for given PieceCid.
# Usage
# $ w3 can filecoin info <piece-cid> [options]

#' w3_can_filecoin_info
#' @description Get filecoin information for given PieceCid.
#' @param piece_cid Character.
#' @return Character. output of w3 can filecoin info
#' @export
#' @example w3_can_filecoin_info("piece_cid")

w3_can_filecoin_info <- function(piece_cid) {
  # check that piece_cid provided
  if (missing(piece_cid)) {
    stop("piece_cid must be provided")
  }
  system2("w3", args = c("can", "filecoin", "info", piece_cid))
}
