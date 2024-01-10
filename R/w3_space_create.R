# ======================================================================
# w3 space create
# Description: Create a new w3 space
# Usage
# $ w3 space create [name] [options]
# -nr, --no-recovery    Skips recovery key setup
# -n, --no-caution      Prints out recovery key without confirmation
# -nc, --no-customer    Skip billing setup
# -c, --customer        Billing account email
# -na, --no-account     Skip account setup
# -a, --account         Managing account email
# -h, --help            Displays this message

#' w3_space_create
#' @description Create a new w3 space.
#' @param name Character. Name of space
#' @param no_recovery Logical. Skips recovery key setup
#' @param no_caution Logical. Prints out recovery key without confirmation
#' @param no_customer Logical. Skip billing setup
#' @param customer Character. Billing account email
#' @param no_account Logical. Skip account setup
#' @param account Character. Managing account email
#' @return Character. output of w3 space create
#' @export
#' @example w3_space_create("my_space")

w3_space_create <- function(name,
                            no_recovery = FALSE,
                            no_caution = FALSE,
                            no_customer = FALSE,
                            customer = NULL,
                            no_account = FALSE,
                            account = NULL) {
  moreargs <- list("--no-recovery" = no_recovery, "--no-caution" = no_caution,
                   "--no-customer" = no_customer, "--customer" = customer,
                   "--no-account" = no_account, "--account" = account)
  moreargs <- moreargs[!sapply(moreargs, is.logical)]
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  system2("w3", args = c("space", "create", name, moreargs))
}
