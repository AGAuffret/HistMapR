\name{HistMapR-package}
\alias{HistMapR-package}
\alias{HistMapR}
\docType{package}
\title{Rapid digitization of historical land-use maps in R}
\description{Contains four functions for smoothing, colour assignment and classification of scanned historical land-use maps. Draws mostly from the \code{\link[terra]{terra}} package by R. Hijmans.}
\usage{
smooth_map(in.raster, window.size = 25, smooth.function = mean, dark.rm = TRUE, darkValue = 100, clip.frame = FALSE)

click_sample(in.raster, cats = NULL, npoints = 10, print.values = FALSE, type = "p", plot.cols = TRUE, ...)

plot_colour_table(colour.table, errors = 0)

class_map(in.raster, colour.table = NULL, errors = 0, exceptions = NULL, plot.raster = TRUE, raster.summary = FALSE, save.raster = FALSE, out.file = NULL)
}

\details{
\tabular{ll}{
Package: \tab HistMapR\cr
Type: \tab Package\cr
Version: \tab 0.2\cr
Date: \tab 2025-02-06\cr
License: \tab MIT\cr
}

}
\author{Alistair Auffret and Adam Kimberley

Maintainer: Alistair Auffret <alistair.auffret@slu.se>
}
\references{
Auffret, A.G., Kimberley, A., et al., 2017, HistMapR: Rapid digitization of historical maps in R, Methods in Ecology and Evolution, doi: 10.1111/2041-210X.12788., \href{https://doi.org/10.1111/2041-210X.12788}{Link}. \href{https://github.com/AGAuffret/HistMapR/}{GitHub repository.}

Hijmans, R.J. (2023) terra: Spatial Data Analysis. R package version 1.7-29, \href{https://CRAN.R-project.org/package=terra}{https://CRAN.R-project.org/package=terra.}}

\keyword{ package }

\examples{See individual functions for examples}
