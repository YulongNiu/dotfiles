

##~~~~~~~~~~do the following codes multiple times~~~~~~~~
## current pkgs
curPkgsPath <- "/usr/local/lib/R/4.2/site-library"
curPkgs <- unname(installed.packages()[, "Package"])

## previous pkgs
prePkgsPath <- "/usr/local/lib/R/4.2/site-library"
prePkgs <- list.dirs(prePkgsPath, full.names = FALSE, recursive = FALSE)


## install pkgs fron CRAN
insPkgs <- prePkgs[!(prePkgs %in% curPkgs)]
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


install.packages(insPkgs)
BiocManager::install(insPkgs)

install.packages("spDataLarge", repos = "https://geocompr.r-universe.dev")

