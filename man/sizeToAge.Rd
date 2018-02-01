\name{sizeToAge}
\alias{sizeToAge}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimates size/stage to age relationships
}
\description{
  Uses a P matrix and a starting continuous stage value to estimate time to a range of target
sizes, from which a size to age pattern can be determined. 
}
\usage{
sizeToAge(Pmatrix, startingSize, targetSize)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Pmatrix}{
    object of class IPMmatrix describing growth survival transitions. 
}
  \item{startingSize}{
    numeric, size at age 1, or size from which age-size relationship is desired.
}
  \item{targetSize}{
    vector of size(s) for which first passage time is required.
}
}
\value{
  \item{timeInYears}{Time taken to reach target sizes in unit of the time step of the model.}
  \item{targetSize}{Vector of target sizes.}
  \item{startingSize}{Size at age 1.}
}
\references{
Caswell, 2001. Matrix population models: analysis, construction and
interpretation. 2nd ed. Sinauer. p110-132.

Metcalf, Horvitz, Tuljapurkar & Clark. 2009 A time to grow and a time to die: a new way to analyze the dynamics of size, light, age and death of tropical trees. Ecology 90, p2766-2778.

Cochran & Ellner. 1992. Simple methods for calculating age-based life history parameters for stage-structured populations. Ecological Monographs 62, p345-364.

See for bias in this estimation where variance in growth
is small relative to the size range: Zuidema, Jongejans, Chien, During & Schieving. 2010. Integral Projection Models for trees: a new parameterization method and a validation of model output. Journal of Ecology 98, p345-355.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{passageTime}}
}
\examples{
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff),
survObj = makeSurvObj(dff))
targetSize <- 8
startingSize <- 0
sizeToAge(Pmatrix, startingSize, targetSize)
}
