\name{HistWrapR}
\alias{HistWrapR}
\title{Smooth and classify a raster. }
\description{A wrapper function that runs both \code{\link{smooth_map}} and \code{\link{class_map}}, useful for iterating the same arguments over similar maps with \code{\link{lapply}} or \code{\link{parallel::mclapply}}. My experience is that running multiple maps \code{lapply} is not quicker than a \code{for} loop running the two HistMapR functions separately, and looping makes it easier to follow progress. However, parallelisation with \code{mclapply} has the potential to be considerably faster, hence this function}
\usage{HistWrapR(ras.file, colour.table=NULL, out.format="save", out.dir=".", ...)}
\arguments{
  \item{ras.file}{The path to the input raster to be smoothed and classified. Note that this is not the raster object itself (as with other functions in HistMapR), but the path to it, which allows for parallelisation. }
  \item{colour.table}{Dataframe containing colour thresholds for different categories. Should either be an output from \code{\link{click_sample}} or else have an identical structure.}
  \item{out.format}{"save" saves the classified raster, while "return" returns it as an object. }
  \item{out.dir}{The directory where rasters should be saved. }
  \item{...}{Additional arguments passed to \code{\link{smooth_map}} (e.g. darkValue or window.size) and \code{\link{class_map}} (e.g. exceptions or errors. Those not specified will take default arguments from the functions. }

}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{Saves or returns the classified raster. 
}
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
	HistWrapR(ras.file=ras.loc, colour.table = col.table, out.format="return") 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
