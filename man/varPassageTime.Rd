\name{varPassageTime}
\alias{varPassageTime}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimates variation in passage time.
}
\description{
Function to take a P matrix (either compound or not) and estimate variance in passage time to a chosen continuous stage value.
}
\usage{
varPassageTime(chosenSize, IPMmatrix)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{chosenSize}{
The continuous stage value of interest.
}
  \item{IPMmatrix}{
The Pmatrix (compound or not).
}
}
\details{
Note how variation in passage time for values exactly equal to the chosen size (targetSize) are low, because of way the conditionals are framed. Passage time from values > than targetSize should be ignored (space to the right of the red vertical line in example below), unless dealing with an organism that is able to display retrogression.
}
\value{
Numeric vector corresponding to variance in passage time from each of the meshpoints in the IPM (so both size, and if a compound matrix, size from different environments). 
}
\references{
Caswell, 2001. Matrix population models: analysis, construction and
interpretation. 2nd ed. Sinauer. p119.

Metcalf, Horvitz, Tuljapurkar & Clark. 2009. A time to grow and a time to die: a new way to analyze the dynamics of size, light, age and death of tropical trees. Ecology 90, p2766-2778.

For bias in this estimation where variance in growth is small relative to the size range: Zuidema, Jongejans, Chien, During & Schieving. 2010. Integral Projection Models for trees: a new parameterization method and a validation of model output. Journal of Ecology 98, p345-355.

For species with shrinkage: Salguero-Gomez & Casper. 2010. Keeping shrinkage in the demographic loop. Journal of Ecology 98, p313-323.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{passageTime}}, \code{\link{makeIPMPmatrix}} 
}
\examples{
# With continuous (e.g. size) stage
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize <- max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff))
targetSize <- 8
vP <- varPassageTime(targetSize, Pmatrix)

plot(Pmatrix@meshpoints, vP, type = "l", xlab="Continuous (e.g. Size) stage", 
	xlim=c(Pmatrix@meshpoints[1],targetSize),
	ylab = "Variance in passage time", col = "dark gray")
abline(v = targetSize, col = "red")

## not sure variance works with this....


}
