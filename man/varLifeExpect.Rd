\name{varLifeExpect}
\alias{varLifeExpect}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculates variation in life expectancy in a discretely stochastic environment.
}
\description{
  Provided a P matrix, defining survival transitions across size, this function provides a vector with variance in life expectancy in units of the time-step used, for each of the size bins.
}
\usage{
varLifeExpect(IPMmatrix)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{IPMmatrix}{
    an IPMmatrix object defining survival transitions.
}
}
\value{
  a vector of variance in life expectancies each corresponding to Pmatrix@meshpoints.

}
\references{
Caswell, 2001. Matrix population models: analysis, construction and
interpretation. 2nd ed. Sinauer. p110-132.

Cochran & Ellner. 1995. Simple methods for calculating age-based life history parameters for stage-structured populations. Ecological Monographs 62, p345-364.

Tuljapurkar & Horvitz, 2006. From stage to age in variable environments. Life expectancy and survivorship. Ecology 87, p1497-1509.

}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{meanLifeExpect}}, \code{\link{makeIPMPmatrix}} 

}
\examples{
# With a single continuous (e.g. size) stage
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff))
vle <- varLifeExpect(Pmatrix)

plot(Pmatrix@meshpoints, vle, ylab = "Variation life expectancy", 
xlab = "Continuous (e.g. size) stage", type = "l", ylim = c(0,max(vle)))


}
