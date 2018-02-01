\name{sampleIPMOutput}
\alias{sampleIPMOutput}
\alias{.getIPMoutput}
\alias{.getIPMoutputDirect}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Gets IPM output from a list of P matrices (only survival and size information) or full IPMs (P matrices + F matrices; the latter include sexual reproduction information).
}
\description{
Gets synthetic values including life expectancy, passage time, and, if a fecundity matrix is available, population growth rate (lambda), stable stage distribution, reproductive output, etc. It is helpful when building multiple IPMs for study of parameter uncertainty or stochastic dynamics.
}
\usage{
sampleIPMOutput(IPMList=NULL,PMatrixList=NULL,passageTimeTargetSize=c(), 
sizeToAgeStartSize=c(),sizeToAgeTargetSize=c(),warn=TRUE)
%.getIPMoutput(PmatrixList, targetSize = c(), FmatrixList = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{IPMList}{
    List of survival-size IPM matrices for which summary statistics desired. When this information is included, population growth rate (lambda), and stable stage distribution will  be provided.
	}
  \item{PMatrixList}{
    List of survival-growth (P) matrices for which summary statistics desired. When this information is included, only passage time and sizeToAge calculations will be provided 
	}
  \item{passageTimeTargetSize}{
    Target size for passage time. If none is provided defaults to the median of the IPM meshpoints.
	}
  \item{sizeToAgeStartSize}{
    Starting size to determine the expected age which sizeToAgeTargetSize will be reached. If none is provided defaults to the minimum of the IPM meshpoints.
	}
	 \item{sizeToAgeTargetSize}{
    Target size to determine the expected age which sizeToAgeTargetSize will be reached. If none is provided defaults to the IPM meshpoints.
	}
	\item{warn}{
		turn warning messages on/off.
  }
}
\value{
  \item{LE}{matrix of life expectancies, columns correspond to
  meshpoints, rows corresponding to each element of the list of P matrices}
  \item{pTime}{matrix of passage times to the targetSize from each of
    the meshpoints (columns) and for each element in the P matrix list
    (columns).}
  \item{lambda}{vector of population growth rates corresponding to value obtained
    combining each element of the list of P matrices with the
    corresponding element in the list of F matrices; if no F matrix list
    is provided, it returns a vector of NAs.}
  \item{stableStage}{matrix of stable stage distributions rows corresponding to values obtained.
    combining each element of the list of Pmatrices with the
    corresponding element in the list of Fmatrices; if no Fmatrix list
    is provided, this is a matrix of NAs.}
  \item{meshpoints}{matrix meshpoints.}
  \item{resSize}{matrix providing target sizes for size to age estimate (assuming age=1
    at sizeStart), of length nsizeToAge space equally between the smallest and largest meshpoints.}
  \item{resAge}{matrix providing time in time-steps to get to resSize,
    rows corresponding sequential elements in the list of P matrices.} 
}
\note{
	This function has replaced the functionality of getIPMoutput and getIPMoutputDirect. Those functions are no longer supported but have been hidden (.getIPMoutput and .getIPMoutputDirect) and can be accessed for backward compatibility.
}

\references{
	Zuidema, Jongejans, Chien, During & Schieving. Integral projection models for trees: a new parameterization method and a validation of model output. Journal of Ecology 98, p345-355.
}
\author{
	Cory Merow, C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
	\code{\link{sampleIPM}}, \code{\link{sampleVitalRateObj}}, \code{\link{sampleSequentialIPMs}}
}

\examples{
# ===========================================================================
# Sample Vital Rate Objects
	# Parametric bootstrap sample for a growth object 
		dff <- generateData(type='discrete')
		gr1 <- makeGrowthObj(dff)
		gr1List=sampleVitalRateObj(gr1,nSamp=9)

	# Parametric bootstrap sample for a survival object 
		sv1 <- makeSurvObj(dff)
		sv1List=sampleVitalRateObj(sv1,nSamp=9)

	# Parametric bootstrap sample for a fecundity object 
		fv1 <- makeFecObj(dff)
		fv1List=sampleVitalRateObj(
			fv1,nSamp=9,
			nDiscreteOffspringTransitions =100,
			nOffspring=100)

	# Parametric bootstrap sample for a discrete transition object 
		dt1 <- makeDiscreteTrans(dff)
		dt1List=sampleVitalRateObj(
			dt1,nSamp=9,
			nDiscreteGrowthTransitions=100)
# ===========================================================================
	# Make a list of growth/survival (P) matrices (omitting fecundity)
		Pmatrixlist=sampleIPM(
			growObjList=gr1List,
			survObjList=sv1List,
			fecObjList =NULL,
			nBigMatrix = 20, minSize = -5, maxSize = 20)
		# plot results
		par(mfrow=c(3,3))
		lapply(Pmatrixlist,image)

	# Combine the list of fecundity objects with a single survival 
	# and growth object in a list of IPMs to look at just the impact 
	# of uncertainty in fecundity parameter estimates on population growth rate
		IPMlist2=sampleIPM(
			growObjList=list(gr1),
			survObjList=list(sv1),
			fecObjList =fv1List,
			discreteTransList=list(dt1), 
			nBigMatrix = 20, minSize = -5, maxSize = 20)
		# plot results
		lapply(IPMlist2,image) 

	# Combine the lists of all vital rate objects in a list of IPMs 
	# to look at the impact of uncertainty in all parameters on population 
	# growth rate
		IPMlist3=sampleIPM(
			growObjList=gr1List,
			survObjList=sv1List,
			fecObjList =fv1List,
			discreteTransList=list(dt1),
			nBigMatrix = 20, minSize = -5, maxSize = 20)
		# plot results
		lapply(IPMlist3,image) 

# ===========================================================================
# Summarize the outputs	
	# Get uncertainty in passage time from the list of growth/survival matrices
		IPMout1=sampleIPMOutput(PMatrixList=Pmatrixlist)
		qLE=apply(IPMout1[['LE']],2,quantile,probs=c(.025,.5,.975))
		plot(IPMout1$meshpoints,qLE[2,],type='l',ylim=c(0,max(qLE)))
		lines(IPMout1$meshpoints,qLE[1,],type='l',lty=3)
		lines(IPMout1$meshpoints,qLE[3,],type='l',lty=3)

	# Get uncertainty in lambda from the list of IPMs where only 
	# fecundity varied
		IPMout2=sampleIPMOutput(IPMList=IPMlist2)
		qlambda=quantile(IPMout2[['lambda']],probs=c(.025,.5,.975))
		boxplot(IPMout2[['lambda']])
	
	# Get uncertainty in lambda and passage time from size 5 to a 
	# series of size from the list of IPMs where all vital rates varied
		IPMout3=sampleIPMOutput(
			IPMList=IPMlist3,
			passageTimeTargetSize=c(10),
			sizeToAgeStartSize=c(5),
			sizeToAgeTargetSize=c(6,7,8,9,10))
		qlambda=quantile(IPMout3[['lambda']],probs=c(.025,.5,.975))
		boxplot(IPMout3[['resAge']])  
}

