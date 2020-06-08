#' GET info about gives orbital parameters about the current position of Elon's Tesla Roadster
#' that was launched on the first Falcon Heavy demo flight.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' ## get details about the Tesla roadster position
#' get_SpaceX_roadster()
#'
#' @md
#' @export
get_SpaceX_roadster <- function() {

  data <- create_SpaceX_request(path = c("roadster"))

  return(data)

}
