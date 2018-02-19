#' GET info about SpaceX capsules
#'
#' @param name [character]: Name of the capsule. Choose between "dragon1", "dragon2" or "crewdragon".
#' By default all three rocket data are returned.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#' @md
#' @export
get_SpaceX_capsules <- function(name = NULL) {

  data <- create_SpaceX_request(path = c("capsules", name))

  return(data)

}
