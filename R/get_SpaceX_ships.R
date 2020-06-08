#' GET info about SpaceX missions
#'
#' @param ... : Query string to API. See more in details.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' # get all SpaceX ships
#' get_SpaceX_ships()
#'
#' get_SpaceX_ships(ship_id = "AMERICANCHAMPION")
#'
#' @md
#' @export
get_SpaceX_ships <- function(
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("ships"), query = query)

  return(data)

}
