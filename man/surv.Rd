\name{surv}
\alias{surv}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Survival
}
\description{
Predicts the probability of surviving at a given size given a survival object.
}
\usage{
surv(size, cov, survObj)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{size}{
    a numeric vector of current sizes.
}
  \item{cov}{
    a data-frame with one row containing all covariates.
}
  \item{survObj}{
    a survObj.
}
}
\value{
  a vector of length size with values between 0 and 1.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{growth}}, \code{\link{growSurv}}, \code{\link{surv-methods}}
}
\examples{
dff <- generateData()
sv1 <- makeSurvObj(dff)
surv(1:50, data.frame(cov=1), sv1)
}
