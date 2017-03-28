\name{smooth_map}
\alias{smooth_map}
\title{Smooth an input map}
\description{Smooths out inconsistencies in the map by performing a function on each pixel based on the values of surrounding pixels. Can also remove dark RGB values, typically used for map text, boundaries etc.}
\usage{smooth_map(in.raster, window.size = 25, smooth.function = mean, dark.rm = TRUE, darkValue = 100, pad = TRUE, padValue = NA)}
\arguments{
  \item{in.raster}{The raster object to be smoothed. }
  \item{window.size}{Integer. Default = 25. Must be odd. Passed to \code{\link[raster]{focal}} via \code{\link[base]{matrix}} to determine the size in pixels of the window (larger window = greater generalization). }
  \item{smooth.function}{Function. Name of an R function to apply within the window specified. Default = mean. Other functions e.g. max, min, modal are possible but run very slowly. See \code{\link[raster]{focal}} for details. }
  \item{dark.rm}{Logical. Reduce the effect of map text, boundaries etc. by removing the darkest pixels prior to smoothing. Default is TRUE. }
  \item{darkValue}{Integer. Value below which all RGB layers should have for a pixel to be removed prior to smoothing. Default is 100. Too high values result in the appearance of large patches of white (NA) appear. Too low and text etc can interfere with land use categories. }
  \item{pad}{Logical. Pad the raster to avoid shrinkage. Default is TRUE. See \code{\link[raster]{focal}} for details. }
  \item{padValue}{Value to pad the raster with. Default = NA. }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{A smoothed raster object}
\references{Auffret, A.G., Kimberley, A., et al., 2017, HistMapR: Rapid digitization of historical maps in R, BiorXiv, doi: 10.1101/109504, \href{https://doi.org/10.1101/109504}{Link}. \href{https://github.com/AGAuffret/HistMapR/}{GitHub repository.}

{Hijmans, R.J. (2016) raster: Geographic Data Analysis and Modeling. R package version 2.5-8, url: \href{http://CRAN.R-project.org/package=raster.}http://CRAN.R-project.org/package=raster.}}

\author{Alistair Auffret and Adam Kimberley}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
	data(HistMapRex)
	names(in.ras)<-c("red","green","blue")	
	ras.smoothed<-smooth_map(in.raster=in.ras, window.size = 5, smooth.function = mean, dark.rm = TRUE, darkValue = 80, pad = TRUE, padValue = NA)
	plotRGB(ras.smoothed)	
}
	

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
