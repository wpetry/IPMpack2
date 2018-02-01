\name{growthObjIncr-class}
\Rdversion{1.1}
\docType{class}
\alias{growthObjIncr-class}
%\alias{growth,numeric,numeric,numeric,growthObjIncr-method}

\title{Class "growthObjIncr"}
\description{
A class object description
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("growthObjIncr", ...)}.
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
    \item{growth}{\code{signature(size = "numeric", sizeNext = "numeric", cov = "data.frame", growthObj = "growthObjIncr")}: ... }
   \item{growthCum}{\code{signature(size = "numeric", sizeNext = "numeric", h = "numeric", cov = "data.frame", growthObj = "growthObjIncr")}: ... }
	 }
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
showClass("growthObjIncr")
}
\keyword{classes}
