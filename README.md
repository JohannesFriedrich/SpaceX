
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

bfr

</td>

<td style="text-align:left;">

Big Falcon Rocket

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

## Related projects

  - [SpaceX](http://www.spacex.com/)
  - [SpaceX-API](https://github.com/r-spacex/SpaceX-API)
