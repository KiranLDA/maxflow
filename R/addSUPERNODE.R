#' Add supersource and supersink nodes
#'
#' @description These nodes will later act as source and sink nodes which initiate and terminate the population flow through the network. More specifically, they are added to the distance matrix with values of zero (for the time being)
#'
#' @param dist This is a distance matrix between two sites
#'
#' @return A distance matrix in kilometres between all pairs sites
#'
#' @examples
#' dta <- data.frame(Site= LETTERS[1:4], Lat= 1:4, Lon= 5:8, Pop=100:103)
#' dist <- point2DIST(dta)
#' addSUPERNODE(dist)
#'
#'
#'
#' @export
addSUPERNODE <- function(dist){
  dist = rbind(matrix(0,1,dim(dist)[2]),
               dist,
               matrix(0,1,dim(dist)[2]))
  dist = cbind(matrix(0,dim(dist)[1],1),
               dist,
               matrix(0,dim(dist)[1],1))
  colnames(dist)[1] = rownames(dist)[1] = "source"
  colnames(dist)[length(dist[1,])] = rownames(dist)[length(dist[1,])] = "sink"
  return(dist)
}
