# ======================================================================
#' w3_ls
#' @description List uploads in the current space
#' @param json Logical. Format as newline delimited JSON
#' @param shards Logical. Include shard information
#' @return Character. output of w3 ls
#' @export
#' @example w3_ls()

w3_ls <- function(json = FALSE, shards = FALSE) {
  # Ignore json and shards if FALSE
  moreargs <- list("--json" = json, "--shards" = shards)
  moreargs <- moreargs[!sapply(moreargs, is.logical)]
  system2("w3", args = c("ls", moreargs))
}
