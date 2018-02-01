\name{predictFutureDistribution}
\alias{predictFutureDistribution}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Predicts continuous (e.g. size) stage distribution in the future giving current population's stage distribution.
}
\description{
  Function to project a population forwards using an IPM and a starting
  environment. The IPM may be structured by continuous (e.g. size) stage alone, or by continuous stage and environment. 
}
\usage{
predictFutureDistribution(startingSizes, IPM, n.time.steps, startingEnv = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{startingSizes}{
    vector containing the sizes of the desired starting population.
}
  \item{IPM}{
    an IPMmatrix object (P matrix if only interested in survival projections, P matrix+ F matrix otherwise).
}
  \item{n.time.steps}{
    a numeric defining the number of time steps for which projection is required.
}
  \item{startingEnv}{
    vector defining the desired starting environment, of length one or length startingSizes; ignored if no environmental states are provided; otherwise if the length is less than startingSizes assumes all individuals start in the same environment, given by startingEnv[1].
}
}
\details{
Currently this does not accept IPMs with discrete stages (e.g. seedbank).
}
\value{
 \item{n.new.dist0}{starting frequency distribution along meshpoints in IPMmatrix.}
 \item{n.new.dist}{final frequency distribution.}
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{

# Define starting population of interest
startPop <- rnorm(1000,2,1)

# Build T and F matrix
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = 1.1*min(dff$size, na.rm = TRUE),
maxSize = 1.1*max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff),
survObj = makeSurvObj(dff), correction = "constant")
Fmatrix <- makeIPMFmatrix(minSize = 1.1*min(dff$size, na.rm = TRUE),
maxSize = 1.1*max(dff$size, na.rm = TRUE), 
fecObj = makeFecObj(dff, fecConstants = data.frame(est=0.7), Transform="log"), 
correction="constant")

# Make an IPMmatrix object containing P matrix + F matrix 
# by replacing the P matrix
IPM <- Pmatrix
IPM@.Data <- Pmatrix + Fmatrix

# Project population five steps
a5 <- predictFutureDistribution(startingSizes = startPop, IPM = IPM,
n.time.steps = 5, startingEnv = 1)
}
