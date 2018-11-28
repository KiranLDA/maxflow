#' Make a distance matrix
#'
#' @param dta This is a dataframe. Columns of interest must be named: Site, Lat (for latitude), Lon (for longitude).
#'
#' @return A distance matrix in kilometres between all pairs sites
#'
#' @examples
#' dta <- data.frame(Site= LETTERS[1:4], Lat= 1:4, Lon= 5:8, Pop=100:103)
#' point2DIST(dta)
#'
#'
#' @export
point2DIST <- function(dta){
  # Project latitude and longitude
  pts  = SpatialPoints(coords = cbind(dta$Lat, dta$Lon), proj4string=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs "))
  # Calculate earth distances and spit out distance matrix
  dist = rdist.earth(pts@coords)
  colnames(dist) = rownames(dist) = dta$Site
  return(dist)
}
