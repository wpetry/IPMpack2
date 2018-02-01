\name{makeIPMPmatrix}
\alias{makeIPMPmatrix}
\alias{createIPMPmatrix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Builds P matrices.
}
\description{
  Uses growth and survival objects to construct a matrix defining probabilities for transitions between sizes due to growth and survival. Extensions for transition to discrete classes are possible.
	NOTE - old createIPMPmatrix is being deprecated; use makeIPMPmatrix instead.  
}
\usage{
makeIPMPmatrix(nEnvClass = 1, nBigMatrix = 50,
minSize = -1, maxSize = 50, chosenCov = data.frame(covariate=1), 
growObj, survObj, discreteTrans=1, 
integrateType = "midpoint", correction="none")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nEnvClass}{
    numeric, number of environmental classes, always = 1 for
    non-compound matrices.
  }
  \item{nBigMatrix}{
    numeric, number of size bins in the P matrix, defaults to 50.
  }
  \item{minSize}{
    numeric, minimum size of the P matrix, defaults to -1.
  }
  \item{maxSize}{
    numeric, maximum size of the P matrix, defaults to 50.
  }
  \item{chosenCov}{
    data-frame indicating level of the discrete covariate, or 
    range of values where multiple covariates are modeled.
  }
  \item{growObj}{
    growth object.
  }
  \item{survObj}{
    survival object.
  }
  \item{discreteTrans}{
    object of class discreteTrans, or numeric.
  }
  \item{integrateType}{
    integration type, defaults to "midpoint" (which uses probability density
    function); other option is "cumul" (which uses the cumulative density function).
  }
  \item{correction}{
correction type, defaults to \code{none}. The first option is \code{constant} which will multiply every column of the IPM by a constant sufficient to adjust values to those predicted for survival at that size. The second option is \code{discretizeExtremes} which will place all transitions to sizes smaller than \code{minSize} into the smallest bin, and transitions to sizes larger than \code{maxSize} into the largest bin. 
  }
}
\details{
  The number of bins (nBigMatrix) is combined with the minimum and
  maximum size to define the meshpoints of the IPM. Bins should be
  sufficient and the size range should encompass the size range of the
  data. If a "discreteTrans" exists, then discrete stages will be added
  to the IPM structure. If multiple discrete covariate levels are available,
  chosenCov identifies the covariate value for which an IPM is
  required; if a series of covariates are being modeled, chosenCov is a
  vector of these covariates, and growth will reflect these values.  
}
\value{
  an object of class IPMmatrix with dimensions nBigMatrix*nBigMatrix, or
  nbig.matrix+nrow(discreteTrans).
}
\references{
Easterling, Ellner & Dixon. 2000. Size-specific sensitivity: a new structured population model. Ecology 81, p694-708.

Ellner & Rees. 2006. Integral projection models for species with complex demography. The American Naturalist 167, p410-428.

For information on P matrix: Caswell. 2001. Matrix population models: construction, analysis, and interpretation. 2nd ed. Sinauer. p110-112.

For information on unintentional eviction from IPMs (which the various corrections try and account for) see Williams et al. 2012 Avoiding unintentional eviction from integral projection models. Ecology.
%% ~put references to the literature/web site here ~
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeIPMFmatrix}},\code{\link{makeIPMmatrix}}, \code{\link{diagnosticsPmatrix}}, \code{\link{makeDiscreteTrans}}  
}
\examples{
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize=max(dff$size, na.rm=TRUE), growObj = makeGrowthObj(dff), 
		survObj = makeSurvObj(dff))

image(Pmatrix@meshpoints, Pmatrix@meshpoints, t(Pmatrix), 
	xlab = "Continuous (e.g. size) stage at t", 
		ylab = "Continuous (e.g. size) stage at t+1")

Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize=max(dff$size, na.rm=TRUE), 
	   growObj = makeGrowthObj(dff,regType="changingVar"), 
		survObj = makeSurvObj(dff))

image(Pmatrix@meshpoints, Pmatrix@meshpoints, t(Pmatrix), 
	xlab = "Continuous (e.g. size) stage at t", 
		ylab = "Continuous (e.g. size) stage at t+1")

#example with discrete transition matrix
dff <- generateData(type="discrete")
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize=max(dff$size, na.rm=TRUE), discreteTrans=makeDiscreteTrans(dff),
	growObj = makeGrowthObj(dff), 
		survObj = makeSurvObj(dff))

#discrete stages not plotted 
image(Pmatrix@meshpoints, Pmatrix@meshpoints, 
	t(log(Pmatrix[2:length(Pmatrix@meshpoints),2:length(Pmatrix@meshpoints)])), 
	xlab = "Continuous (e.g. size) stage at t", 
		ylab = "Continuous (e.g. size) stage at t+1")


}
