# ======================================================================
# w3 space provision --help
#
# Description
# Associating space with a billing account
#
# Usage
# $ w3 space provision [name] [options]
#
# Options
# -c, --customer    The email address of the billing account
# --coupon          Coupon URL to provision space with
# -p, --password    Coupon password
# -p, --provider    The storage provider to associate with this space.
# -h, --help        Displays this message

#' w3_space_provision
#' @description Associate space with a billing account
#' @param name Character. Name of space
#' @param customer Character. The email address of the billing account
#' @param coupon Character. Coupon URL to provision space with
#' @param password Character. Coupon password
#' @param provider Character. The storage provider to associate with this space.
#' @return Character. output of w3 space provision
#' @export
#' @example w3_space_provision("my_space", "user@mail.com")

w3_space_provision <- function(name,
                               customer = NULL,
                               coupon = NULL,
                               password = NULL,
                               provider = NULL) {
  moreargs <- list("--customer" = customer, "--coupon" = coupon,
                   "--password" = password, "--provider" = provider)
  moreargs <- moreargs[!sapply(moreargs, is.null)]
  system2("w3", args = c("space", "provision", name, moreargs))
}
