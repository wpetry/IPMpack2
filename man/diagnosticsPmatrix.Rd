\name{diagnosticsPmatrix}
\alias{diagnosticsPmatrix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Creates a series of diagnostic graphs for a P matrix.
}
\description{
 Displays the effects of increasing number of bins and continuous (size) stage range on a number of predictions from the P matrix to verify that sufficient resolution and continuous stage range are being used. 
}
\usage{
diagnosticsPmatrix(Pmatrix, growObj, survObj, dff=NULL, integrateType, 
correction, cov = data.frame(covariate = 1), sizesToPlot = c(), 
extendSizeRange = c())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{Pmatrix}{
  an IPMmatrix object.
}
 \item{growObj}{
  the growth object used to construct the IPMmatrix object.
}
 \item{survObj}{
  the survival object used to construct the IPMmatrix object.
}
 \item{dff}{
  the dataframe from which the survival and growth objects were constructed; if not supplied, defaults to NULL, which will simply result in the size distribution not being plotted. 
}
 \item{integrateType}{
  integration type, defaults to \code{midpoint} (which uses probability density function); other option is \code{cumul} (which uses the cumulative density function).
 }
 \item{correction}{
correction type, defaults to \code{none}. The first option is \code{constant} which will multiply every column of the IPM by a constant sufficient to adjust values to those predicted for survival at that size. The second option is \code{discretizeExtremes} which will place all transitions to sizes smaller than \code{minSize} into the smallest bin, and transitions to sizes larger than \code{maxSize} into the largest bin. 
 }
 \item{cov}{
  a data-frame with one row containing all covariates; defaults to 1, and will be ignored if covariates do not exist in growth and survival objects
}
 \item{sizesToPlot}{
 a vector containing desired sizes to plot growth resolution for (second panel); if not supplied, the function will use the quantiles
}
 \item{extendSizeRange}{
 a vector containing desired size range for the matrix to be compared with a larger size range; if this vector has length 0 the defaults will be 0.5xminSize (unless minSize<0 in which case, 2*minSize is used) and 1.5*maxSize
 }

}
\details{
This function provides a series of plots indicative of whether bin choice and size range is adequate. On the first plot, the left panel shows the range of the data as a histogram (if a data-frame is provided) and the range of the state variable fitted in the current Pmatrix; as well as the range of the state variable in two Pmatrices used for comparison, one with the same number of bins but an extended size range (red), and one with the same size range but an increased number of bins (blue) (increased by about 50 percent). If the range in the data and the range in the Pmatrix are mis-matched, the limits of the data used in building the Pmatrix can be adjusted with the \code{minSize} and \code{maxSize} arguments in \code{makeIPMPmatrix}.  

The discretization of a continuous function can result in under- or over-estimation of the true density. Where this occurs, the sum of the columns of the discretized Pmatrix will not match predictions from the fitted survival model. The middle panel plots these against each other for the three matrices in the first panel (current, extended range and increased bin number) using the same colours as in the first panel. Lines should fall along the (0,1) line shown in grey; if they do not, the argument \code{correction="constant"} may be of use. This ensures that the columns sum to the fitted survival by multiplying every column in the Integral Projection Model by the value that allows this. The third panel checks whether extending the size range included in the matrix and increasing the number of bins (by increasing \code{nBigMatrix} and thereby having narrower bins) does not alter basic predictions from the IPM.

The six panels on the next plot show the discretized IPM (histograms) for the current IPM (top) and one with an increased number of bins (bottom)  and the theoretical density function (red line) . These are plotted either for three chosen sizes (\code{sizesToPlot}) or the 0.25, 0.5 and 0.75 quantiles of either the observed data or the range of meshpoints; this size is printed in the top right hand of every plot. If the theoretical density function  curve is very distant from the histograms, increasing the \code{nBigMatrix} argument may correct this discrepancy. 
 
Note that it is important that the comparison be "fair" - i.e., whatever the \code{correction} argument used in your current IPM, the same argument must be used in \code{diagnosticsPmatrix.}

Note also that if survival is constant across size, the patterns apparent in the life expectancy plot will reflect numerical slippage (since all sizes will have exactly the same life expectancy) and disagreement between the different lines should be ignored. 

Finally, note that if the correction used is \code{discretizeExtremes} then the column sums of the Pmatrix and survival will not match towards the extremes. 
 
}
\references{
Easterling, Ellner & Dixon. 2000. Size-specific sensitivity: a new structured population model. Ecology 81, p694-708.

Ellner & Rees. 2006. Integral projection models for species with complex demography. The American Naturalist 167, p410-428.

For effects of mesh size on IPM output: Zuidema, Jongejans, Chien, During & Schieving. Integral projection models for trees: a new parameterization method and a validation of model output. Journal of Ecology 98, p345-355.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeIPMPmatrix}}, \code{\link{convergeIPM}}
}
\examples{
# Example where mesh size does not have a major effect on model output:
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
	maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff))
diagnosticsPmatrix(Pmatrix, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), dff = dff)

# Compare with the following example where mesh size has an important 
# effect on output:
Pmatrix <- makeIPMPmatrix(nBigMatrix = 8, 
    minSize = min(dff$size, na.rm = TRUE), 
	maxSize = 0.5*max(dff$size, na.rm = TRUE), 
	   growObj = makeGrowthObj(dff), 
		survObj = makeSurvObj(dff))
diagnosticsPmatrix(Pmatrix, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), dff = dff)

#with cumul
Pmatrix <- makeIPMPmatrix(nBigMatrix = 10, 
    minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), 
	integrateType = "cumul")
diagnosticsPmatrix(Pmatrix, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), dff = dff, integrateType = "cumul")


#with log increment
Pmatrix <- makeIPMPmatrix(nBigMatrix = 50, 
    minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE), 
	   growObj = makeGrowthObj(dff,Formula = logincr~size), 
		survObj = makeSurvObj(dff))
diagnosticsPmatrix(Pmatrix, 
    growObj = makeGrowthObj(dff,Formula = logincr~size), 
	survObj = makeSurvObj(dff), dff = dff)

#example with correction="discretizeExtremes"
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
	maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), correction="discretizeExtremes")
diagnosticsPmatrix(Pmatrix, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), dff = dff, correction="discretizeExtremes")


}
