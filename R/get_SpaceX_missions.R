#' GET info about SpaceX missions
#'
#' @param ... : Query string to API. See more in details.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' # get data for all missions
#' get_SpaceX_missions()
#'
#' # get data about specific mission id
#' get_SpaceX_missions(mission_id = "F3364BF")
#'
#' @md
#' @export
get_SpaceX_missions <- function(
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("missions"), query = query)

  return(data)

}
