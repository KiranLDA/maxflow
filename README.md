# Package maxflow

This packages provides a set of functions to set up a connectivity matrix, and then use this matrix to calculate the maximum flow of birds/animal through the migratory network

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

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

# Create a fake list of sites where animals were seen at, with latitude, longitude and number of anumals seen there 
dta <- data.frame(Site= LETTERS[1:4], Lat= 1:4, Lon= 5:8, Pop=100:103)

# create a distance matrix based on these data
dist <- Point_2_Distance_Network(dta)

# calculate the probability of going between these sites given the distance the animal can travel
Dist_P <- Distance_Probability(tracks, dist, adjust=2, plot=TRUE)

# Calculate proportion going into a node
Pop_P <- Population_Proportion(dta, 300)

# make birds/animals prefer sites which a larger proportion of the population has been seen and where the distance is better
network <- Dist_P * Pop_P

# Make the network directed
network <- Make_Directed_Network(network, include_diagonal = TRUE)

#Add supersource and sink nodes
network <- Add_Source_Sink(network)

```

## Authors

Kiran Dhanjal-Adams

See also the [journal article](http://onlinelibrary.wiley.com/doi/10.1111/cobi.12842/full) from which this code was developped.

## License

This project is licensed under the GNU General Public License version 3 - see the [LICENSE](https://github.com/KiranLDA/maxflow/blob/master/LICENSE) file for details


## References

Dhanjal‐Adams, K. L., Klaassen, M. , Nicol, S. , Possingham, H. P., Chadès, I. and Fuller, R. A. (2017), Setting conservation priorities for migratory networks under uncertainty. Conservation Biology, 31: 646-656. [doi:10.1111/cobi.12842](https://doi.org/10.1111/cobi.12842) 
