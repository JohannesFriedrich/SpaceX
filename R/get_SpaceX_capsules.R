#' GET info about SpaceX capsules
#'
#' @param type [character]: type of the request: Choose between "upcoming" or "past".
#'
#' @param ... : Query string to API. See more in details.
#'
#' @examples
#'
#' # get all capsules
#' get_SpaceX_capsules()
#'
#' # get past capsules
#' get_SpaceX_capsules("past")
#'
#' @return [data.frame] with parsed data from SpaceX API.
#' @md
#' @export
get_SpaceX_capsules <- function(
  type = NULL,
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("capsules", type), query = query)

  return(data)

}
