\name{timeToSize}
\alias{timeToSize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Projects how long it takes to get from a starting distribution to a target continuous stage value.
}
\description{
Provided with a starting vector reflecting starting individual sizes, this function projects forward via the provided IPM until a defined proportion of the population has reach the chosen endSize. Only works for single environment or compound matrices (not time-varying covariates apart from a single discrete one). 
}
\usage{
timeToSize(startingSizes, IPM, endSize, startingEnv = 1, maxT = 100, propReach = 0.01)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{startingSizes}{
	vector of starting sizes reflecting sizes of individuals in the starting population (in any order).
}
  \item{IPM}{
the IPM Pmatrix.
}
  \item{endSize}{
the end size.
}
  \item{startingEnv}{
vector of starting env, same length as startingSizes, or length = 1 if compound matrices are not being used. 
}
  \item{maxT}{
the max number of time steps tested.
}
  \item{propReach}{
the proportion of the starting pop that have to be > than the endSize for it to count.
}
}
\details{
Plots and returned values of survivorship from preliminary runs will give a notion of how low this has to be.
}
\value{
 \item{ts.dist}{ the time-series of size distribution}
 \item{time.reach }{the time for n.reach to be at sizes > endSize }
 \item{survivorship}{survivorship over the course of the time elapsed for that pop}
}
\references{
Caswell, 2001. Matrix population models: analysis, construction and
interpretation. 2nd ed. Sinauer. 
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
#note that with the "fake data" essentially either takes 
#forever or is immediate...
dff <- generateData()
startSizes <- rnorm(1000, 2.5, 1)
Pmatrix <- makeIPMPmatrix(minSize = 1.2*min(dff$size, na.rm=TRUE),
maxSize = 1.2*max(dff$size, na.rm=TRUE), 
growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff))

rc <- timeToSize(startingSizes = startSizes, IPM = Pmatrix, endSize = 6, 
startingEnv = 1, maxT = 1000, propReach = 0.001)

names(rc)

par(mfrow=c(2,2), bty = "l")
## Make picture with lines for distribution of 
## population on different time points
matplot(Pmatrix@meshpoints, rc$ts.dist, type = "l", xlab = "size", 
ylab = "Number of individuals")

## Examine time elapsed for propReach to attain the chosen endSize
rc$time.reach

## Plot out the survivorship
plot(rc$survivorship, type = "l", #log = "y", 
xlab = "time step", ylab = "Probability original population survival", 
ylim = c(0,1), col = "gray")
}
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
