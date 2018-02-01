\name{sensParams}
\alias{sensParams}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Estimates sensitivity and elasticity of lambda (or R0, or Life
  expectancy of a chosen bin) to parameters underlying an IPM.
}
\description{
  Uses perturbation to estimate the sensitivity and elasticity of
  all the parameters underlying an IPM. 
}
\usage{
sensParams(growObj, survObj, fecObj=NULL, clonalObj=NULL, 
	nBigMatrix, minSize, maxSize,  
	chosenCov = data.frame(covariate = 1), discreteTrans = 1, 
	integrateType = "midpoint", correction = "none", preCensusFec = TRUE, 	
	postCensusSurvObjFec = NULL, postCensusGrowObjFec = NULL,  
	preCensusClonal = TRUE, postCensusSurvObjClonal = NULL, 
	postCensusGrowObjClonal = NULL, delta = 1e-04, 
	response="lambda", chosenBin=1)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{growObj}{
    a growth object.
  }
  \item{survObj}{
    a survival object.
  }
  \item{fecObj}{
    a fecundity object (not necessary for life
    expectancy analysis).
  }
  \item{clonalObj}{
    a clonality object (not necessary for life
    expectancy analysis).
  }
  \item{nBigMatrix}{
    numeric, number of bins of size used in the IPM matrix.
  }
  \item{minSize}{
    numeric, minimum size used for meshpoints of the IPM matrix.
  }
  \item{maxSize}{
    numeric, maximum size used for meshpoints of the IPM matrix.
  }
  \item{chosenCov}{
level or value of the covariate(s) at which sensitivity estimation is desired
  }
  \item{discreteTrans}{
	matrix of discrete transitions; or 1 if there is none
  }
  \item{integrateType}{
    integration type, defaults to "midpoint" (which uses probability density
    function); other option is "cumul" (which uses the cumulative density function)
  }
  \item{correction}{
 correction type, defaults to \code{none}. The first option is \code{constant} which will multiply every column of the IPM by a constant sufficient to adjust values to those predicted for total fertility at that size. The second option is \code{discretizeExtremes} which will place all transitions to sizes smaller than \code{minSize} into the smallest bin, and transitions to sizes larger than \code{maxSize} into the largest bin.  }
  \item{preCensusFec}{
    logical (TRUE or FALSE), indicating whether the fecundity object 
    represents an interval between pre-breeding or a post-breeding censusses.
    Defaults to TRUE (pre-breeding census), meaning that all reproduction 
    and offspring rates required for the F matrix are embedded in fecObj. 
    Alternatively, an F matrix based on post-breeding census (preCensusFec=FALSE)
    uses postCensusSurvObjFec and postCensusGrowObjFec, to cover the survival and growth
    of the parents until the reproduction event. (not necessary for life
    expectancy analysis)}
  \item{postCensusSurvObjFec}{
    survival object representing the survival of the parents until the reproduction event. 
    If not specified (and preCensusFec = FALSE) it is assumed that all parents survive until the reproduction event. (not necessary for life expectancy analysis)
  }
  \item{postCensusGrowObjFec}{
    growth object representing the growth of surviving parents until the reproduction event. If not specified (and preCensusFec = FALSE) it is assumed that the parents do not grow until the reproduction event. (not necessary for life expectancy analysis)
  }
  \item{preCensusClonal}{
    logical (TRUE or FALSE), indicating whether the clonality object 
    represents an interval between pre-breeding or a post-'breeding' censusses.
    Defaults to TRUE (pre-'breeding' census), meaning that all clonal propagation 
    and offspring rates required for the C matrix are embedded in clonalObj. 
    Alternatively, an C matrix based on post-'breeding' census (preCensusClonal=FALSE)
    uses postCensusSurvObjClonal and postCensusGrowObjClonal, to cover the survival and growth
    of the parents until the clonal propagation event. (not necessary for life
    expectancy analysis)
  }
  \item{postCensusSurvObjClonal}{
    survival object representing the survival of the parents until the clonal propagation event. 
    If not specified (and preCensusClonal = FALSE) it is assumed that all parents survive until 
    the clonal propagation event. (not necessary for life expectancy analysis)
  }
  \item{postCensusGrowObjClonal}{
    growth object representing the growth of surviving parents until the clonal propagation event. 
    If not specified (and preCensusClonal = FALSE) it is assumed that the parents do not grow until 
    the clonal propagation event. (not necessary for life expectancy analysis)
  }
  \item{delta}{
    size of the perturbation desired
  }
  \item{response}{
	 whether lambda, R0 or life expectancy of a desired bin (lifeExpect with chosenBin) is required 
  }
  \item{chosenBin}{
    for analysis of life expectancy, which bin in the IPM Life
    expectancy should be compared for
  }
  
  }
