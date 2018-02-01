\name{makeIPMFmatrix}
\alias{makeIPMFmatrix}
\alias{createIPMFmatrix}
%- Also NEED an '\alias' for EACH other topic documented here. 
\title{
Builds F matrices.
}
\description{
Uses fecundity objects to construct a matrix defining per-capita contribution to recruitment stages (e.g., propagules [seed, spore], seedlings, calves) by reproductive stages due to sexual reproduction. 
NOTE - old createIPMFmatrix is being deprecated; use makeIPMFmatrix instead.  

}
\usage{
makeIPMFmatrix(fecObj, nEnvClass = 1, nBigMatrix = 50, minSize = -1, 
	maxSize = 50, chosenCov = data.frame(covariate=1), 
	integrateType="midpoint", correction="none", 
	preCensus = TRUE, survObj = NULL, growObj = NULL, offspringObj=NULL)
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
  \item{nBigMatrix}{
    numeric, number of size bins in the F matrix, defaults to 50.
  }
  \item{minSize}{
    numeric, minimum size of the F matrix, defaults to -1.
  }
  \item{maxSize}{
    numeric, maximum size of the F matrix, defaults to 50.
  }
  \item{chosenCov}{
    data-frame indicating level of the discrete covariate, or 
    range of values where multiple covariates are modeled.
  }
  \item{integrateType}{
    integration type, defaults to "midpoint" (which uses probability density
    function); other option is "cumul" (which uses the cumulative density function)
  }
  \item{correction}{
 correction type, defaults to \code{none}. The first option is \code{constant} which will multiply every column of the IPM by a constant sufficient to adjust values to those predicted for total fertility at that size. The second option is \code{discretizeExtremes} which will place all transitions to sizes smaller than \code{minSize} into the smallest bin, and transitions to sizes larger than \code{maxSize} into the largest bin.  
 }
  \item{preCensus}{
    logical (TRUE or FALSE), indicating whether the fecundity object should
    represent an interval between pre-breeding or a post-breeding censusses.
    defaults to TRUE (pre-breeding census), meaning that all reproduction 
    and offspring rates required for the F matrix are embedded in fecObj. 
    Alternatively, an F matrix based on post-breeding census (preCensus=FALSE)
    requires additional survObj and growObj, to cover the survival and growth
    of the parents until the reproduction event. 
  }
  \item{survObj}{
    survival object, describing the survival of parents from a census until 
    the reproduction event starts (at some point during the inter-census time 
    step). If preCensus = FALSE but no survival object is provided, it is assumed
    that all individuals survive to the breeding event.  
  }
  \item{growObj}{
    growth object, describing the growth of parents that survive until the 
    reproduction event starts. Warning: this growth object is still ignored in 
    makeIPMFmatrix in the current version of IPMpack. It will become functional 
    in coming versions. So far it is assumed that at time of breeding the individuals 
    have the same size as at the beginning of the time interval.  
  }
 \item{offspringObj}{
    growth object, describing the size of offspring (this process may alternatively appear in fecObj).  
  }
 
}
\value{
  an object of class IPMmatrix of dimensions nBigMatrix or nBigMatrix+nDiscrete classes (defined by fecObj@offspringSplitter-1).
}
\references{
For information on F matrix: Caswell. 2001. Matrix population models: construction, analysis, and interpretation. 2nd ed. Sinauer. p110-112.

For midpoint: Zuidema, Jongejans, Chien, During & Schieving. Integral projection models for trees: a new parameterization method and a validation of model output. Journal of Ecology 98, p345-355.

For multiple-vital rate integration on fecundity: Yang, Jongejans, Yang & Bishop. 2011. The effect of consumers and mutualists of Vaccinum membranaceum at Mount St. Helens: dependence on successional context. PLoS One 10, p1-11.

For information on unintentional eviction from IPMs (which the various corrections try and account for) see Williams et al. 2012 Avoiding unintentional eviction from integral projection models. Ecology.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeIPMPmatrix}},\code{\link{makeIPMCmatrix}},\code{\link{makeIPMmatrix}}
}
\examples{
# Data with only continuous stage and one habitat
dff <- generateData()
dff$fec[dff$fec==0] <- NA
fv1 <- makeFecObj(dff, Formula = fec~size, Transform = "log")
Fmatrix <- makeIPMFmatrix(fecObj = fv1, nBigMatrix = 20, 
	minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE), correction="constant")

slotNames(Fmatrix)

image(Fmatrix@meshpoints, Fmatrix@meshpoints, t(Fmatrix), 
	xlab = "Continuous (e.g. size) stage at t", 
		ylab = "Continous (e.g. size) stage at t+1")
}
