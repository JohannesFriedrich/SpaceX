% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_SpaceX_capsules.R
\name{get_SpaceX_capsules}
\alias{get_SpaceX_capsules}
\title{GET info about SpaceX capsules}
\usage{
get_SpaceX_capsules(type = NULL, ...)
}
\arguments{
\item{type}{\link{character}: type of the request: Choose between "upcoming" or "past".}

\item{...}{: Query string to API. See more in details.}
}
\value{
\link{data.frame} with parsed data from SpaceX API.
}
\description{
GET info about SpaceX capsules
}
\examples{

# get all capsules
get_SpaceX_capsules()

# get past capsules
get_SpaceX_capsules("past")

}
