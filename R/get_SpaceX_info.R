#' GET info about SpaceX company
#'
#' @examples
#'
#' get_SpaceX_info()
#'
#' @md
#' @export
get_SpaceX_info <- function() {

  data <- create_SpaceX_request(path = "info")

  return(as.data.frame(data))

}
