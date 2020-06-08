
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SpaceX - An R API wrapper for the SpaceX project

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

## Installation

Until now the package is not on CRAN but you can download it via GitHub
with the following command:

``` r
if (!require("devtools"))
  install.packages("devtools")
devtools::install_github("JohannesFriedrich/SpaceX")
```

## Introduction

The **R**-package *SpaceX* is an API wrapper for data collected by
<https://api.spacexdata.com/v2/>. You can request available data with
different
functions:

| Function name             | Description                                   | Example                           |
| ------------------------- | --------------------------------------------- | --------------------------------- |
| get\_SpaceX\_info()       | request common information about SpaceX       | get\_SpaceX\_info()               |
| get\_SpaceX\_launches()   | request launches                              | get\_SpaceX\_launches()           |
| get\_SpaceX\_launchpads() | request launchpad data                        | get\_SpaceX\_launchpads()         |
| get\_SpaceX\_capsules()   | request data about capsules                   | get\_SpaceX\_capsules()           |
| get\_SpaceX\_rockets()    | request data about different rockets          | get\_SpaceX\_rockets()            |
| get\_SpaceX\_parts()      | request data about parts of capsules or cores | get\_SpaceX\_parts(type = “caps”) |

## Request basic information from SpaceX API <a id="basic_information"></a>

First we load some needed packages. The function `get_SpaceX_info()`
will deliver some information about the company.

``` r
library(SpaceX)
library(ggplot2)
library(dplyr)

info <- get_SpaceX_info()
```

``` r
info
```

<table>

<thead>

<tr>

<th style="text-align:left;">

name

</th>

<th style="text-align:left;">

founder

</th>

<th style="text-align:right;">

founded

</th>

<th style="text-align:right;">

employees

</th>

<th style="text-align:right;">

vehicles

</th>

<th style="text-align:right;">

launch\_sites

</th>

<th style="text-align:right;">

test\_sites

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

SpaceX

</td>

<td style="text-align:left;">

Elon Musk

</td>

<td style="text-align:right;">

2002

</td>

<td style="text-align:right;">

7000

</td>

<td style="text-align:right;">

3

</td>

<td style="text-align:right;">

3

</td>

<td style="text-align:right;">

1

</td>

</tr>

</tbody>

</table>

## Request upcoming starts

``` r
upcoming <- get_SpaceX_launches("upcoming")
```

<table>

<thead>

<tr>

<th style="text-align:right;">

flight\_number

</th>

<th style="text-align:left;">

mission\_name

</th>

<th style="text-align:left;">

mission\_id

</th>

<th style="text-align:left;">

launch\_year

</th>

<th style="text-align:right;">

launch\_date\_unix

</th>

<th style="text-align:left;">

launch\_date\_utc

</th>

<th style="text-align:left;">

launch\_date\_local

</th>

<th style="text-align:left;">

is\_tentative

</th>

<th style="text-align:left;">

tentative\_max\_precision

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

96

</td>

<td style="text-align:left;">

Starlink-8 & SkySat 16-18

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2020

</td>

<td style="text-align:right;">

1592010000

</td>

<td style="text-align:left;">

2020-06-13T01:00:00.000Z

</td>

<td style="text-align:left;">

2020-06-12T21:00:00-04:00

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:left;">

hour

</td>

</tr>

<tr>

<td style="text-align:right;">

97

</td>

<td style="text-align:left;">

Starlink-9

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2020

</td>

<td style="text-align:right;">

1590969600

</td>

<td style="text-align:left;">

2020-06-01T00:00:00.000Z

</td>

<td style="text-align:left;">

2020-05-31T20:00:00-04:00

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

month

</td>

</tr>

<tr>

<td style="text-align:right;">

98

</td>

<td style="text-align:left;">

GPS III SV03 (Columbus)

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2020

</td>

<td style="text-align:right;">

1593546900

</td>

<td style="text-align:left;">

2020-06-30T19:55:00.000Z

</td>

<td style="text-align:left;">

2020-06-30T15:55:00-04:00

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:left;">

hour

</td>

</tr>

</tbody>

</table>

## Play around with data

``` r
get_SpaceX_launches() %>% 
ggplot() + 
  geom_bar(aes(launch_year, fill = launch_site$site_name)) +
  facet_grid(rocket$rocket_name~launch_success, scales = "free_x") +
  theme(legend.position = "bottom") + 
  scale_fill_discrete(name = "Launch Site") +
  labs(x = "Year", y = "Counts") +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 45, hjust = 1))
```

<img src="README_figs/README-past_launches-1.png" width="672" style="display: block; margin: auto;" />

Now we request some data about the used rockets. This can be done with
the function `get_SpaceX_rockets()`.

``` r
rockets <- get_SpaceX_rockets()
```

<table>

<thead>

<tr>

<th style="text-align:right;">

rocketid

</th>

<th style="text-align:left;">

id

</th>

<th style="text-align:left;">

name

</th>

<th style="text-align:left;">

type

</th>

<th style="text-align:left;">

active

</th>

<th style="text-align:right;">

stages

</th>

<th style="text-align:right;">

boosters

</th>

<th style="text-align:right;">

cost\_per\_launch

</th>

<th style="text-align:right;">

success\_rate\_pct

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

1

</td>

<td style="text-align:left;">

falcon1

</td>

<td style="text-align:left;">

Falcon 1

</td>

<td style="text-align:left;">

rocket

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

6.7e+06

</td>

<td style="text-align:right;">

40

</td>

</tr>

<tr>

<td style="text-align:right;">

2

</td>

<td style="text-align:left;">

falcon9

</td>

<td style="text-align:left;">

Falcon 9

</td>

<td style="text-align:left;">

rocket

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

5.0e+07

</td>

<td style="text-align:right;">

97

</td>

</tr>

<tr>

<td style="text-align:right;">

3

</td>

<td style="text-align:left;">

falconheavy

</td>

<td style="text-align:left;">

Falcon Heavy

</td>

<td style="text-align:left;">

rocket

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

9.0e+07

</td>

<td style="text-align:right;">

100

</td>

</tr>

<tr>

<td style="text-align:right;">

4

</td>

<td style="text-align:left;">

starship

</td>

<td style="text-align:left;">

Starship

</td>

<td style="text-align:left;">

rocket

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

7.0e+06

</td>

<td style="text-align:right;">

0

</td>

</tr>

</tbody>

</table>

## Stats 2020

``` r
stats_2020 <- get_SpaceX_launches(launch_year = 2020)

payload <- stats_2020$rocket$second_stage$payloads %>% 
  lapply(function(x){
  x %>%   
    select(payload_id, payload_type, payload_mass_kg)
  
}) %>% 
  bind_rows()
```

``` r
payload
##                         payload_id payload_type payload_mass_kg
## 1                       Starlink 2    Satellite           15400
## 2 Crew Dragon In Flight Abort Test  Crew Dragon              NA
## 3                       Starlink 3    Satellite           15600
## 4                       Starlink 4    Satellite           15400
## 5                           CRS-20   Dragon 1.1            1977
## 6                       Starlink 5    Satellite           15600
## 7                       Starlink 6    Satellite           15400
## 8            CCtCap Demo Mission 2  Crew Dragon            9525
## 9                       Starlink 7    Satellite           15400
```

## Related projects

  - [SpaceX](http://www.spacex.com/)
  - [SpaceX-API](https://github.com/r-spacex/SpaceX-API)
