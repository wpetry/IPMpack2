\name{picGrow}
\alias{picGrow}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Makes pictures of data with growth models
}
\description{
Takes the data file and a growth object and shows the model fit over the data. 
}
\usage{
picGrow(dataf, growObj, mainTitle = "Growth",...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataf}{a dataframe with columns `size' and
    `sizeNext'(`size' is continuous stage variable at t, `sizeNext' is stage variable at t+1); facultatively, dataf may include `covariate' and `covariateNext' for a single discrete covariate, indicating values at t, and at t+1, respectively; these must take values of sequential integers, starting at `1'. For models fitting growth increment, 'incr' or 'logincr' may be directly provided as a column in the dataframe, otherwise they are calculated as dataf$sizeNext-dataf$size or log(dataf$sizeNext - dataf$size), respectively.
    }

  \item{growObj}{
	an object of class growthObj that contains a fit for which R has methods for the function "predict".
}
  \item{mainTitle}{
	a character string that will be used as in the `main' argument of plot.  Defaults to `Growth'.
}
  \item{...}{
	other arguments to \code{plot}
}
}
\details{
Note that this model will only work with growth objects that contain objects
of class glm or lm, i.e. ones for which R has defined methods for the function "predict".
}
\value{
Returns nothing.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeGrowthObj}}, \code{\link{picSurv}}
}
\examples{
dff <- generateData()
gr1 <- makeGrowthObj(dff)
picGrow(dff, gr1)
}
