\name{makeClonalObj}
\alias{makeClonalObj}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Function to build clonal reproduction objects 
}
\description{
  Allows a series of different glms to be fit for all steps of clonal
  reproduction, e.g., probability of reproducing clonally, number of clonal offspring 
  produced, etc. Currently only pre-census clonal reproduction relationships can be handled.  
  
}
\usage{
makeClonalObj(dataf, fecConstants=data.frame(NA),
		Formula=list(fec~size),Family="gaussian",
		Transform="none",meanOffspringSize=NA,
		sdOffspringSize=NA,offspringSplitter=data.frame(continuous=1),
		vitalRatesPerOffspringType=data.frame(NA),fecByDiscrete=data.frame(NA),
		offspringSizeExplanatoryVariables="1", coeff=NULL,doOffspring=TRUE)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{dataf}{a dataframe with columns "size", "sizeNext", "stage",
      "stageNext", and any number of columns with clonal reproduction
      data. If clonal reproduction data is transformed via log, etc, this MUST BE MADE CLEAR in the argument \code{Transform} since the clonality object produced must generate total reproductive output.)}
  \item{fecConstants}{a data-frame containing the value by which each of the product of the fecundity rates will be multiplied \emph{in the order defined by the order supplied in the list \code{Formula}}; these might capture for example the probability of establishment of clones or other steps in the clonal reproductive pathway that are not measured for each parent; default is NA if no constants are used.}
  \item{Formula}{a list containing formulas describing the desired
    explanatory variables (interactions, etc) and response variables in classical R style, i.e. covariates separated by `+', `*', `:'. Possible covariates include `size', 'size2' (size^2), `size3'  (size^3),`logsize' (log(size)), and `covariate' (if this name is used, the assumption is made that this is a discrete covariate from which compound matrices may be constructed), or any other covariates available in the data-frame supplied.}
  \item{Family}{a character vector containing the names of the families to be used for the glms, e.g., binomial, poisson, etc. Again, these must appear  \emph{in the
      order defined by \code{Formula}} }
  \item{Transform}{a character vector containing the names of the
    transforms to be used for the response variables, e.g., log, sqrt, -1, etc. Again, these must appear  \emph{in the order defined by \code{Formula}} }
  \item{meanOffspringSize}{numeric vector, defining mean offspring size. Defaults to NA, in which case the function will use to data to assess the mean offspring size according to the relationship defined in offspringSizeExplanatoryVariables (which either simply fits a mean, or may fit more complex relationships linking maternal size to offspring size).}
  \item{sdOffspringSize}{numeric vector, defining standard deviation of offspring size. Defaults to NA, in which case the function will use the data to assess the sd in offspring size; as described for meanOffspringSize}
  \item{offspringSplitter}{dataframe with values defining the number of
    offspring going into the indicated offspring category; will be re-scaled to
    sum to 1 within the function. This argument needs to be entered as a data.frame, and the names in the data.frame need to precisely match the used stage names in the data file.}
  \item{vitalRatesPerOffspringType}{dataframe defining which fecundity rates (both functions and constants) apply to which offspring category. This only needs to be 
    specified when some fecundity rates do not apply to all offspring categories. The offspring categories in the column names of this dataframe should match those 
    in the offspringSplitter exactly. The row names of the dataframe should match the fecundity column names in the data file and the supplied fecundity constants, 
    in that order. In the dataframe, a '1' indicates that a fecundity rate applies to an offspring category, while a '0' indicates an omission. For instance, establishment
    and seedling survival rates may be applicable to seedlings, but not to seeds that go into a seedbank (depending on the life cycle and definition of vital rates).}
  \item{fecByDiscrete}{data.frame defining number of offspring produced by each
    discrete class ; defaults to 0. If specified, ALL discrete classes MUST appear in alphabetical order, 
    so NO "continuous". e.g. fecByDiscrete=data.frame(dormant=0,seedAge1=4.2,seedOld=0)}     
  \item{offspringSizeExplanatoryVariables}{a character defining the relationship defining offspring size; the default is "1", indicating simply fitting a mean and a variance; alternatives would including defining offspring size as a function of maternal size (i.e., offspringSizeExplanatoryVariables="size") or more complex polynomials of size (i.e., offspringSizeExplanatoryVariables="size+size2"). The corresponding relationship is fitted to the data contained in dataf, taking as the response variable the column "sizeNext" in dataf for rows where the column "offspringNext" is equal to "clonal" and the column "stageNext" is equal to "continuous". }  
   \item{coeff}{list of numeric vector of required coefficients to be imposed if dataf is NULL for each element of the Formula list in order; must be compatible with Formula}
   \item{doOffspring}{argument defining whether you wish to fit an offspring regression as part of this function, or do it separately (see makeOffspringObj)}
}
  
\details{
  This function fits a suite of subfunctions of clonal reproduction towards creating
  a Clonal transition  projection model. Users can
  define the functional form of each relationship, as well as the
  distribution and any transforms. There is also a possibility of
  defining clonal reproduction from discrete sizes into each of
  the subfunction outcomes; defined in the matrix fecByDiscrete.  
}

\value{
  an object of class fecObj
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeSurvObj}}, \code{\link{makeGrowthObj}}

}
\examples{
# makeClonalObj works exactly the same way as makeFecObj. 
# An example will be added here as soon as we have added a 
# data file on a clonal plant to the package.

}
