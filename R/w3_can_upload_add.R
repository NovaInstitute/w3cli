# ======================================================================
# w3 can upload add --help
# Description
# Register an upload - a DAG with the given root data CID that is stored in the given CAR shard(s), identified by CAR CIDs.
# Usage
# $ w3 can upload add <root-cid> <shard-cid> [options]

#' w3_can_upload_add
#' @description Register an upload - a DAG with the given root data CID that is stored in the given CAR shard(s), identified by CAR CIDs.
#' @param root_cid Character.
#' @param shard_cid Character.
#' @return Character. output of w3 can upload add
#' @export
#' @example w3_can_upload_add("root_cid", "shard_cid")

w3_can_upload_add <- function(root_cid,
                              shard_cid) {
  # check that root_cid provided
  if (missing(root_cid)) {
    stop("root_cid must be provided")
  }
  # check that shard_cid provided
  if (missing(shard_cid)) {
    stop("shard_cid must be provided")
  }
  system2("w3", args = c("can", "upload", "add", root_cid, shard_cid))
}
