#' Create request to SpaceX API
#'
#' @param path [character]: Path to requested data from SpaceX API, e.g., "info" or "rockets".
#' @param query [character]: Query to request.
#'
#' @return [data.frame] with parsed data from SpaceX API
#'
#' @section Function version 0.0.1
#' @author Johannes Friedrich
#'
#' @md
#' @export

create_SpaceX_request <- function(
  path,
  query = NULL
  ){

  host <- "https://api.spacexdata.com"

  url <- httr::modify_url(host, path = c("v2", path))

  res <- httr::GET(url, query = query)

  if (httr::http_error(res)) {
    content <-  httr::content(res, 'parsed', encoding = 'UTF-8')
    warning(
      if ('message' %in% names(content)) {
        content$message
      } else {
        paste0("Errorcode: ", httr::status_code(res), "\n")
      }, call. = FALSE)

    return(NULL)
  } else {

    content <- httr::content(res, "text")

    parsed_request <- jsonlite::fromJSON(content)

    return(parsed_request)
  }
}
