\name{simulateCarlina}
\alias{simulateCarlina}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Generates random data in the form used by IPMpack based on the population dynamics of Carlina vulgaris
}
\description{
  Simulates growth, survival and fecundity and density dependent seedling establishment to create a dataframe of the form required by the functions and methods used in IPMpack. Demographic stage data is only continuous. Note that the number or rows corresponding to each year of the data-frame does not inform about population size, since rows exist that correspond to offspring appearing in the subsequent year. 
}
\usage{
simulateCarlina(nSamp=200,nYrs=1000,nSampleYrs=15,
		m0=-1.37,ms=0.59,
		b0=-12.05,bs=3.64,
		A=-1,B=2,
		ag=1.14,bg=0.74,sig=0.29,
		mean.kids=3.16,sd.kids=0.5,
		meanYear=c(0,0,0),
		matVarYear=matrix(c(1.03,0,0,0,0.037,0.041,0,0.041,0.075),3,3),
		varA=0,varB=0,densDep=TRUE,
		maxPerYr=1000,maxStoreSeedlingsPerYr=200,
		sizes = c())
}
\arguments{
	\item{nSamp}{
	number of samples desired in the base population, defaults to 2000
	}
	\item{nYrs}{
	number of years in the simulation, defaults to 1000
	}
	\item{nSampleYrs}{
	number of years sampled, defaults to 15
	}
	\item{m0}{
intercept survival
	}
	\item{ms}{
	slope survival
	}
\item{b0}{
	intercept flowering
	}
\item{bs}{
	slope flowering
	}
\item{A}{
	intercept reproductive allometry seed production
	}
\item{B}{
	slope reproductive allometry seed production
	}
\item{ag}{
	intercept growth
	}
\item{bg}{
	slope growth
	}
\item{sig}{
	variance growth
	}
\item{mean.kids}{
mean kid size
	}
\item{sd.kids}{
variance kid size
	}
\item{meanYear}{
mean year effects
	}
\item{matVarYear}{
var-covariance in year effects for survival, growth and offspring size
	}
\item{varA}{
variance in seed intercept year effects - defaults to zero 
    }
\item{varB}{
variance in seed slope year effects - defaults to zero 
    }
\item{densDep}{
density dependence in seedling establishment or not? 
	}
\item{maxPerYr}{
total number of individuals for which measurements will be transferred to the subsequent year (population will be resampled with replacement to obtain a population of this size)
	}
\item{maxStoreSeedlingsPerYr}{
max number of seedling recruits for which data will be stored in every year 
}
\item{sizes}{
starting sizes in the population (optional)
	}


}
%- maybe also 'usage' for other objects documented here.
\value{
 
A list including: 
  dataf:
  A dataframe with headings:
  	- "size": continuous variable, indicating current size.
  	- "sizeNext" continuous variable, indicating size in the next time step.
  	- "surv": boolean, indicating whether individual survived or not to the next time step.
  	- "covariate": discrete covariate.
  	- "covariateNext": discrete covariate in the next
  time step.
  	- "fec": continuous variable, indicating fecundity.
	- nSeedlings: number seedlings corresponding to that year
	- m.year: intercept of mortality for that year
	- cg.year: intercept of growth for that year
	- b.year: intercept of offspring size for that year
	- offspringNext: where the row corresponds to offspring, this takes the value offspringNexxt
	- year: year of the sample
	
 list.par: 
 	- a list of all the other parameters
  matVarYear
    - variance covariance matrix for demographic functions
  trueGrow - stochastic growth rate, log lambda s
  meantrueGrow - mean of lambda t
  vartrueGrow - variance of log lambda t
     		
		
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{generateData}}
}
\examples{
#Uncomment to run
#dff <- simulateCarlina(nSamp=1000)
#head(dff$dataf)

}
