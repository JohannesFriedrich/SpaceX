#' GET info about SpaceX cores
#'
#' @param type [character]: type of the request: Choose between "upcoming" or "past".
#'
#' @param ... : Query string to API. See more in details.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' # get all cores
#' get_SpaceX_cores()
#'
#' # get core by serial number
#' get_SpaceX_cores(core_serial = "B1037")
#'
#'
#' @md
#' @export
get_SpaceX_cores <- function(
  type = NULL,
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("cores", type), query = query)

  return(data)

}
