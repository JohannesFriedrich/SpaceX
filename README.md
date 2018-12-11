
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

73

</td>

<td style="text-align:left;">

GPS IIIA-1

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2018

</td>

<td style="text-align:right;">

1545142200

</td>

<td style="text-align:left;">

2018-12-18T14:10:00.000Z

</td>

<td style="text-align:left;">

2018-12-18T09:10:00-05:00

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

74

</td>

<td style="text-align:left;">

Iridium NEXT Mission 8

</td>

<td style="text-align:left;">

F3364BF

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1546876380

</td>

<td style="text-align:left;">

2019-01-07T15:53:00.000Z

</td>

<td style="text-align:left;">

2019-01-07T07:53:00-08:00

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

75

</td>

<td style="text-align:left;">

CCtCap Demo Mission 1

</td>

<td style="text-align:left;">

EE86F74

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1547683200

</td>

<td style="text-align:left;">

2019-01-17T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-01-16T19:00:00-05:00

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

day

</td>

</tr>

<tr>

<td style="text-align:right;">

76

</td>

<td style="text-align:left;">

PSN-6 / GTO-1 / SpaceIL Moon Lander

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1550016000

</td>

<td style="text-align:left;">

2019-02-13T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-02-12T19:00:00-05:00

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

day

</td>

</tr>

<tr>

<td style="text-align:right;">

77

</td>

<td style="text-align:left;">

ArabSat 6A

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1548979200

</td>

<td style="text-align:left;">

2019-02-01T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-01-31T19:00:00-05:00

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

78

</td>

<td style="text-align:left;">

CRS-17

</td>

<td style="text-align:left;">

EE86F74

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1550361600

</td>

<td style="text-align:left;">

2019-02-17T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-02-16T19:00:00-05:00

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

day

</td>

</tr>

<tr>

<td style="text-align:right;">

79

</td>

<td style="text-align:left;">

RADARSAT C-1, C-2, C-3

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1550448000

</td>

<td style="text-align:left;">

2019-02-18T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-02-17T16:00:00-08:00

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

day

</td>

</tr>

<tr>

<td style="text-align:right;">

80

</td>

<td style="text-align:left;">

STP-2

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1551398400

</td>

<td style="text-align:left;">

2019-03-01T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-02-28T19:00:00-05:00

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

81

</td>

<td style="text-align:left;">

SARah 1

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1546300800

</td>

<td style="text-align:left;">

2019-01-01T00:00:00.000Z

</td>

<td style="text-align:left;">

2018-12-31T16:00:00-08:00

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

quarter

</td>

</tr>

<tr>

<td style="text-align:right;">

82

</td>

<td style="text-align:left;">

CRS-18

</td>

<td style="text-align:left;">

EE86F74

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1557187200

</td>

<td style="text-align:left;">

2019-05-07T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-05-06T20:00:00-04:00

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

day

</td>

</tr>

<tr>

<td style="text-align:right;">

83

</td>

<td style="text-align:left;">

Crew Dragon In Flight Abort Test

</td>

<td style="text-align:left;">

EE86F74

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1556668800

</td>

<td style="text-align:left;">

2019-05-01T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-04-30T20:00:00-04:00

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

84

</td>

<td style="text-align:left;">

CCtCap Demo Mission 2

</td>

<td style="text-align:left;">

EE86F74

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1559347200

</td>

<td style="text-align:left;">

2019-06-01T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-05-31T20:00:00-04:00

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

85

</td>

<td style="text-align:left;">

Amos-17

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1554076800

</td>

<td style="text-align:left;">

2019-04-01T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-03-31T20:00:00-04:00

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

quarter

</td>

</tr>

<tr>

<td style="text-align:right;">

86

</td>

<td style="text-align:left;">

GiSAT-1

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1546300800

</td>

<td style="text-align:left;">

2019-01-01T00:00:00.000Z

</td>

<td style="text-align:left;">

2018-12-31T19:00:00-05:00

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

half

</td>

</tr>

<tr>

<td style="text-align:right;">

86

</td>

<td style="text-align:left;">

USCV-1 (NASA Crew Flight 1)

</td>

<td style="text-align:left;">

EE86F74

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1564617600

</td>

<td style="text-align:left;">

2019-08-01T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-07-31T20:00:00-04:00

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

87

</td>

<td style="text-align:left;">

SAOCOM 1B

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1567296000

</td>

<td style="text-align:left;">

2019-09-01T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-08-31T17:00:00-07:00

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

88

</td>

<td style="text-align:left;">

CRS-19

</td>

<td style="text-align:left;">

EE86F74

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1571097600

</td>

<td style="text-align:left;">

2019-10-15T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-10-14T20:00:00-04:00

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

day

</td>

</tr>

<tr>

<td style="text-align:right;">

89

</td>

<td style="text-align:left;">

GPS IIIA-3

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

2019

</td>

<td style="text-align:right;">

1569888000

</td>

<td style="text-align:left;">

2019-10-01T00:00:00.000Z

</td>

<td style="text-align:left;">

2019-09-30T20:00:00-04:00

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

month

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
