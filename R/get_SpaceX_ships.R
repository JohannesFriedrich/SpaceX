#' GET info about SpaceX missions
#'
#' @param ship_id [character]: Ship ID.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#' # get all SpaceX ships
#' get_SpaceX_ships()
#'
#' get_SpaceX_ships(ship_id = "AMERICANCHAMPION")
#'
#' get_SpaceX_ships(AMERICANCHAMPION")
#'
#' @md
#' @export
get_SpaceX_ships <- function(
  ship_id = NULL,
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("ships", ship_id), query = query)

  return(data)

}
