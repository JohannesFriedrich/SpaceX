#' GET info about SpaceX landpads
#'
#' @param ... : Query string to API. See more in details.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' # get all all landpads
#' get_SpaceX_landpads()
#'
#' # get landing pads by id
#' get_SpaceX_landpads(id = "LZ-4")
#'
#' @md
#' @export
get_SpaceX_landpads <- function(
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("landpads"), query = query)

  return(data)

}
