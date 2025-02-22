\name{smooth_map}
\alias{smooth_map}
\title{Smooth an input map}
\description{Smooths out inconsistencies in the map by performing a function on each pixel based on the values of surrounding pixels. Can also remove dark RGB values, typically used for map text, boundaries etc.}
\usage{smooth_map(in.raster, window.size = 25, smooth.function = mean, dark.rm = TRUE, darkValue = 100, clip.frame = FALSE)}
\arguments{
  \item{in.raster}{The SpatRaster object to be smoothed. This must be an RGB raster object, i.e. with three colour bands. Other types of raster may return an error, but can be converted e.g. in QGIS.}
  \item{window.size}{Integer. Default = 25. Must be odd. Passed to \code{\link[terra]{focal}} via \code{\link[base]{matrix}} to determine the size in pixels of the window (larger window = greater generalization). }
  \item{smooth.function}{Function. Name of an R function to apply within the window specified. Default = mean. Other functions e.g. max, min, modal are possible but run very slowly. See \code{\link[raster]{focal}} for details. }
  \item{dark.rm}{Logical. Reduce the effect of map text, boundaries etc. by removing the darkest pixels prior to smoothing. Default is TRUE. }
  \item{darkValue}{Integer. Value below which all RGB layers should have for a pixel to be removed prior to smoothing. Default is 100. Too high values result in the appearance of large patches of white (NA) appear. Too low and text etc can interfere with land use categories. }
  \item{clip.frame}{Logical. Should the smoothed map be 'clipped' to remove areas of the input raster that are not mapped (for example because the image is not straight)? Default is FALSE, which can be useful for mosaicking maps later, while TRUE keeps the classification within the bounds of the input map.}
    \item{frame.type}{Character. If clipping the frame, are the unmapped values 'black' (i.e. RGB values all zero (not always a very clean clip in these cases), or 'na'. Choosing incorrectly will just mean that the frame doesn't get clipped. Default is 'black'..}

 }
\details{
See \code{\link[terra]{focal}} for details. 
}
\value{A smoothed raster object}
\references{
Auffret, A.G., Kimberley, A., et al., 2017, HistMapR: Rapid digitization of historical maps in R, Methods in Ecology and Evolution, doi: 10.1111/2041-210X.12788., \href{https://doi.org/10.1111/2041-210X.12788}{Link}. \href{https://github.com/AGAuffret/HistMapR/}{GitHub repository.}

Hijmans, R.J. (2023) terra: Spatial Data Analysis. R package version 1.7-29, \href{https://CRAN.R-project.org/package=terra}{https://CRAN.R-project.org/package=terra.}}

\author{Alistair Auffret and Adam Kimberley}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
	ras.loc <- system.file("data/in.ras.tiff", package="HistMapR")
	in.ras <- rast(ras.loc)
  set.names(in.ras, c("red","green","blue"))
	ras.smoothed<-smooth_map(in.raster=in.ras, window.size = 5, smooth.function = mean, dark.rm = TRUE, darkValue = 80, clip.frame = FALSE)
	plotRGB(ras.smoothed)	
}
	

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
