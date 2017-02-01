\name{plot_colour_table}
\alias{plot_colour_table}
\title{Plot a colour table for visual inspection during classification testing.}
\description{This function takes the colour summary table output from \code{\link{click_sample}} and produce the colour plot. This allows the user to create the colour plot and experiment with different values of "errors" without needing to classify the map. It does not change the colour table input, but is simply a tool to visually determine which error value should be input into the "raster_reclass" function. }
\usage{
plot_colour_table(colour.table, errors = 0)
}
\arguments{
  \item{colour.table}{Data frame. Output from \code{\link{click_sample}} (or matching dataframe).}
  \item{errors}{Integer. Adjust maximum and minimum colour bands by the standard error times this term.}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{Plots a colour table}
\references{Auffret, A.G., Kimberley, A., et al., 2017, HistMapR: Rapid classification of historical maps in R, BiorXiv, doi: doidoidoidodoi, \href{http://alistairauffret.weebly.com/}{Link}. \href{https://github.com/AGAuffret/HistMapR/}{GitHub repository.}}
\author{Alistair Auffret and Adam Kimberley}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
	data(HistMapRex.RData)
	plot_colour_table(col.table, errors = 1) }
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
