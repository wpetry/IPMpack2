\name{envMatrix-class}
\Rdversion{1.1}
\docType{class}
\alias{envMatrix-class}
\alias{stochPassageTime,numeric,IPMmatrix,envMatrix-method}

\title{Class "envMatrix"}
\description{
A class object description
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("envMatrix", data, nrow, ncol, byrow, dimnames, ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{.Data}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{nEnvClass}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Extends}{
Class \code{"\linkS4class{matrix}"}, from data part.
Class \code{"\linkS4class{array}"}, by class "matrix", distance 2.
Class \code{"\linkS4class{structure}"}, by class "matrix", distance 3.
Class \code{"\linkS4class{vector}"}, by class "matrix", distance 4, with explicit coerce.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
showClass("envMatrix")
}
\keyword{classes}
