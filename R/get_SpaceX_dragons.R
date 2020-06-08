#' GET info about SpaceX all dragon capsules
#'
#' @param ... : Query string to API. See more in details.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' # get all data for dragon capsules
#' get_SpaceX_dragons()
#'
#' # get data for "dragon1"
#' get_SpaceX_dragons(id = "dragon1")
#'
#' @md
#' @export
get_SpaceX_dragons <- function(
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("dragons"), query = query)

  return(data)

}
