# Package maxflow

This packages provides a set of functions to set up a connectivity matrix, and then use this matrix to calculate the maximum flow of birds/animal through the migratory network

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 


<img align="center" src="https://kirandhanjaladams.weebly.com/uploads/8/0/0/5/80051220/turnstones_1_orig.png">

### Prerequisites

This package relies on ´igraph´, ´fields´, ´sp´ and ´stats´. If there are any problem installing maxflow, ensure these are working.


### Installing

To install this package from github, make sure you first have `devtools` installed.

```r
install.packages("devtools")
```

Once devtools is installed, use:

```r
devtools::install_github("KiranLDA/maxflow")
```

## Load and test


```r
# load library
library(maxflow)

# Simulate 10 fake tracks with a mean distance of 500km
tracks <- rnorm(10, 500, 200)
rgamma(10, 500, 200)

# Create a fake list of sites where animals were seen at, with latitude, longitude and number of anumals seen there 
dta <- data.frame(Site= LETTERS[1:5], Lat= 1:5, Lon= 6:10, Pop=100:104)

# create a distance matrix based on these data
dist <- point2DIST(dta)

# calculate the probability of going between these sites given the distance the animal can travel
Dist_P <- distPROB(tracks, dist, adjust=2, plot=TRUE)

# Calculate proportion of population using a site
Pop_P <- nodePopPROP(dta, 300000)

#Calculate the azimuth angle
Azi_P <- absAZIMUTH(dist, lonlats=dta )

# make birds/animals prefer sites which a larger proportion of the population has been seen and where the distance is better
network <- Dist_P * Pop_P * Azi_P

# Make the network directed
network <- directedNET(network, include_diagonal = TRUE)

#estimate number of birds entering and exiting sites based on distance, population count and azimuth
network <- popPROP(network, 300000)

#Add supersource and sink nodes
network <- addSUPERNODE(network, sources=c("A","B"), sinks= c("D", "E"))
network
```

### Creating a random network and prioritising sites

```r
pop=100000
rand_net = randomNET(nsites=15,pop=pop)

# priotise sites according to flow through network
prioritiseFLOW(rand_net$network, rand_net$sites)
```

<img align="center" src="https://raw.githubusercontent.com/KiranLDA/maxflow/master/pictures/netowrk_prioritisation.png">

## Authors

Kiran Dhanjal-Adams

## Citation

Dhanjal‐Adams, K. L., Klaassen, M. , Nicol, S. , Possingham, H. P., Chadès, I. and Fuller, R. A. (2017), Setting conservation priorities for migratory networks under uncertainty. Conservation Biology, 31: 646-656. [doi:10.1111/cobi.12842](https://doi.org/10.1111/cobi.12842) 

## License

This project is licensed under the GNU General Public License version 3 - see the [LICENSE](https://github.com/KiranLDA/maxflow/blob/master/LICENSE) file for details



