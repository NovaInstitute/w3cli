# ======================================================================
# w3 proof ls --help
# Description
# List proofs of capabilities delegated to this agent.
# Usage
# $ w3 proof ls [options]
# Options
# --json        Format as newline delimited JSON

#' w3_proof_ls
#' @description List proofs of capabilities delegated to this agent.
#' @param json Logical. Format as newline delimited JSON
#' @return Character. output of w3 proof ls
#' @export
#' @example w3_proof_ls()
#' @imprt jsonlite
#' @import tidyr

w3_proof_ls <- function(json = TRUE) {
  moreargs <- list("--json" = json)
  moreargs <- moreargs[!is.null(moreargs)]
  moreargs <- moreargs[!is.na(moreargs)]
  moreargs <- paste(names(moreargs), moreargs, sep = "=", collapse = " ")

  res <- system2("w3", args = c("proof", "ls", moreargs), stdout = TRUE)
  if (!json) return(res)

  # parse list into list of json objects
  out <- lapply(res, function(x) jsonlite::fromJSON(x))

  # For NULL values of "" or an empty, turn them into NA before creating the tibble.

  out <- lapply(out, function(x) {
    x[purrr::map_lgl(x, is.null)] <- NA
    x
    })

  outlength <- map_df(out,~map(., ~length(.))) %>% summarise_all(sum) / length(out) == 1
  outnames <- colnames(outlength)
  listcols <- outnames[!map_lgl(outlength, ~.)]
  keepnames <- setdiff(outnames, listcols)

  df_out <- purrr::map_df(out, ~purrr::map_df(., ~.)) %>%  tidyr::nest(data = -all_of(keepnames))
  # find columns that are lists but contain only single values and unnest them
  df_out <- deep_unnest(df_out)
  df_out
}


deep_unnest <- function(df, keeper = "data") {
  # find columns that are lists but contain only single values and unnest them
  lists <- purrr::map_lgl(df, ~class(.) == "list")
  lists <- lists[-which(names(lists) == keeper)]
  ones <- purrr::map_lgl(df, ~all(map_lgl(., ~length(.) == 1) ))
  unnesters <-  names(ones)[names(ones) %in% names(lists[lists])]
  if (length(unnesters) == 0) return(df)

  df <- df %>% tidyr::unnest(cols = all_of(unnesters))
  deep_unnest(df)
}


