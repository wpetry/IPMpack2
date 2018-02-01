\name{discreteTransInteger-class}
\docType{class}
\alias{discreteTransInteger-class}

\title{Class \code{"discreteTransInteger"}}
\description{
Matrix defining transitions between discrete stages; slots define the names of stages, etc.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("discreteTransInteger", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{discreteTrans}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{meanToCont}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{thetaToCont}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{moveToDiscrete}:}{Object of class \code{"glm"} ~~ }
    \item{\code{distToCont}:}{Object of class \code{"character"} ~~ }
  }
}
\section{Methods}{
No methods defined with class "discreteTrans" in the signature.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
showClass("discreteTransInteger")
}
\keyword{classes}
