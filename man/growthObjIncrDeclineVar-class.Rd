\name{growthObjIncrDeclineVar-class}
\Rdversion{1.1}
\docType{class}
\alias{growthObjIncrDeclineVar-class}
%\alias{growth,numeric,numeric,numeric,growthObjIncrDeclineVar-method}

\title{Class "growthObjIncrDeclineVar"}
\description{
A class object description
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("growthObjIncrDeclineVar", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{fit}:}{Object of class \code{"list"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{growth}{\code{signature(size = "numeric", sizeNext = "numeric", cov = "data.frame", growthObj = "growthObjIncrDeclineVar")}: ... }
   \item{growthCum}{\code{signature(size = "numeric", sizeNext = "numeric", h = "numeric", cov = "data.frame", growthObj = "growthObjIncrDeclineVar")}: ... }
	 }
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
showClass("growthObjIncrDeclineVar")
}
\keyword{classes}
