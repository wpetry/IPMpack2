\name{growthObjLogIncr-class}
\Rdversion{1.1}
\docType{class}
\alias{growthObjLogIncr-class}
%\alias{growth,numeric,numeric,numeric,growthObjLogIncr-method}
%\alias{growthCum,numeric,numeric,numeric,growthObjLogIncr-method}

\title{Class \code{"growthObjLogIncr"}}
\description{
A class object description
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("growthObjLogIncr", ...)}.
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
    \item{growth}{\code{signature(size = "numeric", sizeNext = "numeric", cov = "data.frame", growthObj = "growthObjLogIncr")}: ... }
    \item{growthCum}{\code{signature(size = "numeric", sizeNext = "numeric", cov = "data.frame", growthObj = "growthObjLogIncr")}: ... }
	 }
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
showClass("growthObjLogIncr")
}
\keyword{classes}
