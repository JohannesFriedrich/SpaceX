
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

## Play around with data

``` r
get_SpaceX_launches() %>% 
ggplot() + 
  geom_bar(aes(launch_year, fill = launch_site$site_name)) +
  facet_grid(rocket$rocket_name~launch_success, scales = "free_x") +
  theme(legend.position = "bottom") + 
  scale_fill_discrete(name = "Launch Site") +
  labs(x = "Year", y = "Counts")
```

<img src="README_figs/README-past_launches-1.png" width="672" style="display: block; margin: auto;" />

Now we request some data about the used rockets. This can be done with
the function
`get_SpaceX_rockets()`.

``` r
rockets <- get_SpaceX_rockets()
```

| rocketid i | d n         | ame t             | ype a  | ctive | stages | boosters | cost\_per\_launch | success\_rate\_pct |
| ---------- | ----------- | ----------------- | ------ | :---- | :----- | :------- | :---------------- | :----------------- |
| 1          | falcon1     | Falcon 1          | rocket | FALSE | 2      | 0        | 6.7e+06           | 40                 |
| 2          | falcon9     | Falcon 9          | rocket | TRUE  | 2      | 0        | 5.0e+07           | 97                 |
| 3          | falconheavy | Falcon Heavy      | rocket | TRUE  | 2      | 2        | 9.0e+07           | 100                |
| 4          | bfr         | Big Falcon Rocket | rocket | FALSE | 2      | 0        | 7.0e+06           | 0                  |

## Related projects

  - [SpaceX](http://www.spacex.com/)
  - [SpaceX-API](https://github.com/r-spacex/SpaceX-API)
