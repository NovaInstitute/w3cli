# ======================================================================
# w3 can upload ls --help
# Description
# List uploads in the current space.
# Usage
# $ w3 can upload ls [options]
# Options
# --json        Format as newline delimited JSON
# --shards      Pretty print with shards in output
# --size        The desired number of results to return
# --cursor      An opaque string included in a prior upload/list response that allows the service to provide the next "page" of results
# --pre         If true, return the page of results preceding the cursor

#' w3_can_upload_ls
#' @description List uploads in the current space.
#' @param json Logical. Format as newline delimited JSON
#' @param shards Logical. Pretty print with shards in output
#' @param size Integer. The desired number of results to return
#' @param cursor Character.
#' @param pre Logical. If true, return the page of results preceding the cursor
#' @return Character. output of w3 can upload ls
#' @export
#' @example w3_can_upload_ls()

w3_can_upload_ls <- function(json = FALSE,
                             shards = FALSE,
                             size = NULL,
                             cursor = NULL,
                             pre = FALSE) {
  moreargs <- list("--json" = json, "--shards" = shards, "--size" = size, "--cursor" = cursor, "--pre" = pre)
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  moreargs <- moreargs[!sapply(moreargs, is.logical)]
  moreargs <- moreargs[!sapply(moreargs, is.numeric)]
  system2("w3", args = c("can", "upload", "ls", moreargs), stdout = TRUE)
}
