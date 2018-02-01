\name{dataIPMpackHypericumCov}
\alias{dataIPMpackHypericumCov}
\docType{data}
\title{
Hypericum Perennial Dataset with covariates
}
\description{
Demographic data of Hypericum cumulicola in "Florida rosemary scrub at" Archbold Biological Station (FL, USA). Life cycle, experimental design and data are described in Quintana-Ascencio & Menges (2003). Data contains a subset of individuals from population "bald 1" and annual period "1994-1999". Full dataset can be obtained upon request to the authors (pedro.quintana-ascencio@ucf.edu).
}
\usage{data(dataIPMpackHypericumCov)}
\format{
  The format is:
 chr "dataIPMpackHypericumCov"
}
\details{
data-frame with headings:

	- id: unique plant id (this file contains only a subset of all individuals)
	
	- bald: population (this subset contains only one population)
	
	- year: transition from t to t+1 (this subset contains only data for 1994-1999)
		
	- fireYear: year when the bald was last burned
	
	- TSLF: time since last fire
	
	- size: length of longest stem in individual (cm) in time t
	
	- ontogeny: recruits vs established individuals in time t (1 = individual was recruited in time t, 0 = already established individual prior to time t, NA = individual not yet recruited in time t)
	
	- fec0: probability of reproduction (0= no flowering, 1 = individual was flowering in time t)
	
	- fec1: number of fruits per plant (NA if fec0 = 0)
	
	- fec2: number of seeds per fruit (NA if fec0 = 0)
	
	- fec3: probability that seeds produced in year t will germinate that year
	
	- fec4: probability of seedling survival prior to the next census
	
	- goSB: probability that seeds produced in natural year t will go into the seedbank
	
	- staySB: probability that seeds will remain in the seedbank from year t to t+1
	
	- cov: annual precipitation in year t (Jan-Dec; mm)
	
	- surv: survival (0 = dead, 1= alive, NAs if not yet recruited)
	
	- sizeNext: length of longest stem in individual (cm) in time t+1
	
	- ontogenyNext: recruits vs established individuals in time t+1 (1 = individual was recruited in time t+1, 0 = already established individual prior to time t+1, NA = individual not yet recruited or dead in t+1)
	
	- covNext: annual precipitation in natural year t+1 (Jan-Dec; mm)
}

\references{
Quintana-Ascencio, Menges & Weekley. 2003. A fire-explicit population viability analyses of Hypericum cumulicola in Florida Rosemary scrub. Conservation Biology 17, p433-449.

}
\author{
Pedro Quintana-Ascencio & Eric Menges
}

\examples{
data(dataIPMpackHypericumCov)
print(head(dataIPMpackHypericumCov))


}
\keyword{datasets}

