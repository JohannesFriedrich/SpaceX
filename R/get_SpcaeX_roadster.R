#' GET info about gives orbital parameters about the current position of Elon's Tesla Roadster
#' that was launched on the first Falcon Heavy demo flight.
#'
#' @param ... : Query string to API. See more in details.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' ## get details about the Tesla roadster position
#' get_SpaceX_roadster()
#'
#' @md
#' @export
get_SpaceX_roadster <- function(
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("roadster"), query = query)

  return(data)

}
