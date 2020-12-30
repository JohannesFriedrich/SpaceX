#' GET info about SpaceX rockets
#'
#' @param ... : Query string to API. See more in details.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' ## get details about all rockets
#' get_SpaceX_rockets()
#'
#' ## get details about "falcon1" rocket
#' get_SpaceX_rockets(rocket_id = "falcon1")
#'
#' @md
#' @export
get_SpaceX_rockets <- function(
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("rockets"), query = query)

  return(data)

}
