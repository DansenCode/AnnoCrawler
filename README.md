# AnnoCrawler

This package allows to identfy enriched annotations based in Fisher's exact test and 1D annotation enrichments scoring (Cox et al. 2012, doi: 10.1186/1471-2105-13-S16-S12). As input, the package allows to use binary classes (Fisher's test) as well as continious scales (1D enrichment).

``` r
# install.packages("devtools")
devtools::install_github("DansenCode/AnnoCrawler")
library("AnnoTools")
```

-----

# Motivation

Interrogating biological data on a feature by feature level is very usefull to get a granular understanding of the underlying biology. Sometimes, high-level understanding can be usfull to condense hundred or thousands of features based on predefined common properties. Moreover, while individual features can show small, insignificant trends, aggregates evidence, e.g. from hundreds of features involved in the same pathway can provide significant evidence for regulation. The purpose of that package is to providse two simple and usfull enrichment strategies for common biological data sets.

<https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-13-S16-S12>

## Fisher's test
``` r
# call hypergeometric test function
HypPara()
```

## 1D Enrichment
``` r
# call 1D enrichment function
ODE()
```

# How to use it

## Example Data

Thank you!
# Further Reading

## Online Resources

  - <https://www.uniprot.org/>: Website for protein annotations
    book

## References

<div id="refs" class="references">

<div id="ref-cox_rmarkdown:_2012">

Jurgen Cox, and Matthias Mann. 2012. "1D and 2D annotation enrichment: a statistical method integrating quantitative proteomics with complementary high-throughput data." *BMC Bioinformatics volume*.
<https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-13-S16-S12>.

</div>

