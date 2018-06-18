# Package maxflow

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

This packages need to be installed for it to work

```
install.packages("fields")
install.packages("sp")
install.packages("stats)
```

### Installing

To install this package from github, make sure you first have `devtools` installed.

```
install.packages("devtools")
```

Once devtools is installed, type:

```
library(devtools)
devtools::install_github("KiranLDA/maxflow")
```
End with an example of getting some data out of the system or using it for a little demo

## Load and test

To make sure the package works run the following

```
library(maxflow)
tracks <- rnorm(10, 500, 200)
dta <- data.frame(Site= LETTERS[1:4], Lat= 1:4, Lon= 5:8, Pop=100:103)
dist <- Point_2_Distance_Network(dta)
Distance_Probability(tracks, dist, adjust=2, plot=TRUE)

```

## Authors

Kiran Dhanjal-Adams

See also the [journal article](http://onlinelibrary.wiley.com/doi/10.1111/cobi.12842/full) from which this code was developped.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
