\name{discreteTrans-class}
\Rdversion{1.1}
\docType{class}
\alias{discreteTrans-class}

\title{Class \code{"discreteTrans"}}
\description{
Matrix defining transitions between discrete stages; slots define the names of stages, etc.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("discreteTrans", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{discreteTrans}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{meanToCont}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{sdToCont}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{moveToDiscrete}:}{Object of class \code{"glm"} ~~ }
  }
}
\section{Methods}{
No methods defined with class "discreteTrans" in the signature.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
showClass("discreteTrans")
}
\keyword{classes}
