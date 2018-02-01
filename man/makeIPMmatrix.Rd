\name{makeIPMmatrix}
\alias{makeIPMmatrix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Builds IPM matrices.
}
\description{
  Uses survival/growth, fecundity and optionally clonal kernels to make an IPM kernel. 
}
\usage{
makeIPMmatrix(Pmatrix,Fmatrix,Cmatrix=NULL)
}

\arguments{

  \item{Pmatrix}{
    A survival/growth kernel constructed with makeIPMPmatrix().
  }
  \item{Fmatrix}{
    A fecundity kernel constructed with makeIPMFmatrix().
  }
  \item{Cmatrix}{
    A clonal kernel, constructed with makeIPMCmatrix(). Defaults to NULL since clonal reproduction may not be applicable for many species.
  }

}
\details{
A convenience function that makes an IPM kernel from the component kernels with all the same slots. All kernels being combined must have the same dimension, i.e. dim(Pmatrix@.Data) is the same as dim(Fmatrix@.Data).
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
Cory Merow, C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeIPMPmatrix}},\code{\link{makeIPMFmatrix}},\code{\link{makeIPMCmatrix}}, \code{\link{diagnosticsPmatrix}}, \code{\link{makeDiscreteTrans}}  
}
\examples{
dff <- generateData()
Pmatrix <- makeIPMPmatrix(
						growObj = makeGrowthObj(dff), 
						survObj = makeSurvObj(dff),
						nBigMatrix=20,
						minSize = min(dff$size, na.rm = TRUE), 
						maxSize=max(dff$size, na.rm=TRUE))	
dff$fec[dff$fec==0] <- NA
fv1 <- makeFecObj(dff, Formula = fec~size, Transform = "log")
Fmatrix <- makeIPMFmatrix(
						fecObj = fv1, 
						nBigMatrix = 20, 
						minSize = min(dff$size, na.rm = TRUE), 
						maxSize = max(dff$size, na.rm = TRUE))
IPMmatrix <- makeIPMmatrix(Pmatrix,Fmatrix)
slotNames(IPMmatrix)

require(fields)
par(mfrow=c(2,2))
image.plot(IPMmatrix@meshpoints, IPMmatrix@meshpoints, t(Pmatrix), 
	xlab = "Size(t)", 
	ylab = "Size(t+1)",
	main = "Survival/Growth Kernel")
image.plot(IPMmatrix@meshpoints, IPMmatrix@meshpoints, t(Fmatrix), 
	xlab = "Size (t)", 
	ylab = "Size(t+1)",
	main = "Fecundity Kernel")
image.plot(IPMmatrix@meshpoints, IPMmatrix@meshpoints, t(IPMmatrix), 
	xlab = "Size(t)", 
	ylab = "Size(t+1)",
	main = "IPM Kernel")
# trick to visualize the whole IPM kernel when the Fmatrix has values>>Pmatrix
image.plot(IPMmatrix@meshpoints, IPMmatrix@meshpoints, t(IPMmatrix)^.1, 
	xlab = "Size(t)", 
	ylab = "Size(t+1)",
	main = "IPM Kernel^(.01)")

}
