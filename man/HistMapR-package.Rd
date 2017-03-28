\name{HistMapR-package}
\alias{HistMapR-package}
\alias{HistMapR}
\docType{package}
\title{Rapid digitization of historical land-use maps in R}
\description{Contains four functions for smoothing, colour assignment and classification of scanned historical land-use maps. Draws mostly from the \code{\link[raster]{raster}} package by R. Hijmans.}
\usage{
smooth_map(in.raster, window.size = 25, smooth.function = mean, dark.rm = TRUE, darkValue = 100, pad = TRUE, padValue = NA)

click_sample(in.raster, cats = NULL, npoints = 10, print.values = FALSE, type = "p", plot.cols = TRUE, ...)

plot_colour_table(colour.table, errors = 0)

class_map(in.raster, colour.table = NULL, errors = 0, exceptions = NULL, plot.raster = TRUE, raster.summary = FALSE, save.raster = FALSE, out.file = NULL)
}

\details{
\tabular{ll}{
Package: \tab HistMapR\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
Date: \tab 2017-01-26\cr
License: \tab MIT\cr
}

}
\author{Alistair Auffret and Adam Kimberley

Maintainer: Alistair Auffret <alistair.auffret@natgeo.su.se>
}
\references{Auffret, A.G., Kimberley, A., et al., 2017, HistMapR: Rapid digitization of historical maps in R, BiorXiv, doi: 10.1101/109504, \href{https://doi.org/10.1101/109504}{Link}. \href{https://github.com/AGAuffret/HistMapR/}{GitHub repository.}}

{Hijmans, R.J. (2016) raster: Geographic Data Analysis and Modeling. R package version 2.5-8, url: \href{http://CRAN.R-project.org/package=raster.}http://CRAN.R-project.org/package=raster.}
\keyword{ package }

\examples{See individual functions for examples}
