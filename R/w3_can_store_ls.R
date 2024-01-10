# ======================================================================
# w3 can store ls --help
# Description
# List CAR files in the current space.
# Usage
# $ w3 can store ls [options]
# Options
# --json        Format as newline delimited JSON
# --size        The desired number of results to return
# --cursor      An opaque string included in a prior store/list response that allows the service to provide the next "page" of results
# --pre         If true, return the page of results preceding the cursor

#' w3_can_store_ls
#' @description List CAR files in the current space.
#' @param json Logical. Format as newline delimited JSON
#' @param size Integer. The desired number of results to return
#' @param cursor Character.
#' @param pre Logical. If true, return the page of results preceding the cursor
#' @return Character. output of w3 can store ls
#' @export
#' @example w3_can_store_ls()

w3_can_store_ls <- function(json = FALSE,
                            size = NULL,
                            cursor = NULL,
                            pre = FALSE) {
  moreargs <- list("--json" = json, "--size" = size, "--cursor" = cursor, "--pre" = pre)
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  moreargs <- moreargs[!sapply(moreargs, is.logical)]
  moreargs <- moreargs[!sapply(moreargs, is.numeric)]
  system2("w3", args = c("can", "store", "ls", moreargs))
}
