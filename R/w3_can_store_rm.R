# ======================================================================

# w3 can store rm --help
# Description
# Remove a CAR shard from the store.
# Usage
# $ w3 can store rm <shard-cid> [options]

#' w3_can_store_rm
#' @description Remove a CAR shard from the store.
#' @param shard_cid Character.
#' @return Character. output of w3 can store rm
#' @export
#' @example w3_can_store_rm("shard_cid")

w3_can_store_rm <- function(shard_cid) {
  # check that shard_cid provided
  if (missing(shard_cid)) {
    stop("shard_cid must be provided")
  }
  system2("w3", args = c("can", "store", "rm", shard_cid))
}