\value{
  \item{sens }{a vector of sensitivities of lambda or other variable with names
    corresponding to parameters.}
  \item{elas }{a vector of elasticities to lambda or other variable with names
    corresponding to parameters.}
}
\references{
Rees and Rose. 2002. Evolution of flowering strategies in Oenothera
glazioviana: an integral projection model approach. Proceedings of the Royal Society London Seres B 269, p1509-1515.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}
\note{
Modified following code developed by Rees & Rose 2002 (above).  
}
\details{
  The values returned by sensParam are calculated by first calculating
  lambda for the chosen IPM; then modifying the focal parameter c by a
  very small amount, c.new=c*(1+delta) (the default for delta =1e-4, but users may specify the value that they want). The function then rebuilds the T and F matrices, and re-calculates lambda. Sensitivity is calculated as: 
  
  sens = df(x)/dx = (lam.new-lam)/(c*delta)
  
  i.e., the function estimates the degree to which a small change in the parameter results in a small change in lambda; and elasticity is calculated as: 
  
  elas = sens*c/lam = (lam.new-lam)/(lam*delta)
  
  which corresponds to the proportional change in lambda as an outcome
  of the proportional change in the parameter; analagous calculations
  are used for R0 and life expectancy. 

	NOTE: in previous versions of IPMpack (pre 2.0), the output of this function was mis-aligned. 
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{sens}}, \code{\link{elas}}
}
\examples{
dff <- generateData()

#lambda
res <- sensParams(growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff), fecObj = makeFecObj(dff, Transform="log"), 
nBigMatrix = 50, minSize = min(dff$size, na.rm=TRUE), 
maxSize = max(dff$size, na.rm = TRUE))

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(res$sens, 
main = expression("Parameter sensitivity of population growth rate "* lambda), 
las = 2, cex.names = 0.5) 
barplot(res$elas, 
main = expression("Parameter elasticity of population growth rate "* lambda), 
las = 2, cex.names = 0.5) 

#R0
resR0 <- sensParams(growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff), fecObj = makeFecObj(dff, Transform="log"), 
nBigMatrix = 50, minSize = min(dff$size, na.rm=TRUE), 
maxSize = max(dff$size, na.rm = TRUE), response="R0")

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(resR0$sens, 
main = expression("Parameter sensitivity of net reproductive rate R"[0]), 
las = 2, cex.names = 0.5) 
barplot(resR0$elas, 
main = expression("Parameter elasticity of net reproductive rate R"[0]), 
las = 2, cex.names = 0.5) 

#life expectancy
resLE <- sensParams(growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff),  nBigMatrix = 50, 
minSize = min(dff$size, na.rm=TRUE), maxSize = max(dff$size, na.rm =
TRUE), chosenBin=1, response="lifeExpect")

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(resLE$sens, 
main = expression("Parameter sensitivity of Life Expectancy"*eta[0]), 
las = 2, cex.names = 0.5) 
barplot(resLE$elas, 
main = expression("Parameter elasticity of Life expectancy"*eta[0]), 
las = 2, cex.names = 0.5) 

# Same as lambda above, but with two fecundity functions
dff$fec2 <- dff$fec>0 #create binomial describing e.g., prob of flowering
dff$fec[dff$fec==0] <- NA #take out zeros to avoid Inf when fit with log
fv1 <- makeFecObj(dff, Formula = c(fec~size+size2,fec2~size), 
    Transform=c("log","none"),Family = c("gaussian","binomial"))

res <- sensParams(growObj=makeGrowthObj(dff), survObj = makeSurvObj(dff), 
fecObj = fv1, nBigMatrix = 50, minSize = min(dff$size, na.rm = TRUE), 
maxSize = max(dff$size, na.rm = TRUE))

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(res$sens, 
main = expression("Parameter sensitivity of population growth rate " *lambda), 
las = 2, cex.names = 0.5) 
barplot(res$elas, 
main = expression("Parameter elasticity of population growth rate " *lambda), 
las = 2, cex.names = 0.5) 

# Same but with two fecundity functions and a constant
fv1@fecConstants[1] <-0.5
res <- sensParams(growObj = makeGrowthObj(dff), survObj = makeSurvObj(dff), 
fecObj = fv1, nBigMatrix = 50, minSize = min(dff$size, na.rm = TRUE), 
maxSize = max(dff$size, na.rm = TRUE))

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(res$sens, 
main = expression("Parameter sensitivity of population growth rate " *lambda), 
las = 2, cex.names = 0.5) 
barplot(res$elas, 
main = expression("Parameter elasticity of population growth rate " *lambda), 
las = 2, cex.names = 0.5)

# Same but with a discrete class
dff <- generateData(type="discrete")
res <- sensParams(growObj = makeGrowthObj(dff), survObj = makeSurvObj(dff), 
	fecObj = makeFecObj(dff), discreteTrans=makeDiscreteTrans(dff),
	nBigMatrix = 50, minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE))

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(res$sens, 
main = expression("Parameter sensitivity of population growth rate " *lambda), 
las = 2, cex.names = 0.5) 
barplot(res$elas, 
main = expression("Parameter elasticity of population growth rate " *lambda), 
las = 2, cex.names = 0.5)

}
