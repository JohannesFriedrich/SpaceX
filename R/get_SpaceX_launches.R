#' GET info about SpaceX launches
#'
#' @param type [character]: type of the request: Choose between "upcoming", "past", "latest" or "next".
#'
#' @param ... : Query string to API. See more in details.
#'
#' @examples
#'
#' ## get details about all past launches
#' get_SpaceX_launches()
#'
#' ## get details about all upcoming launches
#' get_SpaceX_launches(type = "upcoming")
#'
#' ## get details about the lastes launch
#' get_SpaceX_launches(type = "latest")
#'
#' ## get details about all past launches in 2018
#' get_SpaceX_launches(launch_year = 2018)
#'
#' ## get details about a special flight_id
#' get_SpaceX_launches(flight_id = "5a9fc479ab70786ba5a1eaaa")
#'
#' @return [data.frame] with parsed data from SpaceX API.
#' @md
#' @export
get_SpaceX_launches <- function(
  type = NULL,
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("launches", type), query = query)

  return(data)

}
