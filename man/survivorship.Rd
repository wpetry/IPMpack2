\name{survivorship}
\alias{survivorship}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Estimates survivorship between two time censuses.
}
\description{
  Calculates the fraction of the cohort surviving across age for a chosen starting continuous stage value.
}
\usage{
survivorship(IPMmatrix, loc, maxAge)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{IPMmatrix}{
    an IPMmatrix object describing growth and survival transitions across stage (e.g. size) and environment.
  }  \item{loc}{
    a starting size location in the IPM matrix for age 1 (i.e., either the index
    of the desired size in the meshpoints, or, if there are discrete stages, the index 
    + the number of discrete stages; if this is not an integer, then it will be assumed that the rounded version is desired)
  }
  \item{maxAge}{
    the maximum age up to which survivorship is desired for or possible.
  }
}
\value{
 \item{surv.curv}{vector of length maxAge providing survivorship at each
 age from 1 to maxAge.}
 \item{stageAgeSurv}{matrix of dimensions nBigMatrix*maxAge providing
   the population structure at every age for a cohort starting with an
   individual of size size1.
 }
 \item{mortality}{vector of length maxAge providing mortality at each
 age from 1 to maxAge.}
}
\references{
Tuljapurkar & Horvitz. 2006. From stage to age in variable
environments. Life expectancy and survivorship. Ecology 87, p1497-1509.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
# For only continuous stages (e.g. size)
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff))
su <- survivorship(Pmatrix, 1, 300)
plot(su$surv.curv, type = "l", col = "dark gray", ylab = "survivorship", 
xlab= "Continuous (e.g. size) stage", ylim = c(0,1))

# For continuous (e.g. size) and discrete (e.g. seedbank) stages
Pmatrix <- makeCompoundPmatrix(minSize = min(dff$size,na.rm = TRUE),
maxSize = max(dff$size,na.rm = TRUE), envMatrix = makeEnvObj(dff),
growObj = makeGrowthObj(dff, Formula = sizeNext~size+size2+covariate),
survObj = makeSurvObj(dff, Formula = surv~size+size2+covariate), 
discreteTrans = 1)
su <- survivorship(Pmatrix,1,300)
}
