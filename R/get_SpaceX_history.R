#' GET info about SpaceX history
#'
#' @param ... : Query string to API. See more in details.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' # get all data
#' get_SpaceX_history()
#'
#' get_SpaceX_history(17)
#'
#' # get data with flight_number 41
#' get_SpaceX_history(flight_number = "41")
#'
#' @md
#' @export
get_SpaceX_history <- function(
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("history"), query = query)

  return(data)

}
