# ======================================================================
# w3 space ls --help
# Description: List spaces known to the agent
# Usage
# $ w3 space ls [options]

#' w3_space_ls
#' @description List spaces known to the agent
#' @return Character. output of w3 space ls
#' @export
#' @example w3_space_ls()
#' @import stringr
#' @import purrr
#' @import tibble
#' @import dplyr

w3_space_ls <- function() {
  res <- system2("w3", args = c("space", "ls"), stdout = TRUE)
  res <- gsub("\\* ", "", res)
  res <- stringr::str_split(res, "\ ", simplify = TRUE)
  as.data.frame(res) %>% as_tibble() %>% purrr::set_names(c("key", "space"))
}
