\name{wrapHossfeld}
\alias{wrapHossfeld}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fitting Hossfeld growth function.
}
\description{
Function to define deviance of a Hossfeld function for use with optim to
generate a Hossfeld growth object.
}
\usage{
wrapHossfeld(par, dataf)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{par}{
    vector of length three.
}
  \item{dataf}{
    dataframe with columns size and incr.
}
}
\references{
Zuidema, Jongejans, Chien, During & Schieving. Integral projection models for trees: a new parameterization method and a validation of model output. Journal of Ecology 98, p345-355.

}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{\link{Hossfeld}}
 }
\examples{

# Simulate data and create a column for growth increment
dff <- generateData()
dff$incr <- dff$sizeNext - dff$size

# Current sum of squares
wrapHossfeld(c(1, 1, 1), dff)

# Use optim to get best parameters values [not run]
tmp <- optim(c(1, 1, 1), wrapHossfeld, dataf = dff, method = "Nelder-Mead")
}
