\name{makeDiscreteTrans}
\alias{makeDiscreteTrans}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Builds matrix for transitions between discrete (e.g. seedbank, dormant) and continuous (e.g. size) stages.
}
\description{
  Function that takes a data frame reflecting a population that includes continuous (e.g., size) and discrete (e.g., diapause)
  classes of individuals, and builds a transition matrix from this for movement between discrete and continuous stages (providing just a single value for the continuous stages; the detail of movement between continuous stages (e.g., sizes) is generated elsewhere). This object can then be used as an argument in the function to "makeIPMPmatrix" to build a P matrix that contains both discrete and continuous stages. 

  The dataframe must contain columns  "stage" and "stageNext" with values of the names of the discrete classes and the name "continuous" where appropriate, in the current and subsequent time step. Continuous categories are also defined by their measurements, contained in "size" and "sizeNext". This is necessary for defining the mean and variance of the continuous stage of individuals emerging from discrete stages. Alternatively, you can enter the transition matrix for the discrete stages in the 'discreteTrans' argument.
}
\usage{
makeDiscreteTrans(dataf, stages = NA, discreteTrans = NA, 
    meanToCont = NA, sdToCont = NA, 
        continuousToDiscreteExplanatoryVariables = "size")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataf}{a dataframe with columns "stage", "stageNext" (both FACTORS (use \code{as.factor}) containing either names of discrete stages or "continuous" or "dead"), "size", "sizeNext", and "surv" (continuous and boolean variables respectively).}
  \item{stages}{a character vector with the names of the discrete classes. Normally this argument does not have to be used as the names of discrete classes are extracted from the data or entered discreteTrans matrix.}
  \item{discreteTrans}{a matrix with transition probabilities between the discrete and continuous stages. The column names should match the stage/stageNext names in the data file. The names discrete stages should be in alphabetical order, followed by 'continuous'. The row names should be the same, but with 'dead' added at the bottom. Thus, this matrix represents all the fates of individuals from the various classes.}
  \item{meanToCont}{a matrix containing the mean sizeNext values for individuals moving from discrete classes to the continuous classes (should contain NA when no individuals move from a particular discrete class to a continuous sizeNext). The column names should be equal (in alphabetical order) to the names of the discrete classes (so no continuous).}
  \item{sdToCont}{a matrix containing the sd sizeNext values for individuals moving from discrete classes to the continuous classes (should contain NA when no individuals move from a particular discrete class to a continuous sizeNext). The column names should be equal (in alphabetical order) to the names of the discrete classes (so no continuous).}
  \item{continuousToDiscreteExplanatoryVariables}{a character defining the relationship defining size influences the probability of individuals in the continuous class moving to any of the discrete classes. This argument is not relevant when individuals in the continuous stage cannot move into any discrete stage.}
}
\value{
  an object of class "discreteTrans" with columns corresponding to all the discrete and the one continuous stage.
}
\references{
Easterling, Ellner & Dixon. 2000. Size-specific sensitivity: a new structured population model. Ecology 81, p694-708.

Ellner & Rees. 2006. Integral projection models for species with complex demography. The American Naturalist 167, p410-428.

%% ~put references to the literature/web site here ~
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeIPMPmatrix}}

}
\examples{
dff <- generateData(type="discrete")
discTrans <- makeDiscreteTrans(dff)
makeIPMPmatrix(nBigMatrix = 10, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), discreteTrans = discTrans)
	
# Often some data needed for makeDiscreteTrans are not available as 
# individual records in your data file. For instance the fate of seeds 
# in the seedbank of the generateData(type="discrete") example:
dff<-generateData()
# Now the transition matrix needs to be entered as an argument, 
# as well as the mean and sd of sizeNext values for discrete to 
# continuous transitions. 
discTrans <- makeDiscreteTrans(dff,
				discreteTrans = matrix(c(.5,.1,.4,0,1,0),
				nrow=3, ncol=2, 
				dimnames = list(c("seedbank","continuous","dead"),
				c("seedbank","continuous"))),
				meanToCont = matrix(c(mean(dff$sizeNext[is.na(dff$stage)
				    &dff$stageNext=="continuous"],na.rm=TRUE)),
					nrow=1, ncol=1, dimnames = list(1,c("seedbank"))), 
					sdToCont = matrix(c(sd(dff$sizeNext[is.na(dff$stage)
					  &dff$stageNext=="continuous"],na.rm=TRUE)),
					nrow=1, ncol=1, dimnames = list(1,c("seedbank"))))
Pmatrix<-makeIPMPmatrix(nBigMatrix = 10, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), discreteTrans = discTrans)
Fmatrix<-makeIPMFmatrix(nBigMatrix = 10, fecObj = makeFecObj(dff))
dim(Pmatrix)
dim(Fmatrix)					
# To fix this mismatch, all discrete classes (1 in this case) need to 
# be added to the Fmatrix as well, e.g.:
Fmatrix<-makeIPMFmatrix(nBigMatrix = 10, fecObj = makeFecObj(dff, 
    offspringSplitter=data.frame(seedbank=.3,continuous=.7)))
IPM <- Pmatrix + Fmatrix	
}
