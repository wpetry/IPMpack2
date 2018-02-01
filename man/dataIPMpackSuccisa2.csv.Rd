\name{dataIPMpackSuccisa2}
\alias{dataIPMpackSuccisa2}
\docType{data}
\title{
Succisa pratensis Dataset
}
\description{
Subset of multiple years of demographic data of Succisa pratensis collected at the "Bennekomse Meent" site in the Netherlands. Details are described in Jongejans and de Kroon (2005). More information: E.Jongejans@science.ru.nl
}
\usage{data(dataIPMpackSuccisa2)}
\format{
  The format is:
 chr "dataIPMpackSuccisa2"
}
\details{
data-frame with headings:

	- size: log of the sum of the products of the number of leaves and the maximum leaf length for rosette and stem leaves at time t
	
	- sizeNext: log of the sum of the products of the number of leaves and the maximum leaf length for rosette and stem leaves at time t+1

	- stage: stage of the individual ('continuous' means the plant has a size; NA = not recruited yet) at time t

	- stageNext: stage of the individual ('continuous' means the plant has a size; 'dead' = dead) at time t+1
	
	- surv: survival (0 = dead, 1= alive, NAs if not yet recruited)
	
	- offspringNext: type of new recruit ('sexual' = seedling, 'clonal' = side-rosette, NA = not a recruit) at time t+1
	
	- fec1Bolt: whether stems are produced (0 = no stems, 1 = at least 1  stem, NA = not recruited yet) at time t
	
	- fec2Stem: number of stems when stems are produced (NA when fec1Bolt = NA or 0) at time t 
	
	- fec3Head: mean number of flower heads per stem when stems are produced (NA when fec1Bolt = NA or 0) at time t
	
	- fec1BoltNext: whether stems are produced (0 = no stems, 1 = at least 1  stem, NA = not recruited yet) at time t+1
	
	- fec2StemNext: number of stems when stems are produced (NA when fec1BoltNext = NA or 0) at time t+1 
	
	- fec3HeadNext: mean number of flower heads per stem when stems are produced (NA when fec1BoltNext = NA or 0) at time t+1
	
	- cloning: whether clonal offspring (side-rosettes) are produced by this individual (NA for plants that were not recruited yet at time t)
	
	- clonesNext: number of clonal offspring (side-rosettes) produced when at least on side-rosette is produced (NA when 'cloning' = 0 or NA)
	
}

\references{
Jongejans, E. and de Kroon, H. (2005) Space versus time variation in the population dynamics of three co-occurring perennial herbs. Journal of Ecology, 93, 681-692.

}
\author{
Eelke Jongejans & Hans de Kroon
}

\examples{
data(dataIPMpackSuccisa2)
print(head(dataIPMpackSuccisa2))

Sp <- dataIPMpackSuccisa2

fo<-makeFecObj(Sp, Formula = list(fec1Bolt ~ size+size2, 
    fec2Stem ~ size, fec3Head ~ size), 
        Family = c("binomial","poisson","poisson"), 
            Transform=c("none","-1","none"), 
            fecConstants = data.frame(seedsPerHead=50,
            seedlingEstablishmentRate= 0.02))

co<-makeClonalObj(Sp, Formula = list(cloning ~ size, clonesNext ~ size), 
    Family = c("binomial","poisson"), Transform=c("none","-1"), 
       offspringSizeExplanatoryVariables = "size")


}
\keyword{datasets}

