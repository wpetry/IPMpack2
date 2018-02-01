\name{meanLifeExpect}
\alias{meanLifeExpect}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Calculates the mean life expectancy.
}
\description{
  Provided a P matrix, which defines survival transitions across stages, this function outputs a vector defining life expectancy in units of the time step used (see convertIncrement()), for each of the size bins.
}
\usage{
meanLifeExpect(IPMmatrix)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{IPMmatrix}{
    an IPMmatrix object defining survival transitions.
}
}
\details{
Note that more complex approaches for discretely varying environments (e.g., as in Tuljapurkar & Horvitz 2006.) have yet to be implemented. %%  ~~ If necessary, more details than the description above ~~
}
\value{
  A vector of life expectancies each corresponding to a value of the size bins defined by Pmatrix@meshpoints.
}
\references{
Caswell, 2001. Matrix population models: analysis, construction and
interpretation. 2nd ed. Sinauer. p118-120.

Cochran & Ellner. 1992. Simple methods for calculating age-based life history parameters for stage-structured populations. Ecological Monographs 62, p345-364.

Tuljapurkar & Horvitz. 2006. From stage to age in variable
environments. Life expectancy and survivorship. Ecology 87, p1497-1509.

}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{makeIPMPmatrix}} 
}
\examples{
# With a single continuous state variable (e.g. size):
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj=makeGrowthObj(dff),
survObj = makeSurvObj(dff))
meanLifeExpect(Pmatrix)

Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff),
survObj = makeSurvObj(dff))

plot(meanLifeExpect(Pmatrix), ylab = "Mean life expectancy", 
xlab = "Continuous (e.g. size) stage", type = "l", col="dark gray", 
ylim = c(0,max(meanLifeExpect(Pmatrix))))

# With continuous (e.g. size) and discrete (e.g. seedbank) stages:
dff <- generateData(type="discrete")
dff$covariate <- sample(1:3, size = nrow(dff), replace = TRUE)
dff$covariateNext <- sample(1:3, size = nrow(dff), replace = TRUE)
discM <- makeDiscreteTrans(dff)
Pmatrix <- makeCompoundPmatrix(minSize = min(dff$size, na.rm = TRUE), 
maxSize = max(dff$size, na.rm = TRUE), envMatrix = makeEnvObj(dff),
growObj = makeGrowthObj(dff, Formula = sizeNext~size+size2+covariate),
survObj = makeSurvObj(dff, Formula = surv~size+size2+covariate), 
discreteTrans = discM)
mLE <- meanLifeExpect(Pmatrix)

# showing three environments on different panels, 
# life expectancy of discrete stages
# shown at level of the first size class
par(mfrow=c(max(Pmatrix@env.index),1))

xvals <- c(rep(Pmatrix@meshpoints[1],ncol(discM@discreteTrans)-1),
    Pmatrix@meshpoints)

for (k in 1:max(Pmatrix@env.index)) { 
	indx <- ((k-1)*(ncol(discM@discreteTrans)-1+length(Pmatrix@meshpoints))+1):
		(k*(ncol(discM@discreteTrans)-1+length(Pmatrix@meshpoints)))
	
	plot(xvals,mLE[indx], 
		ylab = "Mean life expectancy", 
		xlab = "Continuous (e.g. size) and discrete (e.g. seedbank) stages", 
		type = "l", col = "dark gray", ylim = c(0,max(mLE)), 
		main=paste("habitat ",k,sep=""))	
	}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
