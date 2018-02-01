\name{stochGrowthRateSampleList}
\alias{stochGrowthRateSampleList}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Estimating the stochastic population growth rate (lambda_s) or invasion rat.
}
\description{
 Estimates the stochastic growth rate (lambda_s) by iteration; operates by sampling a list of IPMs. Note that the function stoch.growth.rate in the package popbio does this more efficiently and with more useful output; but may fail for large bin numbers. 
 If densDept is TRUE, estimates the stochastic invasion rate in the presence of density dependence in seedling establishment by iteration; operates by sampling a list of IPMs and recalculating the probability of seed establishment at each time-step. 
 }

\usage{
stochGrowthRateSampleList(nRunIn,tMax,listIPMmatrix=NULL,
					listPmatrix=NULL, listFmatrix=NULL,seedList=NULL,
					densDep=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{nRunIn}{
    numeric, the size of the burnin,
}
\item{tMax}{
    numeric, the total samples desired.
}
\item{listIPMmatrix}{
 	a list of IPMmatrix objects corresponding to possible states of the environment.
	}
\item{listPmatrix}{
 a list of IPM P matrices corresponding to possible states of the environment.
}
\item{listFmatrix}{
 a list of IPM F matrices  corresponding to possible states of the environment.
}
\item{seedList}{
    numeric, a vector of the number of successful recruit corresponding to possible states of the environment. 
}
\item{densDep}{
Boolean indicating whether density dependence in seedling establishment should be implemented
}
}
\value{
a numeric converging on high enough log lambda_s for sufficient tMax; note that if the population size declines to zero, this may return NAs because of logging.
}
\references{
Caswell, 2001. Matrix population models: analysis, construction and
interpretation. 2nd ed. Sinauer. p452-502.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{sampleSequentialIPMs}}
}
\examples{
dff <- generateData()
IPMlist <- sampleSequentialIPMs(dataf = dff, nBigMatrix = 10, minSize = -5, 
maxSize = 15,fecConstants=data.frame(1e6), correction="constant")
stochGrowthRateSampleList(listIPMmatrix = IPMlist,nRunIn = 100, tMax = 5000) 
}
