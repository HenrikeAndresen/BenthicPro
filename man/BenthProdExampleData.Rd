\name{BenthProdExampleData}
\alias{BenthProdExampleData}
\docType{data}
\title{
Example Data for calculating benthic productivity
}
\description{
A data frame with macrozoobenthic abundance and biomass data of two van Veen Grab samples from the German North Sea. Contains conversion factors and the taxon information,  lifestyle traits, and environmental information needed to calculate annual benthic productivity.
}
\usage{data("BenthProdExampleData")}
\format{
  A data frame with 41 observations on the following 28 variables:
  \describe{
    \item{\code{SampleID}}{A sample identifier}
    \item{\code{Scientific.name}}{Species or higher-level taxon name}
    \item{\code{Count}}{Number of individuals}
    \item{\code{wet.mass.g}}{Wet mass in g of all the individuals of the species (or taxon) in the grab}
    \item{\code{Sample.area}}{Area of the sampling device}
    \item{\code{mean.wet.mass.g}}{Wet mass divided by number of individuals}
    \item{\code{ConFac_j2mgwm}}{Taxon-specific conversion factor, Joule/mg wet mass}
    \item{\code{ConFac_j2mgc}}{Taxon-specific conversion factor, Joule/mg carbon}
    \item{\code{Bodymass}}{Mean individual body mass in Joule}
    \item{\code{Temperature}}{Temperature in °Celsius}
    \item{\code{Depth}}{Water depth in m}
    \item{\code{Mollusca}}{}
    \item{\code{Annelida}}{}
    \item{\code{Crustacea}}{}
    \item{\code{Echinodermata}}{}
    \item{\code{Insecta}}{Binary variables indicating belonging (1) or not belonging (0) to each taxon. One value per row is 1, other taxa were assigned to one of these.}
    \item{\code{Infauna}}{Binary variable indicating infaunal (1) or epifaunal or demersal (0) lifestyle}
    \item{\code{Sessile}}{}
    \item{\code{Crawler}}{}
    \item{\code{FacultativeSwimmer}}{Binary variables for movement traits, one value per row is 1}
    \item{\code{Herbivore}}{}
    \item{\code{Omnivore}}{}
    \item{\code{Carnivore}}{Binary variables for diet, one value per row is 1}
    \item{\code{Lake}}{}
    \item{\code{River}}{}
    \item{\code{Marine}}{Binary variables for habitat, one value per row is 1}
    \item{\code{Subtidal}}{Binary variable indicating subtidal (1) or intertidal (0) habitat}
    \item{\code{Exploited}}{Binary variable indicating exploited (1) or unexploited (0) populations}
  }
}
\examples{
data("BenthProdExampleData")
}