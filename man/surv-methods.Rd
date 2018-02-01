\name{surv-methods}
\docType{methods}
\alias{surv-methods}
\alias{surv,numeric,data.frame,survObj-method}
\alias{surv,numeric,data.frame,survObjOverDisp-method}
\title{ ~~ Methods for Function surv  ~~}
\description{
 ~~ Methods for function \code{surv}  ~~
}
\section{Methods}{
\describe{

\item{\code{signature(size = "numeric", cov = "data.frame", survObj = "survObj")}}{
Methods to predict probability of survival given a linear predictor based on 
various transforms of size and covariates defined in cov. 
}

\item{\code{signature(size = "numeric", cov = "data.frame", survObj = "survObjOverDisp")}}{
Methods to predict probability of survival given a linear predictor based on 
various transforms of size and acovariate, where over-dispersion has been fitted, using a correction.  

}

}}
\keyword{methods}
\keyword{ ~~ other possible keyword(s) ~~ }
