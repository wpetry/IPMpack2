\name{growth}
\alias{growth}


\title{
Estimates growth probabilities. 
}
\description{
Generic function to predict the pdf (probability density function) of continuous (e.g. size) stage at t+1 given stage at t and a growth object.
}
\usage{
growth(size, sizeNext, cov, growthObj)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{size}{
    vector of current sizes.
}
  \item{sizeNext}{
    vector of sizes in the next time-step.
}
  \item{cov}{
    a data-frame with one row containing all covariates for this time-step.
}
  \item{growthObj}{
    a growth object.
}
}
\details{
  Models defining continuous (size) stage at t+1, or growth increment, or log growth increment are defined; with various
  underlying statistical models allowing decreasing variance in size, etc.
}
\value{
  a vector of length sizeNext giving the pdf (probability density function) of each value of sizeNext.
}
\references{
Easterling, Ellner & Dixon. 2000. Size-specific sensitivity: a new structured population model. Ecology 81, p694-708.

}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{surv}}, \code{\link{growSurv}}
}
\examples{
dff <- generateData()
gr1 <- makeGrowthObj(dff)
sizeRange <- c(1:20)
sizeInit <- 1
growth(sizeInit, sizeRange, data.frame(cov=1), gr1)
plot(growth(sizeInit, sizeRange, data.frame(cov=1), gr1), type="l", 
	col = "dark gray", xlab = "Continuous (e.g. size) stage at time t+1", 
	ylab = paste("Probability of growth to a specific size in t+1 from size ", 
			sizeInit, " at time t"))
}
