\name{BenthicPB}
\alias{BenthicPB}
\title{
Calculation of macrobenthic invertebrate productivity
}
\description{
Predicts production to biomass ratio (P/B) of macrobenthic invertebrate populations. Takes a data frame with mean body mass in Joule, mean annual temperature, water depth, and taxonomic and lifestyle information. Returns mean production to biomass ratio per year, with 95\% confidence limits. This is the translation to R of the Excel spreadsheet "ProductivityANN01" from the "Virtual Handbook on Population Dynamics" \url{http://www.thomas-brey.de/science/virtualhandbook/navlog/index.html}.
}
\usage{
BenthicPB(data)
}
\arguments{
  \item{data}{
A data frame which must contain the following twenty columns: "Bodymass" (individual body mass or mean individual body mass in Joule. For taxon specific body mass conversions to Joule refer to the conversion data bank on \url{http://www.thomas-brey.de/science/virtualhandbook/navlog/index.html}); "Temperature" (mean annual bottom water temperature in Celsius); "Depth" (water depth in m); "Mollusca", "Annelida", "Crustacea", "Echinodermata", and "Insecta" (taxon coded as 1 and 0, must sum to 1 per row, other taxa must be assigned to one of these); "Infauna" (environmental position coded as 1 for infauna or 0 for epifauna); "Sessile", "Crawler", and "FacultativeSwimmer" (movement traits coded as 0 or 1, must sum to 1); "Herbivore", "Omnivore", and "Carnivore" (diet coded as 0 or 1, must sum to 1); "Lake", "River", and "Marine" (habitat coded as 0 or 1, must sum to 1); "Subtidal" (0 or 1, must be 1 if depth > 1 m), "Exploited" (0 or 1, 1 refers to fished populations, usually set to 0).
}
}
\details{
Data may contain additional columns, typically scientific name, sample ID, number of individuals per sample, total biomass, conversion factors, sample area etc.
}
\value{
Returns data frame with the columns annual.PtoB, lowerCI and upperCI.
}
\references{
Brey, Thomas (2012) A multi-parameter artificial neural network model to estimate macrobenthic invertebrate productivity and production. Limnol. Oceanogr.: Methods 10, 2012, 581-589. DOI 10.4319/lom.2012.10.581
}
\author{
Henrike Andresen <henrike.andresen@awi.de> and Thomas Brey
}

\seealso{
BenthicProdExampleData for an example data set.
}
\examples{
# productivity of average individual per species and sample
data("BenthProdExampleData")
individualPB<-BenthicPB(BenthProdExampleData)
PBresults<-cbind(BenthProdExampleData,individualPB)

# annual secondary production in Joule per species and sample
productionJ<-PBresults$annual.PtoB*PBresults$Bodymass*PBresults$Count

# conversion from Joule to gram carbon
productionC<-productionJ/(PBresults$ConFac_j2mgc*1000)
biomassC<-PBresults$Bodymass*PBresults$Count/(PBresults$ConFac_j2mgc*1000)

# summation over all species per sample and conversion to squaremeter
ProductionGramCperSqm<-aggregate(productionC/PBresults$Sample.area, by=list(SampleID=PBresults$SampleID), FUN=sum)
BiomassGramCperSqm<-aggregate(biomassC/PBresults$Sample.area, by=list(SampleID=PBresults$SampleID), FUN=sum)

# annual carbon productivity
summarized.results<-cbind(BiomassGramCperSqm$SampleID,BiomassGramCperSqm$x, ProductionGramCperSqm$x, ProductionGramCperSqm$x/BiomassGramCperSqm$x)
colnames(summarized.results)=c("SampleID", "Biomass.gC/m^2", "Production.gC/m^2", "Carbon.Productivity")
summarized.results
}