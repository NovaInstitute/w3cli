# ======================================================================
# w3 can store add  --help
# Description
# Store a CAR file with the service.
# Usage
# $ w3 can store add <car-path> [options]

#' w3_can_store_add
#' @description Store a CAR file with the service.
#' @param car_path Character.
#' @return Character. output of w3 can store add
#' @export
#' @example w3_can_store_add("car_path")

w3_can_store_add <- function(car_path) {
  # check that car_path provided
  if (missing(car_path)) {
    stop("car_path must be provided")
  }
  system2("w3", args = c("can", "store", "add", car_path))
}
