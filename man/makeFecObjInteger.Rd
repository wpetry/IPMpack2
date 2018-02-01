\name{makeFecObjInteger}
\alias{makeFecObjInteger}
\alias{makeClonalObjInteger}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Function to build fecundity objects 
}
\description{
 Allows a series of different glms to be fit all on the way to fecundity, e.g., probability of reproducing, number of reproductive structures produced (e.g. flowers), etc; as well as fecundity into different discrete classes.  
  
}
\usage{

makeFecObjInteger(dataf,
		fecConstants = data.frame(NA),
		Formula = list(fec~size),
		Family = "gaussian",
		Transform = "none",
		meanOffspringSize = NA,
		thetaOffspringSize = NA,
		offspringSplitter = data.frame(continuous=1),
		vitalRatesPerOffspringType=data.frame(NA),
		fecByDiscrete = data.frame(NA),
		offspringSizeExplanatoryVariables = "1",
		distOffspring = "poisson", 
		coeff=NULL, doOffspring=TRUE, 
		reproductionType="sexual")

makeClonalObjInteger(dataf,
		fecConstants = data.frame(NA),
		Formula = list(fec~size),
		Family = "gaussian",
		Transform = "none",
		meanOffspringSize = NA,
		thetaOffspringSize = NA,
		offspringSplitter = data.frame(continuous=1),
		vitalRatesPerOffspringType = data.frame(NA),
		fecByDiscrete = data.frame(NA),
		offspringSizeExplanatoryVariables = "1",
		distOffspring = "poisson", 
		coeff=NULL, doOffspring=TRUE)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{dataf}{a dataframe with columns "size", "sizeNext", "stage", "stageNext", and any additional columns with fecundity data. If fecundity data is transformed via log, etc, this MUST BE MADE CLEAR in the argument \code{Transform} since the fecundity object produced must generate total reproductive output.)}
  \item{fecConstants}{a list containing the value by which each of the fecundity rates will be multiplied \emph{in the order defined by the order in \code{Formula}}.  This data frame adjusts the probability of establishment of seeds or other stages in  sexual reproduction that are not explicitly incorporated  for each parent (e.g., 25\% of seeds across all individuals germinate).  The default is NA if no constants are used (equivalent to multiplying by 1).}
  \item{Formula}{a formulas describing the desired explanatory variables (interactions, etc) in classical R style, i.e. separated by `+', `*', `:' and the response variables of choice. Possible covariates include `size', 'size2' (size^2), `size3'  (size^3),`logsize' (log(size)), and `covariate' (if this name is used, the assumption is made that this is a discrete covariate from which compound matrices may be constructed), and any other covariates available in dataf. Again, these must appear  \emph{in the order defined by the Formula argument}.  See \code{\link{formula}} in \code{base} for more details.}
  \item{Family}{a character vector containing the names of the families to be used for the glms, e.g., binomial, poisson, etc. Again, these must appear  \emph{in the order defined by \code{Formula}} }
  \item{Transform}{a character vector containing the names of the transforms to be used for the response variables, e.g., log, sqrt, -1, etc. Again, these must appear  \emph{in the order defined by \code{Formula}} }
  \item{meanOffspringSize}{numeric vector, defining mean offspring size. Defaults to NA, in which case the function will use to data to assess the mean offspring size according to the relationship defined in offspringSizeExplanatoryVariables (which either simply fits a mean, or may fit more complex relationships linking maternal size to offspring size).}
  \item{thetaOffspringSize}{numeric vector, defining size parameter of offspring size. It is only required if the family of offspring size is negative binomial (rather than poisson). Defaults to NA, in which case the function will use the data to assess this parameter using dbinom.}
  \item{offspringSplitter}{dataframe with values defining the number of
    offspring going into the indicated offspring category; will be re-scaled to
    sum to 1 within the function. This argument needs to be entered as a data.frame, and the names in the data.frame need to precisely match the used stage names in the data file.}
  \item{vitalRatesPerOffspringType}{dataframe defining which fecundity rates (both functions and constants) apply to which offspring category. This only needs to be specified when some fecundity rates do not apply to all offspring categories. The offspring categories in the column names of this dataframe should match those in the offspringSplitter exactly. The row names of the dataframe should match the fecundity column names in the data file and the supplied fecundity constants, in that order. In the dataframe, a '1' indicates that a fecundity rate applies to an offspring category, while a '0' indicates an omission. For instance, establishment and seedling survival rates may be applicable to seedlings, but not to seeds that go into a seedbank (depending on the life cycle and definition of vital rates).}
  \item{fecByDiscrete}{data.frame defining number of offspring produced by each
    discrete class ; defaults to 0. If specified, ALL discrete classes MUST appear in alphabetical order, 
    so NO "continuous". e.g. fecByDiscrete=data.frame(dormant=0,seedAge1=4.2,seedOld=0)}    
  \item{offspringSizeExplanatoryVariables}{a character defining the relationship defining offspring size; the default is "1", indicating simply fitting a mean and a variance; alternatives would including defining offspring size as a function of maternal size (i.e., offspringSizeExplanatoryVariables="size") or more complex polynomials of size (i.e., offspringSizeExplanatoryVariables="size+size2"). The corresponding relationship is fitted to the data contained in dataf, taking as the response variable the column "sizeNext" in dataf for rows where the column "offspringNext" is equal to "sexual" and the column "stageNext" is equal to "continuous". }  
\item{distOffspring}{
character indicating the desired distribution of offspring sizes  (poisson or negative binomial)}
   \item{coeff}{not yet implemented}
   \item{doOffspring}{argument defining whether you wish to fit an offspring regression as part of this function (TRUE), or do it separately (see makeOffspringObj); if this is FALSE, other argument relating to the offspring distribution will be ignored }
   \item{reproductionType}{argument specifying if "sexual" or "clonal" offspring should be considered; default is "sexual".}

     
}
  
\details{See help for makeFecObj; this is exactly analagous, except that it uses the poisson or negative binomial as descriptors for offspring size  
}

\value{
  an object of class fecObjInteger
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeSurvObj}}, \code{\link{makeGrowthObj}},\code{\link{makeFecObj}}

}
\examples{
# Open dataset for the herbaceous perennial Cryptantha flava where 
# the state variable is integer (number of rosettes)
data(dataIPMpackCryptantha)
head(dataIPMpackCryptantha)
d <- dataIPMpackCryptantha

#See the description of the data for information on the variables
help(dataIPMpackCryptantha)

# For this example, focus only on the first annual transition 
# available in the dataset
d1 <- d[d$year==2004, ]

#Create fecundity object with integer data
fo <- makeFecObjInteger(d1, Formula = fec1~size, distOffspring = "poisson")


#Example with imposed offspring object
off1 <- makeOffspringObj(dataf = d1, Formula = sizeNext~1, Family="poisson")
fo <- makeFecObjInteger(d1, Formula = fec1~size, distOffspring = "poisson", 
		doOffspring=FALSE)
Fmatrix <-  makeIntegerFmatrix(fecObj = fo, offspringObj=off1)




}
