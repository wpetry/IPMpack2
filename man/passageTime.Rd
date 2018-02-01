\name{passageTime}
\alias{passageTime}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Defines passage time to a chosen continuous stage.
}
\description{
  Estimates the time in units of the chosen time-steps (see convertIncrement()) that it will take to reach a chosen continuous (e.g. size) stage for the first time conditional on surviving from each of the meshpoints of the IPM; currently not defined for matrices with discrete as well as continuous stage categories. 
}
\usage{
passageTime(chosenSize, IPMmatrix)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{chosenSize}{
    numeric, the target size.
}
  \item{IPMmatrix}{
    an IPMmatrix object describing growth-survival transitions (a P matrix).
}
}
\details{
  Passage time for values exactly equal to the chosen size (targetSize) are one year, because of way the conditionals are framed. Values slightly less than the target size may on average take longer due to variance in growth, mortality, leading to discontinuities in the pattern of passage time over age. Passage time from values > than targetSize should be ignored (space to the right of the red vertical line in example below), unless dealing with an organism that is able to display retrogression. Use stochPassageTime for compound matrices. 
}
\value{
  A vector of times in the units of the chosen time-steps corresponding to each of the IPM meshpoints.
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
\code{\link{meanLifeExpect}}, ~~~
}
\examples{
# With a single continuous state variable (e.g. size)
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff), correction="constant")
targetSize <- 8
passage <- passageTime(targetSize, Pmatrix)

plot(Pmatrix@meshpoints, passage, ylab = "Passage time", 
 xlab = "Continuous (e.g. size) stage", 
	type = "l", col = "dark gray", ylim = c(0, max(passage)), 
	xlim=c(Pmatrix@meshpoints[1],targetSize+1))
abline(v = targetSize, col="red")

}
