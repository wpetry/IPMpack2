\name{makeCompoundPmatrix}
\alias{makeCompoundPmatrix}
\alias{createCompoundPmatrix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Builds a compound P matrix.
}
\description{
  Uses growth, survival, discreteTrans, and environmental transition objects to construct a matrix defining probabilities for transitions between continuous stages (e.g. size) due to growth and survival given both size and environmental state and discrete stages. 
NOTE - old createCompoundPmatrix is being deprecated; use makeCompoundPmatrix instead.  
}
\usage{
makeCompoundPmatrix(nEnvClass = 2, nBigMatrix = 50,
minSize = -1, maxSize = 50, envMatrix, growObj, survObj,
discreteTrans = 1, integrateType = "midpoint",correction = "none")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nEnvClass}{
    numeric, number of environmental classes, defaults to 2.
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
  \item{envMatrix}{
    envMatrix object defining transitions between environmental states
    for each size.
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
This structure can also be used to define size x age IPMs, where the transition 
between ages is reflected by a similar matrix.
}
\value{
  an object of class IPMmatrix with dimensions
  nBigMatrix * nEnvClass, or if discrete transitions exist
  (nBigMatrix + nDisc) * nEnvClass
}
\references{
For information on P matrix: Caswell. 2001. Matrix population models: construction, analysis, and interpretation. 2nd ed. Sinauer. p110-112.

For habitat x stage modeling:
  Tuljapurkar, Horvitz & Pascarella. 2003. The many growth rates and elasticities of populations in random environments. American Naturalist 162: p489-502.
  
  Pascarella & Horvitz. 1998. Hurricane disturbance and the population dynamics of a tropical understory shrub: megamatrix elasticity analysis. Ecology 79: p547-563.
  
  Horvitz & Schemske. 1986. Seed dispersal and environmental heterogeneity in a neotropical herb: A model of population and patch dynamics. In Symposium on frugivores and seed dispersal . (Estrada & Fleming, eds.) Dr. W. Junk Publishers, Dordrecht, Netherlands.  pp. 169-186.

For age x size modeling: Garcia, Dahlgren and Ehrlen. 2011. No evidence of senescence in a 300-year-old mountain herb. Journal of Ecology 99, p1424-1430.

For general information:

Easterling, Ellner and Dixon. 2000. Size-specific sensitivity: a new structured population model. Ecology 81, p694-708.

Ellner and Rees. 2006. Integral projection models for species with complex demography. The American Naturalist 167, p410-428.
%% ~put references to the literature/web site here ~
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeCompoundFmatrix}},\code{\link{makeIPMPmatrix}}
}
\examples{
# Data with only continuous stage and two habitats
dff <- generateData()
Pmatrix <- makeCompoundPmatrix(minSize = min(dff$size,na.rm = TRUE), 
	maxSize = max(dff$size,na.rm = TRUE), envMatrix = makeEnvObj(dff), 
		growObj = makeGrowthObj(dff, Formula = sizeNext~size+size2+covariate), 
			survObj = makeSurvObj(dff, Formula = surv~size+size2+covariate))

image(1:nrow(Pmatrix), 1:ncol(Pmatrix), t(log(Pmatrix)), 
	xlab = "Continuous stage (e.g. size) at t", 
		ylab = "Continuous stage (e.g. size) at t+1", axes = FALSE)
axis(1, at = 1:nrow(Pmatrix), lab = round(rep(Pmatrix@meshpoints,
    Pmatrix@nEnvClass), 2))
axis(2, at = 1:nrow(Pmatrix), lab = round(rep(Pmatrix@meshpoints,
    Pmatrix@nEnvClass), 2))
abline(h = length(Pmatrix@meshpoints) * (1:Pmatrix@nEnvClass))
abline(v = length(Pmatrix@meshpoints) * (1:Pmatrix@nEnvClass))

# Data with continuous and discrete stages
dff <- generateData(type="discrete")
dff$covariate <- sample(1:3, size = nrow(dff), replace = TRUE)
dff$covariateNext <- sample(1:3, size = nrow(dff), replace = TRUE)
discM <- makeDiscreteTrans(dff)
Pmatrix <- makeCompoundPmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE), envMatrix = makeEnvObj(dff), 
		growObj = makeGrowthObj(dff, Formula = sizeNext~size+size2+covariate), 
			survObj = makeSurvObj(dff, Formula = surv~size+size2+covariate), 
				discreteTrans = discM)
}
