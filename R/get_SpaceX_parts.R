#' GET detailed info about SpaceX parts
#'
#' @param type [character]: Type of parts. Choose between "caps" for capsule details
#' or "cores" for core details.
#' @param name [character]: Name of capsule or core.
#' @param ... : Query string to API. See more in details.
#'
#' @details
#'
#' Query Strings for `type = "caps"`
#' \tabular{rr}{
#' Query Strings \tab	Description  \cr
#' capsule_serial \tab	Filter by capsule serial # \cr
#' capsule_id \tab	Filter by capsule id \cr
#' status \tab	Filter by capsule status \cr
#' original_launch \tab	Filter by original launch date \cr
#' missions \tab	Filter by flight missions \cr
#' landings \tab	Filter by # of landings \cr
#' type \tab	Filter by type of dragon capusle \cr
#'}
#'
#'Query Strings for `type = "cores"`
#' \tabular{rr}{
#' core_serial \tab	Filter by core serial # \cr
#' status \tab	Filter by flight status \cr
#' original_launch \tab	Filter by original launch date \cr
#' missions \tab	Filter by flight missions \cr
#' rtls_attempt \tab	Filter by at least 1 rtls attempt \cr
#' rtls_landings \tab	Filter by total number of landings \cr
#' asds_attempt \tab	Filter by at least 1 asds attempt \cr
#' asds_landings \tab	Filter by total number of landings \cr
#' water_landing \tab	Filter by at least 1 water landing \cr
#'}
#' @return [data.frame] with parsed data from SpaceX API.
#'
#' @examples
#'
#' ## get details about all cores
#' get_SpaceX_parts(type = "cores")
#'
#' ## get details about all capsules
#' get_SpaceX_parts(type = "caps")
#'
#' ## get details about all active capsules
#' get_SpaceX_parts(type = "caps", status = "active")
#'
#' ## get details about core B1041
#' get_SpaceX_parts(type = "cores", name = "B1041")
#'
#' @md
#' @export
get_SpaceX_parts <- function(
  type,
  name = NULL,
  ...) {

  query <- list(...)

  if (length(query) == 0) query <- NULL

  data <- create_SpaceX_request(path = c("parts", type, name), query = query)

  return(data)

}
