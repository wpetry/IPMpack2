\name{plotGrowthModelComp}
\alias{plotGrowthModelComp}
\alias{plotSurvModelComp}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plots compared models built with \code{growthModelComp} and \code{survModelComp}.
}
\description{
Function plots compared models built with \code{growthModelComp} and \code{survModelComp}. This can be invoked directly from \code{growthModelComp} and \code{survModelComp} with the argument \code{makePlot = TRUE}.
}
\usage{
plotGrowthModelComp(grObj,summaryTable, dataf, expVars, 
testType = "AIC", 
plotLegend = TRUE, mainTitle = "", legendPos = "topright",...)

plotSurvModelComp(svObj, summaryTable, dataf, expVars, 
testType = "AIC",  plotLegend = TRUE, mainTitle = "",ncuts=20, 
legendPos = "bottomleft",...) 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{grObj}{
    a list with the objects of the class growth object  equal to \code{treatN}. 
  }
  \item{svObj}{
    a list with the objects of the class  survival object equal to \code{treatN}. 
  }
  \item{summaryTable}{
    dataframe output from \code{growthModelComp} and \code{survModelComp} that contains linear predictor and testType scores (see \code{growthModelComp} and \code{survModelComp}).
  }
  \item{dataf}{
    dataframe containing \code{size} and \code{sizeNext} 
  }
  \item{expVars}{
    vector, list of covariates.  Defaults to \code{c("1",  "size", "size + size2")}.
  }
  \item{testType}{
    character string identifying the metric used to compare models.  Can be any string that uses \code{loglike} from the lm or glm object.  For example \code{"AIC"} or \code{"BIC"}.  Defaults to \code{"AIC"}.
  }
  \item{plotLegend}{
    logical indicated whether a legend is created. If \code{TRUE}, positions the legend in \code{"topleft"} for growth models and \code{"bottomleft"} for survival models. 
  }
  \item{mainTitle}{
    string to place as the \code{main} attribute in plots (if \code{makePlot = TRUE}.  defaults to \code{NULL}.
  }
  \item{ncuts}{
  number of consecutive size values for which to take means of size and survival for plotting.
  }
  \item{legendPos}{
position of the legend on the figure ("topright", "bottomleft", ...)
  }
  \item{...}{
additional arguments to plot (ylim, col, etc)	
  }
 }
\details{
Plots multiple growth and survival objects returned from \code{growthModelComp} and \code{survModelComp}.  See \code{plotGrowthModelComp} and \code{plotSurvModelComp} for more details.  
}
\value{
a plot object.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{growthModelComp}},\code{\link{growthModelComp}}
}
\examples{
# Data with size and sizeNext
dff <- generateData()

grModels <- growthModelComp(dff, makePlot = FALSE)



}
