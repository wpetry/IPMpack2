\name{growthCum}
\alias{growthCum}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Models growth allowing for cumulative bin estimation.
}
\description{
Generic function to predict the cdf (cummulative density function) of continuous (e.g. size) stage at t+1 given stage at t and a growth object.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
growthCum(size, sizeNext, cov, growthObj)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
   \item{size}{
    vector of current sizes.
}
  \item{sizeNext}{
    vector of sizes in the next time step.
}
  \item{cov}{
    covariate level in this time step (numeric of length 1).
}
  \item{growthObj}{
    a growth object.
}
}
\value{
 a vector of length sizeNext giving the cdf (cummulative density function) of each value of sizeNext.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
growth
}
\examples{
dff <- generateData()
gr1 <- makeGrowthObj(dff)
sizeRange <- c(1:20)
sizeInit <- 1
growthCum(sizeInit, sizeRange, data.frame(cov=1), gr1)
plot(growthCum(sizeInit, sizeRange, data.frame(cov=1), gr1), type="l", 
	col = "dark gray", xlab = "Continuous (e.g. size) stage at time t+1", 
		ylab = paste("Cummulative growth to a specific size in t+1 from size ", 
			sizeInit, " at time t"))
}
