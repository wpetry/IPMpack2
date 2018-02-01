\name{growthObj-class}
\Rdversion{1.1}
\docType{class}
\alias{growthObj-class}


\title{Class "growthObj"}
\description{
A class object description
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("growthObj", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{fit}:}{Object of class \code{"lm"} ~~ }
    \item{\code{sd}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{growth}{\code{signature(size = "numeric", sizeNext = "numeric", cov = "numeric", growthObj = "growthObj")}: ... }
    \item{growthCum}{\code{signature(size = "numeric", sizeNext = "numeric",  cov = "numeric", growthObj = "growthObj")}: ... }
	 }
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
showClass("growthObj")
}
\keyword{classes}
