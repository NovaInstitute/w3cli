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
  # check that email provided and is a character and a valid email
  if (missing(email)) {
    stop("email must be provided")
  }
  if (!is.character(email)) {
    stop("email must be a character")
  }
  if (!grepl(".@.", email)) {
    stop("email must be a valid email address")
  }
  res <- system2("w3", args = c("plan", "get", email), stdout = TRUE)
  gsub("⁂ ", "", res)
}

# remember to add to DESCRIPTION with usethis::use_package("rhub")
