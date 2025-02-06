\name{click_sample}
\alias{click_sample}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Sample raster values within map categories }
\description{Function for sampling the RGB values at n points of an image within n categories, using the click() function from the raster package. These values can then be used to define thresholds for reclassifying the raster image. }
\usage{click_sample(in.raster, cats = NULL, npoints = 10, print.values = FALSE, type = "p", plot.cols = TRUE, ...)}
\arguments{
  \item{in.raster}{The SpatRaster to sample. Only works for an image file, and bands MUST be named "red", "green", and "blue" (exactly, in that order) for it to work. }
  \item{cats}{A vector of the names of land-use categories of interest (string). }
  \item{npoints}{The number of times to sample each category. More points means more representative results, but generally the default is enough if you make sure that you sample the full range of colours for each category, provided points are well chosen. Default = 10.}
  \item{print.values}{Logical. Print the RGB values of each point as you go. Default = FALSE.}
  \item{type}{Logical. From \code{\link[terra]{click}}. Do you want to plot the points on the image so you know where you've already clicked (and if you miss!). Default = TRUE.}
  \item{plot.cols}{Logical. Produce the plot of max or min colours once sampling is finished. Requires packages \code{ggplot} and \code{gridExtra}. Default = TRUE.}
  \item{\dots}{additional parameters passed to \code{\link{plot_colour_table}}}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{Returns a list with three objects:
	\item{sample.table}{Dataframe. The values for each point clicked and the category they were assigned in.}
	\item{colour.summary}{Dataframe. Summary of max, min and mean values for each colour band in each category}
	\item{colour.plot}{Plot. Visualises the values in colour.summary and check they fit expectations.}
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
	data(HistMapRex)
	click_sample(in.raster=ras.smoothed, cats = c("Arable", "Open", "Forest"), npoints = 3, print.values = FALSE, type = "p", plot.cols = TRUE)
	 }

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
