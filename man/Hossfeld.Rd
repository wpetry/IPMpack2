\name{Hossfeld}
\alias{Hossfeld}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Creates a Hossfeld function defining growth.
}
\description{
Functional form describing growth according to a Hossfeld function.
}
\usage{
Hossfeld(size, par)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{size}{
    vector of sizes.
}
  \item{par}{
    vector of length 3.
}
}
\references{
Zuidema, Jongejans, Chien, During & Schieving. 2010. Integral projection models for trees: a new parameterization method and a validation of model output. Journal of Ecology 98, p345-355.

Rivas, Gonzalez, Gonzalez & von Gadow. 2004. Compatible height and site index models for five pine species in El Salto, Durango (Mexico). Forest Ecology and Management 201, p145-160.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
dff <- generateData()
sizeRange <- c(1:20)
sizeInit <- 1
Hossfeld(sizeRange, rep(1, 3))
plot(Hossfeld(1:10, rep(1, 3)), type = "l", 
    ylab = "Predicted increment from t to t+1", 
	xlab = "Continuous (size) stage in time t", col = "dark gray")
}
