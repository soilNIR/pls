%% $Id: pls.options.Rd 89 2006-09-20 15:41:09Z bhm $
\encoding{latin1}
\name{pls.options}
\alias{pls.options}
\title{Set or return options for the pls package}
\description{
  A function to set options for the \pkg{pls} package, or to return the
  current options.
}
\usage{
pls.options(\dots)
}
\arguments{
  \item{\dots}{a single list, a single character vector, or any number
    of named arguments (\var{name = value}).}
}
\details{
  If called with no arguments, or with an empty list as the single
  argument, \code{pls.options} returns the current options.

  If called with a character vector as the single argument, a list with
  the arguments named in the vector are returned.

  If called with a non-empty list as the single arguments, the list
  elements should be named, and are treated as named arguments to the
  function.

  Otherwise, \code{pls.options} should be called with one or more named
  arguments \var{name = value}.  For each argument, the option named
  \var{name} will be given the value \var{value}.

  The options are saved in a variable \code{.pls.Options} in the global
  environment, and remain in effect until the end of the session.  If
  the environment is saved upon exit, they will be remembered in the
  next session.  The `factory defaults' can be restored by removing
  \code{.pls.Options} from the global environment.

  The recognised options are:
  \describe{
    \item{mvralg}{The fit method to use in \code{\link{mvr}} and
      \code{\link{mvrCv}}.  The value should be one of the allowed
      methods.  Defaults to \code{"kernelpls"}.  Can be overridden with
      the argument \code{method} in \code{mvr} and \code{mvrCv}.}
    \item{pcralg}{The fit method to use in \code{\link{pcr}}.  The
      value should be one of the allowed methods.  Defaults to
      \code{"svdpc"}.  Can be overridden with the argument
      \code{method} in \code{pcr}.}
    \item{plsralg}{The fit method to use in \code{\link{plsr}}.  The
      value should be one of the allowed methods.  Defaults to
      \code{"kernelpls"}.  Can be overridden with the argument
      \code{method} in \code{plsr}.}
  }
}
\section{Side Effects}{
  If any named argument (or list element) was provided,
  \code{pls.options} updates the elements of the option list
  \code{.pls.Options} in the global environment.
}
\value{
  A list with the (possibly changed) options.  If any named argument (or
  list element) was provided, the list is returned invisibly.
}
\author{Bj�rn-Helge Mevik and Ron Wehrens}
\note{
  The function is a slight modification of the function
  \code{\link[sm]{sm.options}} from the package sm.
}
\examples{
## Return current options:
pls.options()
pls.options("plsralg")
pls.options(c("plsralg", "pcralg"))

## Set options:
pls.options(plsralg = "simpls", mvralg = "simpls")
pls.options(list(plsralg = "simpls", mvralg = "simpls")) # Equivalent
pls.options()

## Restore `factory settings':
rm(.pls.Options)
pls.options()
}
\keyword{regression}
\keyword{multivariate}