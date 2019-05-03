# title: aux_mean
# description: get the mean from a binomial
# param: trials is the number of trials
# param: prob is the probability of success
# return: mean of binomial
aux_mean = function(trials, prob) {
  return (trials * prob)
}

# title: aux_variance
# description: get the variance from a binomial
# param: trials is the number of trials
# param: prob is the probability of success
# return: variance of binomial
aux_variance = function(trials, prob) {
  return (trials * prob * (1 - prob))
}

# title: aux_mode
# description: get the mode from a binomial
# param: trials is the number of trials
# param: prob is the probability of success
# return: mode of binomial
aux_mode = function(trials, prob) {
  return(as.integer(trials * prob + prob))
}

# title: aux_skewness
# description: get the skewness from a binomial
# param: trials is the number of trials
# param: prob is the probability of success
# return: skewness of binomial
aux_skewness = function(trials, prob) {
  return ((1 - (2 * prob))/sqrt(trials * prob * (1 - prob)))
}

# title: aux_kurtosis
# description: get the kurtosis from a binomial
# param: trials is the number of trials
# param: prob is the probability of success
# return: kurtosis of binomial
aux_kurtosis = function(trials, prob) {
  return ((1 - (6 * prob * (1 - prob)))/(trials * prob * (1 - prob)))
}
