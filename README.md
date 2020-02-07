
# SCEM (Stemness Calculation for gene Expression or Methylation data) package

<!-- badges: start -->
<!-- badges: end -->

The goal of SCEM is to calculate stemness score from gene expression or methylation data. I wrapped some functions from "Machine Learning Identifies Stemness Features Associated with Oncogenic Dedifferentiation". Original workflow is at https://bioinformaticsfmrp.github.io/PanCanStem_Web/.

## Installation

``` r
remotes::install_github("Byronxy/SCEM")
```

## Example

Input: Gene expression matrix (Row: Symbal ID, Column: Sample ID) or DNA methylation matrix (Row: Probe ID, Column: Sample ID)

``` r
library(SCEM)
rnascore <- getRNAstemness(expr = expr)
dnascore <- getDNAstemness(expr = expr)
```

