\name{growSurv}
\alias{growSurv}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Combines growth and survival.
}
\description{
Predicts the probability density function of continuous (e.g. size) stage at time t+1 given stage values at time t and survival probability as a function of stage values at time t, given a growth and survival object.
}
\usage{
growSurv(size, sizeNext, cov, growthObj, survObj)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{size}{
    vector of current size(s).
}
  \item{sizeNext}{
    vector of future size(s).
}
  \item{cov}{
    covariate level (numeric of length 1).
}
  \item{growthObj}{
    a growth object.
}
\item{survObj}{
  a survival object.
}
}
\details{
\code{makeIPMPmatrix} and variants there-of apply \code{outer} to this function to efficiently obtain the IPM P matrix. 
}
\value{
numeric defining the pdf (probability density function).
}
\references{
Easterling, Ellner & Dixon. 2000. Size-specific sensitivity: a new structured population model. Ecology 81, p694-708.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}
\note{
Code developed following Mark Rees, Dylan Childs & Karen Rose.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{\link{growth}},  \code{\link{surv}}
}
\examples{
dff <- generateData()
gr1 <- makeGrowthObj(dff)
sv1 <- makeSurvObj(dff)
sizeRange <- c(1:20)
sizeInit <- 1
growSurv(sizeInit, sizeRange, data.frame(covariate=1), gr1, sv1)
plot(growSurv(sizeInit, sizeRange, data.frame(covariate=1), gr1, sv1), 
    type="l", col = "dark gray", 
	xlab = "Continuous (e.g. size) stage at time t+1", 
	ylab = paste("Probability of survival to a specific size in t+1 from size ", 
			sizeInit, " at time t"))
}
