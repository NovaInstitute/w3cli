# ======================================================================

#' w3_open
#' @description Open CID on https://w3s.link
#' @param cid Character. CID to open
#' @return Character. output of w3 open
#' @export
#' @example w3_open("QmZK9Q5YJ8Q5Z1Z6Z")

w3_open <- function(cid) {
  system2("w3", args = c("open", cid))
}

