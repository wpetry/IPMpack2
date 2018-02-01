\name{growthModelComp}
\alias{growthModelComp}
\alias{survModelComp}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compares growth and survival objects built from different covariate sets.
}
\description{
Function compares model fits for growth and survival objects built with different linear combinations of covariates (plotting currently restricted to transforms of size; but comparison can include any chosen covariates).  Growth can have multiple response forms. 
Returns a list containing a summary table of covariates and scores, and another list containing all of the growth (or survival) objects used in the comparison.}
\usage{
growthModelComp(dataf, 
    expVars = c(sizeNext~1,  sizeNext~size, sizeNext~size + size2), 
	regressionType = "constantVar",  testType = "AIC", 
		makePlot = FALSE, mainTitle = "", plotLegend = TRUE, 
		  legendPos = "topright",...)
		
survModelComp(dataf, expVars = c(surv~1,  surv~size, surv~size + size2), 
    testType = "AIC", 
	makePlot = FALSE, mainTitle = "",ncuts=20, plotLegend = TRUE, 
	   legendPos = "bottomleft", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataf}{
 	dataframe with columns size, surv, and the growth response variable of choice
   }
  \item{expVars}{
    list of Formulas.  Defaults to \code{c(sizeNext~1,  sizeNext~size, sizeNext~size + size2)}.
  }
  \item{regressionType}{
    character string identifying whether the type of regression run will have constant or changing variance (for \code{growthModelComp}.  Defaults to \code{constantVar}.
  }
  \item{testType}{
    character string identifying the metric used to compare models.  Can be any string that uses \code{loglike} from the lm or glm object.  For example \code{"AIC"} or \code{"BIC"}.  Defaults to \code{"AIC"}.
  }
  \item{makePlot}{
    logical whether to make plots with the comparison building. Defaults to \code{FALSE}.
  }
  \item{mainTitle}{
    string to place as the \code{main} attribute in plots (if \code{makePlot = TRUE}.  defaults to \code{NULL}.
  }
  \item{ncuts}{
 for survModelComp, number of cuts in the data-set to be used in plotting
 }	
  \item{plotLegend}{
 logical whether to plot a legend.  Defaults to \code{FALSE}.
  }
  \item{legendPos}{
 places legend.  Defaults to "topright".
  }
  \item{...}{
 	additional arguments for plotting (ylim, col, etc)
   }
 }
\details{
Both \code{growthModelComp} and \code{survModelComp} use a dataframe that has variables \code{size} and \code{sizeNext} to build a series of nested models.  The default will build growth or survival objects with an intercept, an intercept and size, an an intercept with size and size^2 terms. 
%Covariates can also be added, and require that these variables have the term "cov" in the variable name. This is not TRUE? right? 

The models build use only \code{lm} or \code{glm} (and not \code{mcmcGLMM} for example) to estimate maximum likelihood estimates of functions.  The testType (default \code{"AIC"} uses the \code{loglike} output from the lm or glm objects to score the model.  

Plotting calls the functions \code{plotGrowthModelComp} or \code{plotSurvModelComp} to plot the objects.  These functions can also be called after building the model comparison lists that are returned.  If called outside of the initial building functions, they need to receive the \code{GrowthObjects} or \code{SurvObjects} list in the outputList from the build function.  See \code{plotGrowthModelComp} and \code{plotSurvModelComp} for more details.  
}
\value{
  a list with a summary table of class \code{dataframe} with models and scores and list of containing the objects of class grObj and survObj for each model.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeGrowthObj}},\code{\link{makeSurvObj}},\code{\link{plotGrowthModelComp}}, \code{\link{plotSurvModelComp}}
}
\examples{
# Data with size and sizeNext
dff <- generateData()

growthModelComp(dff, makePlot = TRUE)
survModelComp(dff, makePlot = TRUE)

growthModelComp(dff, makePlot = TRUE, regressionType = "changingVar")

}
