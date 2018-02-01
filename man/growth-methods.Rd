\name{growth-methods}
\docType{methods}
\alias{growth-methods}
\alias{growth,numeric,numeric,data.frame,growthObj-method}
\alias{growth,numeric,numeric,data.frame,growthObjDeclineVar-method}
\alias{growth,numeric,numeric,data.frame,growthObjHossfeld-method}
\alias{growth,numeric,numeric,data.frame,growthObjIncr-method}
\alias{growth,numeric,numeric,data.frame,growthObjIncrDeclineVar-method}
\alias{growth,numeric,numeric,data.frame,growthObjLogIncr-method}
\alias{growth,numeric,numeric,data.frame,growthObjLogIncrDeclineVar-method}
\alias{growth,numeric,numeric,data.frame,growthObjTruncIncr-method}
\alias{growth,numeric,numeric,data.frame,growthObjPois-method}
\alias{growth,numeric,numeric,data.frame,growthObjNegBin-method}
\title{ ~~ Methods for Function \code{growth}  ~~}
\description{
 ~~ Methods for function \code{growth}  ~~
}
\section{Methods}{
\describe{
\item{\code{signature(size = "numeric", sizeNext = "numeric", 
	cov = "data.frame", growthObj = "growthObj")}}{
Methods to predict the probability density of \code{sizeNext} via linear prediction based around a 
range of transforms of the current size, and covariates described in the data-frame "cov". The prediction 
supplies mean sizeNext directly; the density function around this is normal. 
}

\item{\code{signature(size = "numeric", sizeNext = "numeric", 
	cov = "data.frame", growthObj = "growthObjDeclineVar")}}{
Methods to predict the probability density of \code{sizeNext} via linear prediction based around a 
range of transforms of the current size, and covariates described in the data-frame "cov". The prediction 
supplies mean sizeNext directly; the density function around this is normal and the sd may change with size. 
%%  ~~describe this method here~~
}

\item{\code{signature(size = "numeric", sizeNext = "numeric", 
	cov = "data.frame", growthObj = "growthObjHossfeld")}}{
Methods to predict the probability density of \code{sizeNext} using the Hossfeld function. The prediction
supplies mean incr which is added to size to obtain sizeNext; the  density function  around this is normal. 
%%  ~~describe this method here~~
}

\item{\code{signature(size = "numeric", sizeNext = "numeric", 
	cov = "data.frame", growthObj = "growthObjIncr")}}{
Methods to predict the probability density of \code{sizeNext} via linear prediction based around a 
range of transforms of the current size, and covariates described in the data-frame "cov". The prediction 
supplies mean incr which is added to size to obtain sizeNext; the density function around this is normal. 
%%  ~~describe this method here~~
}

\item{\code{signature(size = "numeric", sizeNext = "numeric", 
	cov = "data.frame", growthObj = "growthObjIncrDeclineVar")}}{
Methods to predict the probability density of \code{sizeNext} via linear prediction based around a 
range of transforms of the current size, and covariates described in the data-frame "cov". The prediction 
supplies mean incr which is added to size to obtain sizeNext; the density function around this is normal and the sd may change with size.
%%  ~~describe this method here~~
}

\item{\code{signature(size = "numeric", sizeNext = "numeric", 
	cov = "data.frame", growthObj = "growthObjLogIncr")}}{
Methods to predict the probability density of \code{sizeNext} via linear prediction based around a  range of transforms of the current size, and covariates described in the data-frame "cov". The prediction 
supplies mean logincr which is exponentiated and added to size to obtain sizeNext; the density function around this is log normal; and variance changes with size. 
%%  ~~describe this method here~~
}

\item{\code{signature(size = "numeric", sizeNext = "numeric", 
	cov = "data.frame", growthObj = "growthObjLogIncrDeclineVar")}}{
Methods to predict the probability density of \code{sizeNext} via linear prediction based around a 
range of transforms of the current size, and covariates described in the data-frame "cov". The prediction 
supplies logincr which is exponentiated and added to size to obtain sizeNext; the density function around this is lognormal; 
the sd may change with size. 
}


\item{\code{signature(size = "numeric", sizeNext = "numeric", 
	cov = "data.frame", growthObj = "growthObjTruncIncr")}}{
Methods to predict the probability density of \code{sizeNext} via linear prediction based around a 
range of transforms of the current size, and covariates described in the data-frame "cov". The prediction 
supplies mean incr which is added to size to obtain sizeNext; the density function around this is truncated normal, truncated at zero. 
}

\item{\code{signature(size = "numeric", sizeNext = "numeric", 
	cov = "data.frame", growthObj = "growthObjPois")}}{
Methods to predict the probability density of \code{sizeNext} via linear prediction based around a 
range of transforms of the current size, and covariates described in the data-frame "cov". The prediction 
supplies mean sizeNext directly; the density function around this is poisson. NOTE THAT THIS EMPHATICALLY SHOULD NOT BE USED WITH AN IPM, SINCE THE PREDICTION IS NOT CONTINUOUS. It can be used with \code{makeIntegerPmatrix}.   

}

\item{\code{signature(size = "numeric", sizeNext = "numeric", 
	cov = "data.frame", growthObj = "growthObjNegBin")}}{
Methods to predict the probability density of \code{sizeNext} via linear prediction based around a 
range of transforms of the current size, and covariates described in the data-frame "cov". The prediction 
supplies mean sizeNext directly; the density function around this is negative binomial. NOTE THAT THIS EMPHATICALLY SHOULD NOT BE USED WITH AN IPM, SINCE THE PREDICTION IS NOT CONTINUOUS. It can be used with \code{makeIntegerPmatrix}.   

}

}}
\keyword{methods}
\keyword{ ~~ other possible keyword(s) ~~ }
