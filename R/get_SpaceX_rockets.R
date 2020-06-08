#' GET info about SpaceX rockets
#'
#' @param name [character]: Name of the rocket. Choose between "falcon1", "falcon9","falconheavy" or "starship".
#' By default all three rocket data are returned.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' ## get details about all rockets
#' get_SpaceX_rockets()
#'
#' ## get details about "falcon1" rocket
#' get_SpaceX_rockets("falcon1")
#'
#' @md
#' @export
get_SpaceX_rockets <- function(
  rocket_id = NULL,
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("rockets", rocket_id), query = query)

  return(data)

}
