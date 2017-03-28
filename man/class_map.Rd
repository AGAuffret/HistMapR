\name{class_map}
\alias{class_map}
\title{Classify a raster. }
\description{Classify a raster image based on table of identified colour thresholds. }
\usage{class_map(in.raster, colour.table = NULL, errors = 0, exceptions = NULL, plot.raster = TRUE, raster.summary = FALSE, save.raster = FALSE, out.file = NULL)}
\arguments{
  \item{in.raster}{The smoothed raster to be Classified. }
  \item{colour.table}{Dataframe containing colour thresholds for different categories. Should either be an output from \code{\link{click_sample}} or else have an identical structure.}
  \item{errors}{Integer. Expand the range by n x the standard error within a sample. Higher numbers mean a larger range, but also increase the likelihood and magnitude of overlap between categories. }
  \item{exceptions}{Assign those (non-NA) pixels not falling within any colours in the colour table as a specific category string. Defaults to NULL, which can be useful for inspection, but will usually be assigned to a category in the end. }
  \item{plot.raster}{Logical. Plots the resulting classification, showing first the input raster, then each category separately, finishing with pixels not assigned to any class. }
  \item{raster.summary}{Logical. Print summary statistics describing the number of pixels and area (according to the attributes of the in raster)for each category in the classified raster. }
  \item{save.raster}{Logical. Do you want to save the resulting raster using \code{\link[raster]{writeRaster}}? Saves as GeoTiff with the data type INT1U.}
  \item{out.file}{Character. Filepath and name to pass to writeRaster. Include extenstion ".tif" (one f)}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{Returns the classified raster. Values of raster cells in the output correspond to row numbers in the colour table input, i.e. the category represented by the first row will be 1, the second row 2 etc. Pixels that don't fit into any category (unless specified with 'exceptions') are given 0.
}
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
	class_map(in.raster=ras.smoothed, colour.table = col.table, errors = 5, exceptions = "Arable", plot.raster = TRUE, raster.summary = TRUE, save.raster = FALSE, out.file = NULL) 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
