# ======================================================================
#' w3_plan_get
#' @description:Displays plan given account is on
#' @param email Character. email address to authenticate with
#'
#' @return
#' @export
#'
#' @examples
#' w3_plan_get('user@mail.com')

w3_plan_get <- function(email) {
  system2("w3", args = c("plan", "get", email))
}
