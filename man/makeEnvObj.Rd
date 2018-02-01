\name{makeEnvObj}
\alias{makeEnvObj}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Builds environmental transition objects.
}
\description{
  Function that takes vectors of discrete environmental states (e.g. shaded vs open canopy habitats) at time t and time t+1 and builds a transition (habitat) matrix from these.
}
\usage{
makeEnvObj(dataf)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataf}{a dataframe with columns `covariate'
    and `covariatel' indicating environmental covariate values at times t, and at t+1, respectively; these must take values of sequential integers, starting at`1'.
    }
}
\value{
  an object of class envMatrix.
}
\references{
Horvitz & Schemske. 1995. Spatiotemporal variation in demographic transitions of a tropical understory herb. Projection matrix analysis. Ecological Monographs 65, p155-192.

Horvitz, Ehrlen & Matlaga. 2010. Context-dependent pollinator limitation in stochastic environments: can increased seed set overpower cost of reproduction in an understorey herb? Journal of Ecology 98, p268-278.

}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeFecObj}}, \code{\link{makeSurvObj}}, 
\code{\link{makeIPMPmatrix}}, \code{\link{makeIPMFmatrix}}

}
\examples{
dff <- generateData()
env <- makeEnvObj(dff)
env
}
