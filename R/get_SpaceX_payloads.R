#' GET info about SpaceX payloads
#'
#' @param payload_id [character]: Payload ID.
#'
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' @md
#' @export
get_SpaceX_payloads <- function(
  payload_id = NULL,
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("payloads", payload_id), query = query)

  return(data)

}
