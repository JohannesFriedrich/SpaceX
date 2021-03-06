% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_SpaceX_missions.R
\name{get_SpaceX_missions}
\alias{get_SpaceX_missions}
\title{GET info about SpaceX missions}
\usage{
get_SpaceX_missions(...)
}
\arguments{
\item{...}{: Query string to API. See more in details.}
}
\value{
\link{data.frame} with parsed data from SpaceX API.
}
\description{
GET info about SpaceX missions
}
\examples{

# get data for all missions
get_SpaceX_missions()

# get data about specific mission id
get_SpaceX_missions(mission_id = "F3364BF")

}
