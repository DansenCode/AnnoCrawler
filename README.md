# AnnoCrawler

This package allows to identfy enriched annotations based in Fisher's exact test and 1D annotation enrichments scoring (Cox et al. 2012, doi: 10.1186/1471-2105-13-S16-S12). As input, the package allows to use binary classes (Fisher's test) as well as continious scales (1D enrichment).

``` r
# install.packages("devtools")
devtools::install_github("DansenCode/AnnoCrawler")
```

-----

# Motivation

Interrogating biological data on a feature by feature level is very usefull to get a granular understanding of the underlying biology. Sometimes, high-level understanding can be usfull to condense hundred or thousands of features based on predefined common properties. Moreover, while individual features can show small, insignificant trends, aggregates evidence, e.g. from hundreds of features involved in the same pathway can provide significant evidence for regulation. The purpose of that package is to providse two simple and usfull enrichment strategies for common biological data sets.

<https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-13-S16-S12>

## Fisher's test



## 1D Enrichment


# How to use it

## Example Data

Thank you!

# Further Reading

## Online Resources

  - <http://r-pkgs.had.co.nz/>: Website of Hadley Wickham’s R Packages
    book
  - [Writing an R package from
    scratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/):
    A short and good blog post on how to create minimal R packages
  - [Writing R
    Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html):
    The official R documentation on writing R packages. This is the
    complete and definitive set of instructions on how to write R
    packages. It is almost unreadable in it’s comprehensiveness, and
    unnecessary for small R packages such as the data package described
    here.

## References

<div id="refs" class="references">

<div id="ref-allaire_rmarkdown:_2016">

Allaire, J. J., Joe Cheng, Yihui Xie, Jonathan McPherson, Winston Chang,
Jeff Allen, Hadley Wickham, and Rob Hyndman. 2016. *Rmarkdown: Dynamic
Documents for R* (version 1.3).
<https://cran.r-project.org/web/packages/rmarkdown/index.html>.

</div>

<div id="ref-gorgolewski_brain_2016">

Gorgolewski, Krzysztof J., Tibor Auer, Vince D. Calhoun, R. Cameron
Craddock, Samir Das, Eugene P. Duff, Guillaume Flandin, et al. 2016.
“The Brain Imaging Data Structure, a Format for Organizing and
Describing Outputs of Neuroimaging Experiments.” *Scientific Data* 3
(June): 160044. <https://doi.org/10.1038/sdata.2016.44>.

</div>

<div id="ref-KitzesPracticeReproducibleResearch2017">

Kitzes, Justin, Daniel Turek, and Fatma Deniz. 2017. *The Practice of
Reproducible Research: Case Studies and Lessons from the Data-Intensive
Sciences*. University of California Press.
<https://www.practicereproducibleresearch.org/>.

</div>

<div id="ref-Munafomanifestoreproduciblescience2017">

Munaf‘o, Marcus R., Brian A. Nosek, Dorothy V. M. Bishop, Katherine S.
Button, Christopher D. Chambers, Nathalie Percie du Sert, Uri Simonsohn,
Eric-Jan Wagenmakers, Jennifer J. Ware, and John P. A. Ioannidis. 2017.
“A Manifesto for Reproducible Science.” *Nature Human Behaviour* 1
(January): 0021. <https://doi.org/10.1038/s41562-016-0021>.

</div>

<div id="ref-RCoreTeamLanguageEnvironmentStatistical2017">

R Core Team. 2017. *R: A Language and Environment for Statistical
Computing*. Vienna, Austria: R Foundation for Statistical Computing.
<https://www.R-project.org/>.

</div>

<div id="ref-RStudioTeamRStudioIntegratedDevelopment2016">

RStudio Team. 2016. *RStudio: Integrated Development Environment for R*.
Boston, MA: RStudio, Inc. <http://www.rstudio.com/>.

</div>

<div id="ref-vuorre_curating_2017">

Vuorre, Matti, and James P. Curley. 2017. “Curating Research Assets in
Behavioral Sciences: A Tutorial on the Git Version Control System.”
*PsyArXiv Preprints*, June. <https://doi.org/10.17605/OSF.IO/TXGN8>.

</div>

<div id="ref-wickham_r_2015">

Wickham, Hadley. 2015. *R Packages: Organize, Test, Document, and Share
Your Code*. "O’Reilly Media, Inc.". <http://r-pkgs.had.co.nz/>.

</div>

<div id="ref-wickham_pkgdown:_2017">

———. 2017. *Pkgdown: Make Static HTML Documentation for a Package*.
<https://github.com/hadley/pkgdown>.

</div>

<div id="ref-wickham_devtools:_2017">

Wickham, Hadley, and Winston Chang. 2017. *Devtools: Tools to Make
Developing R Packages Easier*.
<https://CRAN.R-project.org/package=devtools>.

</div>

<div id="ref-wickham_roxygen2:_2017">

Wickham, Hadley, Peter Danenberg, and Manuel Eugster. 2017. *Roxygen2:
In-Line Documentation for R*.
<https://CRAN.R-project.org/package=roxygen2>.

</div>

<div id="ref-yee_why_2017">

Yee, Sara J. Weston, and Debbie. 2017. “Why You Should Become a UseR: A
Brief Introduction to R.” *APS Observer* 30 (3).
<https://www.psychologicalscience.org/observer/why-you-should-become-a-user-a-brief-introduction-to-r>.

</div>

</div>

1.  By “product”, we mean any combination of text (manuscripts), code,
    data, stimuli, and other research materials.

2.  <https://daringfireball.net/projects/markdown/>
