# ======================================================================
#' w3_accountls
#' @description List accounts this agent has been authorized to act on behalf of.
#' @return Character. List of accounts
#' @export
#'
#' @examples
#' w3_accountls()

w3_accountls <- function() {
  system2("w3", args = c("account", "ls"))
}
