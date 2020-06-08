#' GET info about SpaceX payloads
#'
#' @param ... : Query string to API. See more in details.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' get_SpaceX_payloads()
#'
#' get_SpaceX_payloads(payload_id = "Telkom-4")
#'
#' @md
#' @export
get_SpaceX_payloads <- function(
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("payloads"), query = query)

  return(data)

}
