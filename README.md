# HistMapR

## *_Rapid digitization of historical land-use maps in R_*


## Background
We created this package due to our need to classify large areas of historical land-use map quickly and easily. The package contains four functions for the classification of historical land-use maps in R, calling functions from the `raster` package by R. Hijmans. A full description of the method is available in Auffret A.G., Kimberley, A. et al. 2017, HistMapR: Rapid classificaion of historical land-use maps in R, BioRxiv ...


## Installation
This package can be installed using the `devtools` package. HistMapR also requires `raster`, `ggplot2` and `gridExtra` to run the functions. Even though installing through devtools installs dependent packages, there are issues in installing the packages that these are in-turn dependent upon, which can cause problems. This code adapted from <a href="https://github.com/BiologicalRecordsCentre/sparta">here</a>.

```R
req.packages<-c("devtools", "raster", "ggplot2","gridExtra") # required packages
new.packages <- req.packages[!(req.packages %in% installed.packages()[,"Package"])] # which are not installed?
if(length(new.packages)) install.packages(new.packages, dep=TRUE) # install those as required.

install_github("AGAuffret/HistMapR")
library(HistMapR)
```

## Examples
Very simple examples of each function can be seen using the `examples` function. The input maps in these examples are from the Swedish Agency Lantmäteriet (copyright expired). A more detailed tutorial with walkthrough scripts and examples can be found on Figshare, along with the historical land-use classification over southern Sweden for which this package was created. <a href="https://figshare.com/authors/Alistair_G_Auffret/2584744">Auffret et al. 2017, Data from: HistMapR: Rapid classificaion of historical land-use maps in R</a>.


## Contributors and maintenance

This package was created by <a href="mailto:alistair.auffret@natgeo.su.se">Alistair Auffret</a> and Adam Kimberley. It's our first package and first time on GitHub, so help and suggestions are welcome.


## Licence

Released under the <a href="https://choosealicense.com/licenses/gpl-3.0/"> GNU GPLv3 license </a>.

