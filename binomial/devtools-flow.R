# devtools-dlor.R
# Author: Ganesh Muthu
# Date: 2 May 2019
# Description: Loads everything required to build package

devtools::document()          # generate documentation
devtools::check_man()         # check documentation
devtools::test()              # run tests
devtools::build_vignettes()   # build vignettes
devtools::build()             # build bundle
devtools::install()           # install package
