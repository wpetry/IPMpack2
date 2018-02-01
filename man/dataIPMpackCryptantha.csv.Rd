\name{dataIPMpackCryptantha}
\alias{dataIPMpackCryptantha}
\docType{data}
\title{
Cryptantha Perennial Dataset with Covariates
}
\description{
Demographic data of Cryptantha flava in the "Redfleet State Park", UT, USA. Life cycle, experimental design and data are described in Salguero-Gomez et al (2012). Data contains a subset of individuals from 2004 to 2010. Full dataset can be obtained upon request to the authors (salguero@demogr.mpg.de and bcasper@sas.upenn.edu).
}
\usage{data(dataIPMpackCryptantha)}
\format{
  The format is:
 chr "dataIPMpackCryptantha"
}
\details{
Data-frame with headings:

	- ID: unique plant id (this file contains only a subset of all individuals)
	
	- treatment: the full experimental design contain to droughts (in 1998 and 1999) but this subset contains only info on the control permanent plots. See Lucas et al J Ecol 2008
	
	- site: spatial replication site
	
	- plot: plot number
	
	- quadrat: quadrat number inside of plot
	
	- x: x coordinate (cm) inside of the quadrat
	
	- y: y coordinate (cm) inside of the quadrat
	
	- shrub: shrub species within the zone of influence of the individual (At = Artemisia tridentata; Cn = Chrysothamnus nauseosus)
	
	- compass: compass direction of the line connecting the centroid of the shrub and the individual of Cryptantha flava
	
	- distance: distance (in cm) of the individual of Cryptantha flava to the shrub. Negative distance imply the individual is "inside" the shrub. Zero implies the individual is at the edge of the shrub's canopy.
	
	- year: transition from t to t+1 (this subset contains only data for 2004-2010)
	
	- prec: annual precipitation (in cm) from June of year t-1 to May of year t
	
	- age: age of individual (in years) in year t. Individuals of unknown age are assigned to 999
	
	- size: total number of rosettes (vegetative and flowering) of the individual in year t
	
	- fec0: probability of reproduction (0: vegetative, 1: flowering; NA: individual not alive) in year t
	
	- fec1: number of flowering rosettes in year t (NA: fec0 = 0 or NA)
		
	- surv: survival (0 = dead, 1= alive, NAs if not yet recruited)
	
	- precNext: annual precipitation (in cm) from June of year t to May of year t+1
	
	- ageNext: age of individual (in years) in year t+1. Individuals of unknown age are assigned to 999
	
	- sizeNext: total number of rosettes (vegetative and flowering) of the individual in year t+1
	
}

\references{
Salguero-Gomez R, Siewert W, Casper B & Tielboerger K. Oct 2012. A demographic approach to study effects of climate change in desert plants. Philosophical Transactions of the Royal Society. Series B - Biological Sciences x, pxxx-xxx

Lucas R, Forseth I, Casper B. 2008. Using rainout shelters to evaluate climate change effects on the demography of Cryptantha flava. Journal of Ecology 96, p514-522

}
\author{
Rob Salguero-Gomez & Brenda B Casper
}

\examples{
data(dataIPMpackCryptantha)
print(head(dataIPMpackCryptantha))

}
\keyword{datasets}


