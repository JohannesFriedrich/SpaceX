#' GET info about SpaceX rockets
#'
#' @param name [character]: Name of the rocket. Choose between "falcon1", "falcon9" or "falconheavy".
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
get_SpaceX_rockets <- function(name = NULL) {

  data <- create_SpaceX_request(path = c("rockets", name))

  return(data)

}
