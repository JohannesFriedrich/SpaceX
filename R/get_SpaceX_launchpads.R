#' GET info about SpaceX launchpads
#'
#' @param name [character]: Name of lauchnpads. Choose "ksc_lc_39a" or NULL.
#' By default all three rocket data are returned.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' ## get details about all launchpads
#' get_SpaceX_launchpads()
#'
#' ## get details about launchpad "ksc_lc_39a"
#' get_SpaceX_launchpads("ksc_lc_39a")
#'
#' @md
#' @export
get_SpaceX_launchpads <- function(name = NULL) {

  data <- create_SpaceX_request(path = c("launchpads", name))

  return(data)

}
