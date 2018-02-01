\name{invLogit}
\alias{invLogit}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Implements a logistic transform.
}
\description{
Provided a vector or numeric changes it into a vector on 0-1 using the invLogit transform.
}
\usage{
invLogit(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{x}{
vector of numbers for which the transform is required.
}
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
x <- rnorm(100)
plot(sort(x), invLogit(sort(x)), type = "l", xlab = "State x", ylab = 
"Transformed state x", col = "dark gray")
}
