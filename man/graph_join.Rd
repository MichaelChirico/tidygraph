% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/joins.R
\name{graph_join}
\alias{graph_join}
\title{Join graphs on common nodes}
\usage{
graph_join(x, y, by = NULL, copy = FALSE, suffix = c(".x", ".y"), ...)
}
\arguments{
\item{x}{A \code{tbl_graph}}

\item{y}{An object convertible to a \code{tbl_graph} using \code{\link[=as_tbl_graph]{as_tbl_graph()}}}

\item{by}{A character vector of variables to join by.

If \code{NULL}, the default, \verb{*_join()} will perform a natural join, using all
variables in common across \code{x} and \code{y}. A message lists the variables so that you
can check they're correct; suppress the message by supplying \code{by} explicitly.

To join by different variables on \code{x} and \code{y}, use a named vector.
For example, \code{by = c("a" = "b")} will match \code{x$a} to \code{y$b}.

To join by multiple variables, use a vector with length > 1.
For example, \code{by = c("a", "b")} will match \code{x$a} to \code{y$a} and \code{x$b} to
\code{y$b}. Use a named vector to match different variables in \code{x} and \code{y}.
For example, \code{by = c("a" = "b", "c" = "d")} will match \code{x$a} to \code{y$b} and
\code{x$c} to \code{y$d}.

To perform a cross-join, generating all combinations of \code{x} and \code{y},
use \code{by = character()}.}

\item{copy}{If \code{x} and \code{y} are not from the same data source,
and \code{copy} is \code{TRUE}, then \code{y} will be copied into the
same src as \code{x}.  This allows you to join tables across srcs, but
it is a potentially expensive operation so you must opt into it.}

\item{suffix}{If there are non-joined duplicate variables in \code{x} and
\code{y}, these suffixes will be added to the output to disambiguate them.
Should be a character vector of length 2.}

\item{...}{Other parameters passed onto methods.}
}
\value{
A \code{tbl_graph} containing the merged graph
}
\description{
This graph-specific join method makes a full join on the nodes data and
updates the edges in the joining graph so they matches the new indexes of the
nodes in the resulting graph. Node and edge data is combined using
\code{\link[dplyr:bind]{dplyr::bind_rows()}} semantic, meaning that data is matched by column name
and filled with \code{NA} if it is missing in either of the graphs.
}
\examples{
gr1 <- create_notable('bull') \%>\%
  activate(nodes) \%>\%
  mutate(name = letters[1:5])
gr2 <- create_ring(10) \%>\%
  activate(nodes) \%>\%
  mutate(name = letters[4:13])

gr1 \%>\% graph_join(gr2)
}
