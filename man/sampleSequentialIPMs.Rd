\name{sampleSequentialIPMs}
\alias{sampleSequentialIPMs}
\alias{.makeListIPMs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Makes a list of IPMs where there is a discrete covariate.
}
\description{
Wrapper function to build the IPM corresponding to every level of the discrete 
covariate, and return a list of these. 
}
\usage{
sampleSequentialIPMs(dataf, nBigMatrix = 10, minSize = -2, 
    maxSize = 10,	
	integrateType = "midpoint", correction = "none", 
	explSurv = surv ~ size + size2 + covariate, 
	explGrow = sizeNext ~ size + size2 + covariate,
	regType = "constantVar", 
	explFec = fec ~size,  Family="gaussian", 
	Transform = "none", 
	fecConstants = data.frame(NA))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataf}{
    a dataframe with columns `size', `sizeNext', 'surv', 'fec',
    'covariate', 'covariatel'; and 'age' indicating which individuals are 
    seedlings for identifying the mean and variance in seedling size.
    }
 \item{nBigMatrix}{
	number of bins in size.
	}
  \item{minSize}{
	minimum size.
	}
  \item{maxSize}{
	maximum size.
	}
  \item{integrateType}{
	integration type.
	}
  \item{correction}{
	correction for unintentional eviction (individuals move outside the size 
	range of the IPM). This correction redistributes individuals so that column 
	sums of the IPM match expected survival for that column.
	}
 \item{explSurv}{
	Formula and explanatory variables used in the survival model.
	}
 \item{explGrow}{
	explanatory variables used in the growth model.
	}
 \item{regType}{
	Formula and regression Type for growth (normal density function, truncated, 
	etc).
	}
 \item{explFec}{
	explanatory variables used in the fecundity.
	}
 \item{Family}{a character vector containing the names of the families to be 
 used for the glms, e.g., binomial, poisson, etc. Again, these must appear  
 \emph{in the
      order defined by the list of formula} }
 \item{Transform}{a character vector containing the names of the
    transforms to be used for the response variables, e.g., log, sqrt, -1, etc. 
    Again, these must appear  \emph{in the order defined by the list of 
    formula} }
 \item{fecConstants}{
	data.frame of constant multipliers for the fecundity model.
	}
}
\value{
  list of matrices corresponding to covariates, in order.
}
\note{
	Formerly makeListIPMs(). makeListIPMs() is no longer supported but has been 
	hidden (.makeListIPMs()) and can be accessed for backward compatibility.
}
\author{
Cory Merow, C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, 
Eelke Jongejans.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
dff <- generateData()
IPMlist <- sampleSequentialIPMs(dff, Transform="log")
}
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
