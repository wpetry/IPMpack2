\name{IPMmatrix-class}
\Rdversion{1.1}
\docType{class}
\alias{IPMmatrix-class}

\title{Class \code{"IPMmatrix"}}
\description{
Class IPMmatrix contains a matrix describing transitions between sizes or discrete stages; other slots described integration resolution, etc. 
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("IPMmatrix", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{.Data}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{nDiscrete}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{nEnvClass}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{nBigMatrix}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{meshpoints}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{env.index}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{names.discrete}:}{Object of class \code{"character"} ~~ }
  }
}
\section{Extends}{
Class \code{"\linkS4class{matrix}"}, from data part.
Class \code{"\linkS4class{array}"}, by class "matrix", distance 2.
Class \code{"\linkS4class{structure}"}, by class "matrix", distance 3.
Class \code{"\linkS4class{vector}"}, by class "matrix", distance 4, with explicit coerce.
}
\section{Methods}{
No methods defined with class "IPMmatrix" in the signature.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
showClass("IPMmatrix")
}
\keyword{classes}

