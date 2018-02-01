\name{makeSurvObj}
\alias{makeSurvObj}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{Functions to build survival objects}
\description{
  A function to fit logistic regressions defining
  survival following user defined formulas (e.g., size+size^2, etc)
  to build survival objects for which methods to build an IPM  object are defined.
}
\usage{
makeSurvObj(dataf,Formula=surv~size+size2, coeff=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataf}{a dataframe with columns `size' and
    `surv'(`size' is size at t, `surv' is 0 for death of the individual
    and 1 for survival);
    facultatively, dataf may include `covariate'
    and `covariatel' for a single discrete covariate, indicating values at t,
    and at t+1, respectively; these must take values of sequential integers, starting at
    `1'.  }
  \item{Formula}{a formula describing the desired
    explanatory variables (interactions, etc) in classical R
    style, i.e. separated by `+', `*', `:'. Possible covariates include `size', 'size2' (size^2), `size3'
    (size^3),`logsize' (log(size)), `logsize2' (log(size)^2), and
    `covariate'. Response should be 'surv' to match \code{dataf}}
  \item{coeff}{numeric vector of required coefficients to be imposed if dataf is NULL; must be compatible with Formula}
 }

\value{
  An object of class survObj which is a S4 object which contains the slots: 
   \item{fit}{an object of class \code{lm} or \code{glm} that can be used with predict in the survival methods}
Slots can be listed by using slotNames(survObj)   
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez & Eelke Jongejans
}
\note{
  See manual for details on building case-specific survival objects. 
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{picSurv}}
}
\examples{
#generate data
dff <- generateData()
#make simple logistic regression survival object relating survival to size at t
sv1 <- makeSurvObj(dff, Formula=surv~size)
#assess fit for model with discrete environmental classes fitted
sv1 <- makeSurvObj(dff, Formula=surv~size+covariate)

#now specifying parameters and supplying no data
sv1 <- makeSurvObj(Formula = surv ~ size + covariate,coeff=c(1,1,1))

}
