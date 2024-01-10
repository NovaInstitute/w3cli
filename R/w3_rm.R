# ======================================================================
#' w3_rm
#' @description Remove an upload from the uploads listing.
#' @param cid Character. CID to remove
#' @param  shards Character. Remove all shards referenced by the upload from the store.
#' Use with caution and ensure other uploads do not reference the same shards.
#' @return Character. output of w3 rm
#' @export
#' @example w3_rm("QmZK9Q5YJ8Q5Z1Z6Z")

w3_rm <- function(cid, shards = FALSE) {
  moreargs <- list("--shards" = shards)
  moreargs <- moreargs[!sapply(moreargs, is.logical)]
  system2("w3", args = c("rm", cid, moreargs))
}
