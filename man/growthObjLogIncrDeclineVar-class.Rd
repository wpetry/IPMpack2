\name{growthObjLogIncrDeclineVar-class}
\Rdversion{1.1}
\docType{class}
\alias{growthObjLogIncrDeclineVar-class}

\title{Class \code{"growthObjLogIncrDeclineVar"}}
\description{
A class object description
%%  ~~ A concise (1-5 lines) description of what the class is. ~~
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("growthObjLogIncrDeclineVar", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{fit}:}{Object of class \code{"list"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{growth}{\code{signature(size = "numeric", sizeNext = "numeric", cov = "data.frame", growthObj = "growthObjLogIncrDeclineVar")}: ... }
    \item{growthCum}{\code{signature(size = "numeric", sizeNext = "numeric", h = "numeric", cov = "data.frame", growthObj = "growthObjLogIncrDeclineVar")}: ... }
	 }
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
showClass("growthObjLogIncrDeclineVar")
}
\keyword{classes}
