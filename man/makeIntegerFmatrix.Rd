\name{makeIntegerFmatrix}
\alias{makeIntegerFmatrix}
\alias{makeIntegerPmatrix}
\alias{createIntegerFmatrix}
\alias{createIntegerPmatrix}
%- Also NEED an '\alias' for EACH other topic documented here. 
\title{
Builds P and F matrices built off regressions fitted to discrete variables (with probability mass functions rather than probability density functions).
}
\description{
Uses survival, growth and fecundity objects to construct a matrix defining per-capita contribution to recruitment stages (e.g., propagules [seed, spore], seedlings, calves) by reproductive stages due to sexual reproduction (for the F matrix); and transition probabilities determined from survival and growth to quasi-continuous stages based on integer data (e.g. number of leaves) as opposed to truly continuous data (e.g. mass). 
NOTE - old createIntegerPmatrix is being deprecated; use makeIntegerPmatrix instead; etc
}
\usage{
makeIntegerFmatrix(fecObj, nEnvClass = 1, meshpoints = 1:20, 
	chosenCov = data.frame(covariate=1), 
	preCensus = TRUE, survObj = NULL, growObj = NULL, offspringObj=NULL)

makeIntegerPmatrix(nEnvClass = 1, 
		meshpoints = 1:20,
		chosenCov = data.frame(covariate = 1), 
		growObj, survObj, 
		discreteTrans = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fecObj}{
    fecundity object.
  }
  \item{nEnvClass}{
    numeric, number of environmental classes, always = 1 for
    non-compound matrices.
  }
  \item{meshpoints}{
    numeric, identifying meshpoints
  }
  \item{chosenCov}{
    data-frame indicating level of the discrete covariate, or 
    range of values where multiple covariates are modeled.
  }
  \item{preCensus}{
    logical (TRUE or FALSE), indicating whether the fecundity object should
    represent an interval between pre-breeding or a post-breeding censuses.
    defaults to TRUE (pre-breeding census), meaning that all reproduction 
    and offspring rates required for the F matrix are embedded in fecObj. 
    Alternatively, an F matrix based on post-breeding census (preCensus=FALSE)
    requires additional survObj and growObj, to cover the survival and growth
    of the parents until the reproductive event. 
  }
  \item{survObj}{
    survival object, describing the survival of parents from a census until 
    the reproductive event starts (at some point during the inter-census time step).
    If preCensus = FALSE but no survival object is provided, it is assumed
    that all individuals survive to the breeding event.  
  }
  \item{growObj}{
    growth object, describing the growth of parents that survive until the 
    reproductive event starts. Warning: this growth object is still ignored in 
    makeIPMFmatrix in the current version of IPMpack. It will become functional 
    in coming versions. So far it is assumed that at time of breeding the individuals 
    have the same size as at the beginning of the time interval.
  }
   \item{discreteTrans}{
    object of class discreteTrans, or numeric.
  }
  \item{offspringObj}{
    growth object, describing the size of offspring (this process may alternatively appear in fecObj).  
  }
 
}
\value{
  an object of class IPMmatrix with dimensions length(meshpoints)*length(meshpoints), or
  length(meshpoints)+nrow(discreteTrans).
}
\details{
 do check whether the Pmatrix adequately reflects survival by using diagnosticsPmatrix(). 
}
\references{
For information on F and P matrix: Caswell. 2001. Matrix population models: construction, analysis, and interpretation. 2nd ed. Sinauer. p110-112.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}
\note{
With thanks to Dr Alden Griffith.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeDiscreteTransInteger}}, \code{\link{makeFecObjInteger}}
}
\examples{

# Open dataset for the herbaceous perennial Cryptantha flava 
# where the state variable is integer (number of rosettes)
data(dataIPMpackCryptantha)
head(dataIPMpackCryptantha)
d <- dataIPMpackCryptantha

#See the description of the data for information on the variables
help(dataIPMpackCryptantha)

# For this example, focus only on the first annual transition available 
# in the dataset
d1 <- d[d$year==2004, ]

#Make survival, growth and fecundity objects assuming a poisson distribution
so <- makeSurvObj(d1)
go1 <- makeGrowthObj(d1, Formula = sizeNext~size, Family = "poisson")
fo <- makeFecObjInteger(d1, Formula = fec1~size, distOffspring = "poisson")

#Create P and F matrices
Pmatrix1 <- makeIntegerPmatrix(growObj = go1, survObj = so, meshpoints = 1:101, 
    discreteTrans = 1)
Fmatrix <- makeIntegerFmatrix(fecObj = fo, meshpoints = 1:101)

par(mfrow = c(1, 3), bty = "l")

plot(d1$size, d1$sizeNext, xlab = "Stage at t", ylab = "Stage at t+1")

image(Pmatrix1@meshpoints, Pmatrix1@meshpoints, t(Pmatrix1), 
	xlab = "Stage at t", 
		ylab = "Stage at t+1")
image(Fmatrix@meshpoints, Fmatrix@meshpoints, t(Fmatrix), 
	xlab = "Stage at t", 
		ylab = "Stage at t+1")		

#Same approach, but with negative binomial instead of 
# poisson for stage transitions
go2 <- makeGrowthObj(d1, Formula = sizeNext~size, Family = "negbin")

#Recalculate the P matrix
Pmatrix2 <- makeIntegerPmatrix(growObj = go1, survObj = so, 
    meshpoints = 1:101, discreteTrans = 1)

par(mfrow = c(1, 3), bty = "l")
plot(d1$size, d1$sizeNext, xlab = "Stage at t", ylab = "Stage at t+1")
points(1:100, predict(go2@fit[[1]], newdata = data.frame(size = 1:100),
		type = "response"), type = "l", col = 2)

image(Pmatrix2@meshpoints, Pmatrix2@meshpoints, t(Pmatrix2), 
	xlab = "Stage at t", 
		ylab = "Stage at t+1")
image(Fmatrix@meshpoints, Fmatrix@meshpoints, t(Fmatrix), 
	xlab = "Stage at t", 
		ylab = "Stage at t+1")		

#The following repeats the same approach, but with negative binomial 
# instead of poisson for stage transitions
dff <- generateData()
go2 <- makeGrowthObj(d1, Family = "negbin")
Pmatrix2 <- makeIntegerPmatrix(growObj = go2, survObj = so, 
    meshpoints = 1:101, discreteTrans = 1)

}
