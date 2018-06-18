#' Only allow the network to flow from source to sink
#'
#' @description This function replaces the bottom side of the distance network with zeroes. This ensures that everything can only go in one direction. i.e. from code example A to B, A to C, A to D, B to C, B to D and C to D
#'
#' @param dist This is a distance matrix between two sites
#'
#' @return A distance matrix in kilometres between all pairs sites
#'
#' @examples
#' dta <- data.frame(Site= LETTERS[1:4], Lat= 1:4, Lon= 5:8, Pop=100:103)
#' dist <- Point_2_Distance_Network(dta)
#' Make_Directed_Network(dist)
#'
#'
#' @export
Make_Directed_Network <- function(dist){
  dist[lower.tri(dist, diag = FALSE)] <- 0
  return(dist)
}
