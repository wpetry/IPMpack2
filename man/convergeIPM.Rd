\name{convergeIPM}
\alias{convergeIPM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Iterates until obtaining the number of bins required so that the difference in the chosen measure (lambda, R0, life expectancy of a chosenBin) falls below a chosen tolerance level
}
\description{
  Increases bin number by a specified \code{binIncrease} until the difference in the chosen measure falls below a tolerance level 
}
\usage{
convergeIPM(growObj, survObj, fecObj, nBigMatrix, minSize, maxSize, 
				discreteTrans = 1, integrateType = "midpoint", 
				correction = "none",  preCensus = TRUE, tol=1e-4,
				binIncrease=5, chosenBin=1, response="lambda")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{growObj}{
    a growth object.
  }
  \item{survObj}{
    a survival object.
  }
  \item{fecObj}{
    a fecundity object.
  }
  \item{nBigMatrix}{
    numeric, initial number of bins of size used in the matrix - will be increased for the assessment
  }
  \item{minSize}{
    numeric, minimum size used for meshpoints
  }
  \item{maxSize}{
    numeric, maximum size used for meshpoints of the P matrix.
  }
  \item{discreteTrans}{
	matrix of discrete transitions; or 1 if there is none
  }
  \item{integrateType}{
    integration type.
  }
  \item{correction}{
    correction (see makeIPMPmatrix)
  }
  \item{preCensus}{
    boolean defining whether fecundity is pre or post census; defaults to pre
  }
  \item{tol}{
   desired tolerance level 
  }
  \item{binIncrease}{
   increments in increase in the number of bins (should be an integer)
  }
  \item{chosenBin}{
	desired bin for which life expectancy should be assessed; default is 1st. 
  }
  \item{response}{
	what variable is convergence to be tested for; options are "lambda", "R0", "lifeExpect"; for the latter, the desired bin should be considered 
  }

  
}
\value{
  \item{binIncrease}{the number of bins used to increase matrix size in assessing tolerance}
  \item{Pmatrix}{the final Pmatrix if only LE is being considered}
  \item{IPM}{the final IPM}
  \item{R0}{the final R0}
  \item{lambda}{the final lambda}
  \item{LE}{the final vector of life expectancies}
}
\details{
Different choices for responses will yield different values. The pattern of change in lambda (or other response variables) can be complex, so it is advisable to start with large binIncrease and small tolerance, and then once one knows a general idea of how big the matrix needs to be, run the function again with a smaller binIncrease but start it closer to the goal. 

For the life expectancy option, if discrete stages are included via discreteTrans then if chosenBin=1, this function will use the first discrete bin. 
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}
\note{
This code was modified from original code by Melissa Eitzel. 
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{diagnosticsPmatrix}}
}
\examples{
dff<-generateData()
gr1<-makeGrowthObj(dff)
sv1<-makeSurvObj(dff)
fv1<-makeFecObj(dff,Transform="log")

res <- convergeIPM(growObj=gr1, 
 survObj=sv1, fecObj=fv1, 
 nBigMatrix=10, minSize=-2,
 maxSize=15,discreteTrans = 1, 
 integrateType = "midpoint", 
 correction = "none", 
 preCensus = TRUE, tol=1e-3,binIncrease=10)

res <- convergeIPM(growObj=gr1, 
survObj=sv1, fecObj=fv1, 
 nBigMatrix=10, minSize=-2,
 maxSize=15,discreteTrans = 1, 
 integrateType = "midpoint", 
 correction = "none", 
 preCensus = TRUE, tol=1e-3,
 binIncrease=10, response="R0")

res <- convergeIPM(growObj=gr1, survObj=sv1, fecObj=fv1, 
 nBigMatrix=10, minSize=-2,
 maxSize=15,discreteTrans = 1, 
 integrateType = "midpoint", 
 correction = "none", 
 preCensus = TRUE, tol=1e-3,binIncrease=10, 
 response="lifeExpect")



}
