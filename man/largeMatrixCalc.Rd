\name{largeMatrixCalc}
\alias{largeMatrixCalc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculates population growth rate (lambda) and stable stage distribution in a computationally efficient way when the number of bins in the IPM is large.
}
\description{
Method to calculate population growth rate (lambda) and stable stage distribution where a large number of bins are used in the IPM, as it may be the case with species that vary largely in size, or models that include size x age interactions.
}
\usage{
largeMatrixCalc(Pmatrix, Fmatrix, tol = 1e-08)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Pmatrix}{
	object of class IPMmatrix describing survival transitions.
}
  \item{Fmatrix}{
	object of class IPMmatrix describing fecundity transitions.
}
  \item{tol}{
    tolerance for convergence, defaults to 1e-08.
}
}
\value{
 \item{lambda}{Population rate of increase.}
  \item{stableDist}{Stable stage distribution.}
  \item{h1}{size bin width.}
}
\references{
Rees and Ellner. 2009. Integral projection models for populations in temporally varying environments. The American Naturalist 79, p575-594.

Caswell. 2001. Matrix population models: construction, analysis, and interpretation. 2nd ed. Sinauer. p377-502.

Garcia, Dahlgren, Ehrlen. 2011. No evidence of senescence in a 300-year-old mountain herb. Journal of Ecology 99, p1424-1430.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}
\note{
Modified from Appendix A in Rees and Ellner 2009 (see references).
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
	  survObj = makeSurvObj(dff))
Fmatrix <- makeIPMFmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE),fecObj = makeFecObj(dff))

largeMatrixCalc(Pmatrix, Fmatrix)

par(mfrow=c(1,2),pty="s")

plot(largeMatrixCalc(Pmatrix, Fmatrix)$stableDist, 
    ylab = "Stable stage distribution", 
	xlab = "Continuous (e.g. size) stage", 
	type = "l", col = "blue", lty = 1, ylim = c(0:1))

#Note that this will not always run - as tolerance levels 
# for convergence are set to be quite high
#plot(largeMatrixCalc(Pmatrix, Fmatrix)$reprodValue, 
#    ylab = "Reproductive value", 
#	xlab = "Continuous (e.g. size) stage", type = "l", col = "red", 
#    lty = 1, ylim = c(0:1))

}
