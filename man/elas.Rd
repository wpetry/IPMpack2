\name{elas}
\alias{elas}
\alias{sens}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimates matrix element sensitivities and elasticities.
}
\description{
  Estimates sensitivities and elasticities of each element of a discretized IPM.
}
\usage{
elas(A)
sens(A)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{A}{
    a matrix defining all transitions (growth, survival, fecundity) between sizes/stages.
}
}
\value{
  a matrix.
}
\references{
Caswell, 2001, Matrix Population Models: construction, analysis,
interpretation. 2nd ed. Sinauer. p206-256.

de Kroon, Plaisier, van Groenendael & Caswell. 1986. Elasticity: the relative contribution of demographic parameters to population growth rate. Ecology 67, p1427-1431.

de Kroon, van Groenendael & Ehrlen. 2000. Elasticities: a review of methods and model limitations. Ecology 81, p607-618.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}
\note{
Modified following code developed by Mark Rees & Dylan Childs
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{sens}}, \code{\link{sensParams}}
}
\examples{
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm=TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff),
survObj = makeSurvObj(dff))

Fmatrix <- makeIPMFmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), fecObj = makeFecObj(dff))

IPM <- Pmatrix + Fmatrix

par(mfrow = c(1, 2))

senst <- sens(IPM)
image(Pmatrix@meshpoints, Pmatrix@meshpoints,t(senst), 
	main = "Sensitivity", xlab = "Continuous (e.g. size) stage in t", 
		ylab = "Continuous (e.g. size) stage in t+1")

elast <- elas(IPM)
image(Pmatrix@meshpoints, Pmatrix@meshpoints, t(elast), main = "Elasticity", 
	xlab = "Continuous (e.g. size) stage in t", 
		ylab = "Continuous (e.g. size) stage in t+1")
}
