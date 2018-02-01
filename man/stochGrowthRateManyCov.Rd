\name{stochGrowthRateManyCov}
\alias{stochGrowthRateManyCov}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimates stochastic population growth rates (lambda_s) or invasion rate with many varying covariates. Alternatively, tracks population structure in a stochastic environment if trackStruct  is TRUE.
}
\description{
Iterates a population vector through a time series of covariates according to
growth, survival and fecundity objects, and calculates the stochastic population rate of increase if no density-dependence is specified, or the rate of invasion if density
dependence is specified. 
}
\usage{
stochGrowthRateManyCov(covariate, nRunIn, tMax,
growthObj, survObj, fecObj, nBigMatrix, minSize, maxSize, 
nMicrosites,integrateType = "midpoint", correction = "none",
trackStruct=FALSE, plot=FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{covariate}{
    matrix with tMax rows, and as many columns as there are relevant covariates.
}
  \item{nRunIn}{
    numeric, number of initial samples to discard.
}
  \item{tMax}{
    numeric, total number of time-steps to run (same as ncol(covariate)).
}
  \item{growthObj}{
    a growth object, defined to correspond to covariate definition (indexing used to make the growth object must match up).
}
  \item{survObj}{
    a survival object, defined to correspond to covariate definition in covariate.
}
  \item{fecObj}{
    a fecundity object, defined to correspond to covariate definition in covariate.
}
  \item{nBigMatrix}{
    numeric, number of size bins in the IPM.
}
  \item{minSize}{
    numeric, minimum size in the IPM.
}
  \item{maxSize}{
    numeric, maximum size in the IPM.
}
  \item{nMicrosites}{
    vector, if sum(nMicrosites)> 0 then density dependence is assumed to operate on seedling establishment, and if length(nMicrosites)>1, then the number of microsites available for establishment at time t is nMicrosites[min(t,length(nMicrosites))].  
}
  \item{integrateType}{
    integration type, defaults to "midpoint" (which uses probability density function); other option is "cumul" (which uses the cumulative density function).
  }
  \item{correction}{
    correction type, defaults to "none"; option is "constant" which will multiply every column of the IPM by a constant sufficient to adjust values to those predicted for survival at that continuous stage value.
  }
  \item{trackStruct}{
	Boolean indicating whether you want to track the population structure (beyond simply estimating the growth rate)
  }
  \item{plot}{
	Boolean indicating whether a plot of the population structure is desired. 
  }  
  \item{...}{
	extra arguments relating to plotting if trackStruct and plot are TRUE. 
  }
 }
\details{
Forms of density dependence beyond density dependence in seedling establishment not yet defined.
}
\value{
\item{Rt}{
If trackStruct is TRUE, numeric, converging on log lambda_s, or invasion rate (density dependence) for large enough tMax, and if covariate distribution is stationary. 
}
\item{rc}{
matrix of the numbers of individuals in each size and seed class (row) over time (columns).
}
\item{IPM.here}{IPM constructed corresponding to pop structure and covariates at tMax.}
}
\references{
Ellner & Rees. 2007. Stochastic stable population growth in integral projection models: theory and application. Journal of Mathematical Biology 54, p227-256.

Rees & Ellner. 2009. Integral projection models for populations in temporally varying environments. Ecological Monographs 79, p575-594.
%% ~put references to the literature/web site here ~
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{stochGrowthRateSampleList}},
}
\examples{

### NOT RUN - this is hashed out because compiles too slowly ###

# Generate relevant data, build objects
#dff <- generateData(type="stochastic")
#print(head(dff))
#gr1 <- makeGrowthObj(dff, Formula = sizeNext~size+size2+covariate1)
#sv1 <- makeSurvObj(dff, Formula = surv~size+size2+covariate2)
#fv1 <- makeFecObj(dff, Formula = fec~size+size2,Transform="log")

# Generate time series of covariates for which population growth rate 
#is required. Here set to be seasonal environment. 
#Names of covariates must be same as in dff
#tVals <- seq(1,100,by = 1/12)
#covTest <- (1 + 0.5*sin(2*pi*tVals))
#covMatTest <- data.frame(covariate1 = rnorm(length(covTest),covTest,0.5) - 1, 
#covariate2 = rnorm(length(covTest), covTest,0.5) - 1, 
#covariate3 = rnorm(length(covTest), covTest,0.5) - 1, row.names = NULL)

# Calculate

#r <- stochGrowthRateManyCov(covariate = covMatTest, nRunIn = 5*10, 
#tMax = length(tVals), growthObj = gr1, survObj = sv1, fecObj = fv1, 
#nBigMatrix = 100, 
#minSize = 1.1*min(dff$size, na.rm = TRUE), 
#maxSize = 1.1*max(dff$size, na.rm = TRUE), nMicrosites = 0)

#r

# Track population strucuture instead
#st <- stochGrowthRateManyCov(covariate = covMatTest, nRunIn = 5*10, 
#tMax = length(tVals), growthObj = gr1, survObj = sv1, fecObj = fv1, 
#nBigMatrix = 100, 
#minSize = 1.1*min(dff$size, na.rm = TRUE), 
#maxSize = 1.1*max(dff$size, na.rm = TRUE), nMicrosites = 0, 
#trackStruct=TRUE,plot=TRUE)


}
