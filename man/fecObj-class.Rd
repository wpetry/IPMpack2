\name{fecObj-class}
\Rdversion{1.1}
\docType{class}
\alias{fecObj-class}

\title{Class "fecObj"}
\description{
A class object description
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("fecObj", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{

   "fecConstants"      
"offspringSplitter"  "meanOffspringSize" "sdOffspringSize"  "fecByDiscrete"     "Transform"
    
    \item{\code{fitFec}:}{Object of class \code{"list"} ~~ }
    \item{\code{fecConstants}:}{Object of class \code{"data.frame"} ~~ }
    \item{\code{fecNames}:}{Object of class \code{"character"} ~~ }
    \item{\code{offspringSplitter}:}{Object of class \code{"data.frame"} ~~ }
  	 \item{\code{offspringRel}:}{Object of class \code{"lm"} ~~ }
    \item{\code{vitalRatesPerOffspringType}:}{Object of class \code{"data.frame"} ~~ }   
    \item{\code{sdOffspringSize}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{fecByDiscrete}:}{Object of class \code{"data.frame"} ~~ }
    \item{\code{Transform}:}{Object of class \code{"character"} ~~ }
   
  }
}
\section{Methods}{
No methods defined with class "fecObj" in the signature.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
showClass("fecObj")
}
\keyword{classes}
