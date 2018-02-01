\name{convertIncrement}
\alias{convertIncrement}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Convert size increment according to time elapsed between censuses.
}
\description{
Adjusts the intervals of census data that is not annual to report output on population dynamics on an annual basis.
}
\usage{
convertIncrement(dataf, nYrs = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataf}{
    a dataframe with columns `size' `sizeNext', `exactDate', `exactDateNext'.
}
  \item{nYrs}{
    the number of years between sequential measurements (i.e. if census
    interval is 5, nYrs = 5, if census interval is 3 times a year, nYrs = 0.333).
}
}
\details{
In some data sets the time interval between census measurements can be different than one year. In some species demographic information is recorded several times within a year, while in others, particularly in "slow-living" species (e.g. trees) the census frequency is greater than one year and/or vary across intervals. This function takes a data frame \code{dataf} and uses columns with the term \code{extractData} to adjust the size increment to the number of years given in \code{nyears}. It defaults to annual.  %%  ~~  none  If necessary, more details than the description above ~~
}
\value{
  Returns the adjusted increments.%% ...
}
\references{
Sampling three times/year (nYrs = 0.333): Smith, Caswell & Mettler-Cherry. Stochastic flood and precipitation regimes and the population dynamics of a threatened floodplain plant. Ecological Applications 15, p1036-1052.

Sampling every five years (nYrs = 5): van Mantgem & Stepheson. 2005. The accuracy of matrix population model projections for coniferous trees in the Sierra Nevada, California. Journal of Ecology 93, p737-747.
}
\author{
C. Jessica E. Metcalf, Sean M. McMahon, Roberto Salguero-Gomez, Eelke Jongejans & Cory Merow.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


