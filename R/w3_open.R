# ======================================================================

#' w3_open
#' @description Open CID on https://w3s.link
#' @param cid Character. CID to open
#' @return Character. output of w3 open
#' @export
#' @example w3_open("QmZK9Q5YJ8Q5Z1Z6Z")

w3_open <- function(cid) {
  # check that cid provided
  if (missing(cid)) {
    stop("cid must be provided")
  }
  # check that cid is a character
  if (!is.character(cid)) {
    stop("cid must be a character")
  }
  # remove https://w3s.link/ipfs/ from cid
  cid <- gsub("https://w3s.link/ipfs/", "", cid)
  # open cid
  system2("w3", args = c("open", cid))
}

