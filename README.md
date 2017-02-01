# HistMapR

## *_Rapid classification of historical land-use maps in R_*

## Background
We created this package due to our need to classify large areas of historical land-use map quickly and easily. The package contains four functions for the classification of historical land-use maps in R, calling functions from the `raster` package by R. Hijmans. A full description of the method is available in Auffret A.G., Kimberley, A. et al. 2017, HistMapR: Rapid classificaion of historical land-use maps in R, BioRxiv ...

## Installation
This package can be installed using the `devtools` package:

```R
library(devtools) # install devtools with install.packages("devtools") if you don't have it already.
install_github("AGAuffret/HistMapR") # This should also hopefully install the raster, ggplot2 and gridExtra packages that HistMapR depends on, if needed.
library(HistMapR)
```

## Examples
Very simple examples of each function can be seen using the `examples` function. The input maps in these examples are from the Swedish Agency Lantmäteriet (copyright expired). A more detailed tutorial with walkthrough scripts and examples can be found on Figshare, along with the historical land-use classification over southern Sweden for which this package was created. <a href="https://figshare.com/authors/Alistair_G_Auffret/2584744">Auffret et al. 2017, Data from: HistMapR: Rapid classificaion of historical land-use maps in R</a>.

## Contributors and maintenance

This package was created by <a href="mailto:alistair.auffret@natgeo.su.se">Alistair Auffret</a> and Adam Kimberley. It's our first package and first time on GitHub, so help and suggestions are welcome.


