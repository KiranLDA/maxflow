#' Only allow the network to flow from source to sink
#'
#' @description This function replaces the bottom side of the distance network with zeroes. This ensures that everything can only go in one direction. i.e. from code example A to B, A to C, A to D, B to C, B to D and C to D
#'
#' @param tracks this is a series of distances travelled - for instance a distance that a bird has been observed to fly between two sites
#' @param dist This is a distance matrix between two sites
#' @param adjust this is a parameter for estimating the Kernal density of the tracked data. see '?density' for more details. The default is 2, but increasing will flatten and decreasing will add peaks.
#' @param plot Logical (true or false) for deciding whether or not to plot the kernal density distribution
#'
#' @return A matrix of probybilityx
#'
#' @examples
#' tracks <- rnorm(10, 500, 200)
#' dta <- data.frame(Site= LETTERS[1:4], Lat= 1:4, Lon= 5:8, Pop=100:103)
#' dist <- Point_2_Distance_Network(dta)
#' Distance_Probability(tracks, dist, adjust=2, plot=TRUE)
#'
#'
#'
#' @export
Distance_Probability <- function(tracks, dist, adjust = 2, plot= TRUE){
  prob=approxfun(density(tracks,adjust=adjust))
  if (plot) plot(density(tracks,adjust=adjust), xlab= "Distance")
  dist_prob = apply(dist,c(1,2),function(x) prob(x))
  return(dist_prob)
}
