\name{generateData}
\alias{generateData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Generates random data in the form used by IPMpack.
}
\description{
  Simulates growth, survival and fecundity to create a dataframe of the form required by the functions and methods used in IPMpack. Demographic stage data is only continuous.
}
\usage{
generateData(nSamp=1000, type="simple")
}
\arguments{
	\item{nSamp}{
		number of samples desired in the base population, defaults to 1000
	}
	\item{type}{
		the kind of simulated data required. Supported values include "simple" (which includes only a continuous stage and a discretely varying covariate); "discrete" (which includes a discretely varying life stage); and "stochastic" (which includes stochastically varying covariates)
	}
	
	
}
%- maybe also 'usage' for other objects documented here.
%\details{
%
%}
\value{
  A dataframe with headings:
  	- "size": continuous variable, indicating current size.
  	- "sizeNext" continuous variable, indicating size in the next time step.
  	- "surv": boolean, indicating whether individual survived or not to the next time step.
  	- "covariate": discrete covariate (for type="simple").
  	- "covariateNext": discrete covariate in the next (for type="simple")
  time step.
    - "covariate1", "covariate2", "covariate3", ...: discrete or continuous covariates (for type="stochastic".
  
  	- "fec": continuous variable, indicating fecundity.
     - "stage": character vector, containing names of the discrete stages in that time-step, or "continuous" (for type="discrete").
     - "stageNext": character vector, containing names of the "discrete" stages in the following time-step, or "continuous" size value  (for type="discrete").
     - "number": number of individuals moving between stages. "number" = 1 for all movements out of the "continuous" stage; "number" > 1 for all movements out of "discrete" stages. This allows the user to not need to have an individual line for every movement between discrete stages (for type="discrete").
     
     
     }
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{simulateCarlina}}
}
\examples{
dff <- generateData(nSamp=2000, type="simple")
head(dff)

dff <- generateData(nSamp=2000, type="discrete")
head(dff)

dff <- generateData(nSamp=2000, type="stochastic")
head(dff)

}
