# ======================================================================

#' w3_whoami
#' @description Display the current account.
#' @return Character. output of w3 whoami
#' @export
#'
w3_whoami <- function() {
  system2("w3", args = c("whoami"), stdout = TRUE)
}
