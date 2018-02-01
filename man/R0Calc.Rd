\name{R0Calc}
\alias{R0Calc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculates net reproductive rate (R0) from an IPM.
}
\description{
Estimates lifetime reproductive success from a full IPM, including survival, growth and fecundity. 
}
\usage{
R0Calc(Pmatrix, Fmatrix)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Pmatrix}{
    a matrix (not necessarily of class IPMmatrix).
}
  \item{Fmatrix}{
    a matrix (not necessarily of class IPMmatrix).
}
}
\value{
  numeric
}
\references{
Caswell, 2001. Matrix population models: analysis, construction and
interpretation. 2nd ed. Sinauer. p126.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeIPMPmatrix}},\code{\link{makeIPMFmatrix}}  
}
\examples{
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff), correction="constant")
Fmatrix <- makeIPMFmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), 
fecObj = makeFecObj(dff,Formula=fec~size), correction="constant")
R0Calc(Pmatrix, Fmatrix)
}
