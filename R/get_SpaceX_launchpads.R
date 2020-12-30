#' GET info about SpaceX launchpads
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @param ... : Query string to API. See more in details.
#'
#' @examples
#'
#' ## get details about all launchpads
#' get_SpaceX_launchpads()
#'
#' ## get details about launchpad "ksc_lc_39a"
#' get_SpaceX_launchpads(site_id = "ksc_lc_39a")
#'
#' @md
#' @export
get_SpaceX_launchpads <- function(
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("launchpads"), query = query)

  return(data)

}
