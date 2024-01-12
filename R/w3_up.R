# ======================================================================
# w3 up
# Description
# Store a file(s) to the service and register an upload.
#
# Usage
# $ w3 up <file> [options]
#
# Aliases
# $ w3 upload
# $ w3 put
#
# Options
# --no-wrap                Don't wrap input files with a directory.  (default false)
#     -H, --hidden             Include paths that start with ".".
#     -c, --car                File is a CAR file.  (default false)
#     --json                   Format as newline delimited JSON
#     --verbose                Output more details.
#     --shard-size             Shard uploads into CAR files of approximately this size in bytes.
#     --concurrent-requests    Send up to this many CAR shards concurrently.
#     -h, --help               Displays this message

#' w3_up
#' @description Store a file(s) to the service and register an upload.
#' @param file Character. File to upload
#' @param no_wrap Logical. Don't wrap input files with a directory.  (default false)
#' @param hidden Logical. Include paths that start with ".".
#' @param car Logical. File is a CAR file.  (default false)
#' @param json Logical. Format as newline delimited JSON
#' @param verbose Logical. Output more details.
#' @param shard_size Numeric. Shard uploads into CAR files of approximately this size in bytes.
#' @param concurrent_requests Numeric. Send up to this many CAR shards concurrently.

#' @return Character. output of w3 up
#' @export
#' @examples
#' w3_up('file.txt')

w3_up <- function(file,
                  no_wrap = FALSE,
                  hidden = FALSE,
                  car = FALSE,
                  json = FALSE,
                  verbose = FALSE,
                  shard_size = 0,
                  concurrent_requests = 0) {

  # Check that file exist
  if (!file.exists(file)) {
    stop("File does not exist")
  }

  moreargs <- list("--no-wrap" = no_wrap, "-H" = hidden, "-c" = car, "--json" = json,
                "--verbose" =  verbose, "--shard-size" = shard_size,
                "--concurrent-requests" = concurrent_requests)
  # remove arguments that are not used: i.e. FALSE, NULL or 0
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  moreargs <- moreargs[!sapply(moreargs, is.logical)]
  moreargs <- moreargs[!sapply(moreargs, is.numeric)]

  # Callapse moreargs into a character vector of length 1 in the form name=value
  moreargs <- paste(names(moreargs), moreargs, sep = "=")
  moreargs <- paste(moreargs, collapse = " ")

  res <- system2("w3", args = c("up", file, moreargs), stdout = TRUE,
                 wait = TRUE, stderr = TRUE, timeout = 60)
  gsub("⁂ ", "", res)

}
