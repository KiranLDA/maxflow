# Package maxflow

This packages provides a set of functions to set up a connectivity matrix, and then use this matrix to calculate the maximum flow of birds/animal through the migratory network

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

These packages need to be installed for it to work

```r
install.packages("fields")
install.packages("sp")
install.packages("stats)
```

### Installing

To install this package from github, make sure you first have `devtools` installed.

```r
install.packages("devtools")
```

Once devtools is installed, type:

```r
library(devtools)
devtools::install_github("KiranLDA/maxflow")
```
End with an example of getting some data out of the system or using it for a little demo

## Load and test

To make sure the package works run the following

```r
# load library
library(maxflow)

# Simulate 10 fake tracks with a mean distance of 500km
tracks <- rnorm(10, 500, 200)

# Create a fake list of sites animals were seen at with latitude, longitude and number of anumals seen there 
dta <- data.frame(Site= LETTERS[1:4], Lat= 1:4, Lon= 5:8, Pop=100:103)

# create a distance matrix
dist <- Point_2_Distance_Network(dta)

# calculate the probability of going between these sites given the distance the animal can travel
Distance_Probability(tracks, dist, adjust=2, plot=TRUE)

```

## Authors

Kiran Dhanjal-Adams

See also the [journal article](http://onlinelibrary.wiley.com/doi/10.1111/cobi.12842/full) from which this code was developped.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
