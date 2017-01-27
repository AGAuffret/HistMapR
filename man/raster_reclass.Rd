\name{raster_reclass}
\alias{raster_reclass}
\title{Reclassify a raster. }
\description{Reclassify a raster image based on table of identified colour thresholds. }
\usage{raster_reclass(in.raster, colour.table = NULL, errors = 0, exceptions = NULL, plot.raster = TRUE, raster.summary = FALSE, save.raster = FALSE, out.file = NULL)}
\arguments{
  \item{in.raster}{The smoothed raster to be reclassified. }
  \item{colour.table}{Dataframe containing colour thresholds for different categories. Should either be an output from \code{\link{click_sample}} or else have an identical structure.}
  \item{errors}{Integer. Expand the range by n x the standard error within a sample. Higher numbers mean a larger range, but also increase the likelihood and magnitude of overlap between categories. }
  \item{exceptions}{Assign those (non-NA) pixels not falling within any colours in the colour table as a specific category string. Defaults to NULL, which can be useful for inspection, but will usually be assigned to a category in the end. }
  \item{plot.raster}{Logical. Plots the resulting classification, showing first the input raster, then each category separately, finishing with pixels not assigned to any class. }
  \item{raster.summary}{Logical. Print summary statistics describing the number of pixels and area (according to the attributes of the in raster)for each category in the reclassified raster. }
  \item{save.raster}{Logical. Do you want to save the resulting raster using \code{\link[raster]{writeRaster}}? Saves as GeoTiff with the data type INT1U.}
  \item{out.file}{Character. Filepath and name to pass to writeRaster. Include extenstion ".tif" (one f)}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{Returns the reclassified raster. Values of raster cells in the output correspond to row numbers in the colour table input, i.e. the category represented by the first row will be 1, the second row 2 etc. Pixels that don't fit into any category (unless specified with 'exceptions') are given 0.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{Alistair Auffret and Adam Kimberley}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
\dontrun{raster_reclass(in.raster, colour.table = NULL, errors = 0, exceptions = NULL, plot.raster = TRUE, raster.summary = FALSE, save.raster = FALSE, out.file = NULL) 
}}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
