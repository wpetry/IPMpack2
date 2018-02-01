\name{makeOffspringObj}
\alias{makeOffspringObj}

\title{Function to build offspring objects }
\description{
  A function that fits regressions that define offspring size and from
  these build growth objects for which methods to build an IPM object
  are defined; alternatively, the function creates offspring objects
  following a specified formula with specified coefficients and sd. Note
  that if an "offspringNext" column is available in the data, the data
  will be subsetted based on whether offspringType="sexual" or "clonal"
  (the default is "sexual"); - otherwise, appropriate data must
  be supplied. 
}
\usage{
makeOffspringObj(dataf=NULL, Formula = sizeNext ~ size, 
	regType = "constantVar", Family = "gaussian", link = NULL,
coeff=NULL,sd=NULL, reproductionType="sexual")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataf}{a dataframe with columns `size' and
    `sizeNext'(`size' is size of parent at t, and may not be known, `sizeNext' is offspring size at t+1);
    facultatively, dataf may include `covariate'
    and `covariatel' for a single discrete covariate, indicating values at t,
    and at t+1, respectively; these must take values of sequential integers, starting at
    `1'. }
  \item{Formula}{a formula describing the desired
    explanatory variables (interactions, etc) according to the R notation for \code{formula}.
    style, i.e. separated by `+', `*', `:' and response variable. Possible covariates include `size', 'size2' (size^2), `size3'
    (size^3),`logsize' (log(size)), `logsize2' (log(size)^2), and
    `covariate' (if this name is used, the assumption is made that this is a discrete covariate from which compound matrices may be constructed); or any other covariate available in dataf.}
  \item{regType}{possible values include `constantVar' or `changingVar'}
  \item{Family}{possible values include `gaussian', `poisson', `negbin'}
   \item{link}{defaults to NULL, currently only relevant with Family="negbin", and only "log" and "identity" are permitted}
   \item{coeff}{numeric vector of required coefficients to be imposed if dataf is NULL; must be compatible with Formula}
   \item{sd}{numeric of required sd to be imposed if dataf is NULL}
   \item{reproductionType}{whether the relationship should be fitted for
     sexual or clonal offspring; the default is "sexual"; this will only be relevant if data is
     provided and has a column "offspringNext"}
     
  }
\value{
An object of class growthObj, or growthObjPois, growthObjIncr, or growthObjLogIncr;
or growthObjDeclineVar, or growthObjIncrDeclineVar, or growthObjLogIncrDeclineVar. 
These are S4 objects which contain the slots: 
   \item{fit}{an object of class \code{lm} or \code{glm} or \code{gls} that can be used with predict in the growth methods}
Slots can be listed by using slotNames(growthObj)   

}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez & Eelke Jongejans
}
\note{
Note that DeclineVar objects cannot currently be constructed without a data-frame.   
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{\link{makeGrowthObj}}, \code{\link{makeSurvObj}}, \code{\link{makeFecObj}}
}
\examples{
#generate data
dff <- generateData()

#make simple linear regression growth object relating size to size at t+1
off1 <- makeOffspringObj(dataf = dff, Formula = sizeNext~1)

#now specifying parameters and supplying no data
off1 <- makeOffspringObj(Formula = incr ~ size + covariate,coeff=c(1,1,1),sd=1)

##make an Fmatrix with this
dff<-generateData()
dff$fec[dff$fec==0] <- NA

off1 <- makeOffspringObj(dataf = dff, Formula = sizeNext~1)
fv1 <- makeFecObj(dff, Formula = fec~size, Transform = "log", 
    doOffspring=FALSE)
Fmatrix1 <- makeIPMFmatrix(fecObj = fv1, nBigMatrix = 20, 
	minSize = min(dff$size, na.rm = TRUE), maxSize = max(dff$size,
na.rm = TRUE), correction="constant", offspringObj=off1)

#compare with the other approach (where offspring object is not separate)
fv2 <- makeFecObj(dff, Formula = fec~size, Transform = "log",
	offspringSizeExplanatoryVariables = "1", doOffspring=TRUE)
Fmatrix2 <- makeIPMFmatrix(fecObj = fv2, nBigMatrix = 20, 
	minSize = min(dff$size, na.rm = TRUE), maxSize = max(dff$size,
na.rm = TRUE), correction="constant", offspringObj=NULL)

par(mfrow=c(1,2))
image(Fmatrix1); image(Fmatrix2)



}
