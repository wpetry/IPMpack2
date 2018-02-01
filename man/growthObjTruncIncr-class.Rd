\name{growthObjTruncIncr-class}
\Rdversion{1.1}
\docType{class}
\alias{growthObjTruncIncr-class}
%\alias{growth,numeric,numeric,numeric,growthObjTruncIncr-method}
%\alias{growthCum,numeric,numeric,numeric,growthObjTruncIncr-method}

\title{Class \code{"growthObjTruncIncr"}}
\description{
A class object description
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("growthObjTruncIncr", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{fit}:}{Object of class \code{"list"} ~~ }
    \item{\code{varcov}:}{Object of class \code{"matrix"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{growth}{\code{signature(size = "numeric", sizeNext = "numeric", cov = "data.frame", growthObj = "growthObjTruncIncr")}: ... }
    \item{growthCum}{\code{signature(size = "numeric", sizeNext = "numeric", cov = "data.frame", growthObj = "growthObjTruncIncr")}: ... }
	 }
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
showClass("growthObjTruncIncr")
}
\keyword{classes}
