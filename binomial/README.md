Desciption
----------

`"binomial"` is a package allows a user to work with the binomial
distribution, create binomial random variables, and get several useful
statistics from it. It also has functions for a cumulative version. This
package was created as Workout03 for Stat133 at UC Berkeley, Spring
2019.

Quick Start
-----------

    library(binomial)
    # create binomial random variable
    binomialVar = bin_variable(trials = 5, prob = .4)

    # print
    print(binomialVar)
    #> [1] "Binomial Variable"
    #> [1] 
    #> [1] Parameters
    #> [1] - number of trials: 5
    #> [1] - prob of success : 0.4

    # summarize
    summary(binomialVar)
    #> [1] "Summary Binomial"
    #> [1] 
    #> [1] Parameters
    #> [1] - number of trials: 5
    #> [1] - prob of success : 0.4
    #> [1] 
    #> [1] Measures
    #> [1] - mean    : 2
    #> [1] - variance: 1.2
    #> [1] - mode    : 2
    #> [1] - skewness: 0.182574185835055
    #> [1] - kurtosis: -0.366666666666667
