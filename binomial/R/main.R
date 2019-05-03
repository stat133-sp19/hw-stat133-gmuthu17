#' @title bin_choose
#' @description calculates number of combinations
#' @param n is the number of trials
#' @param k is the number of successes
#' @return number of combinations of k successes in n trials
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)
bin_choose = function(n, k) {
  if (k > n) {
    stop('k cannot be greater than n')
  } else {
    return ((factorial(n))/(factorial(k) * factorial(n - k)))
  }
}

#' @title bin_probability
#' @description calculates probability of getting (success) successes in (trials) trials
#' @param success is the number of successes
#' @param trials is the number of trials
#' @param prob is the probability of success
#' @return probability of getting (success) successes in (trials) trials
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = .5)
#' bin_probability(success = 0:2, trials = 5, prob = .5)
#' bin_probability(success = 55, trials = 100, prob = .45)
bin_probability = function(success, trials, prob) {
  check_trials(trials)
  check_success(success, trials)
  check_prob(prob)
  return (bin_choose(trials, success) * prob ^ success * (1 - prob) ^ (trials - success))
}

#' @title bin_distribution
#' @description calculates a data frame with the probability distribution
#' @param trials is the number of trials
#' @param prob is the probability of success
#' @return a data frame with the probability distribution
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
bin_distribution = function(trials, prob) {
  df = data.frame(success = 0:trials, probability = bin_probability(0:trials, trials, prob))
  class(df) = c('bindis', 'data.frame')
  return (df)
}

#' @export
plot.bindis = function(p) {
  library(ggplot2)
  ggplot(data = p, aes(x = success, y = probability)) + geom_col() +
    theme_bw() + ggtitle('Plot of Binominal Distribution') + xlab('successes')
}

#' @title bin_cumulative
#' @description calculates a data frame with the probability and cumulative distributions
#' @param trials is the number of trials
#' @param prob is the probability of success
#' @return a data frame with the probability and cumulative distributions
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)
bin_cumulative = function(trials, prob) {
  p = bin_probability(0:trials, trials, prob)
  df = data.frame(success = 0:trials, probability = p, cumulative = cumsum(p))
  class(df) = c('bincum', 'data.frame')
  return (df)
}


#' @export
plot.bincum = function(p) {
  library(ggplot2)
  ggplot(data = p, aes(x = success, y = cumulative)) + geom_line() + geom_point() +
    theme_bw() + ggtitle('Plot of Binominal Cumulative Distribution') + xlab('successes') + ylab('probability')
}

#' @title bin_variable
#' @description calculates a binomial random variable object
#' @param trials is the number of trials
#' @param prob is the probability of success
#' @return a binomial random variable object
#' @export
#' @examples
#' bin_variable(trials = 10, prob = 0.3)
bin_variable = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  list = list(trials, prob)
  class(list) = 'binvar'
  return (list)
}

#' @export
print.binvar = function(p) {
  print("Binomial Variable")
  print('', quote = FALSE)
  print('Parameters', quote = FALSE)
  print(paste0('- number of trials: ', p[[1]]), quote = FALSE)
  print(paste0('- prob of success : ', p[[2]]), quote = FALSE)
}

#' @export
summary.binvar = function(p) {
  trials = p[[1]]
  prob = p[[2]]
  list = list(trials, prob, aux_mean(trials, prob), aux_variance(trials, prob), aux_mode(trials, prob),
              aux_skewness(trials, prob), aux_kurtosis(trials, prob))
  class(list) = 'summary.binvar'
  return (list)
}

#' @export
print.summary.binvar = function(p) {
  print("Summary Binomial")
  print('', quote = FALSE)
  print('Parameters', quote = FALSE)
  print(paste0('- number of trials: ', p[[1]]), quote = FALSE)
  print(paste0('- prob of success : ', p[[2]]), quote = FALSE)
  print('', quote = FALSE)
  print('Measures', quote = FALSE)
  print(paste0('- mean    : ', p[[3]]), quote = FALSE)
  print(paste0('- variance: ', p[[4]]), quote = FALSE)
  print(paste0('- mode    : ', p[[5]]), quote = FALSE)
  print(paste0('- skewness: ', p[[6]]), quote = FALSE)
  print(paste0('- kurtosis: ', p[[7]]), quote = FALSE)
}

#' @title bin_mean
#' @description calculates the mean of a binomial distribution
#' @param trials is the number of trials
#' @param prob is the probability of success
#' @return the mean of a binomial distribution
#' @export
#' @examples
#' bin_mean(trials = 10, prob = 0.3)
bin_mean = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_mean(trials, prob))
}

#' @title bin_variance
#' @description calculates the variance of a binomial distribution
#' @param trials is the number of trials
#' @param prob is the probability of success
#' @return the variance of a binomial distribution
#' @export
#' @examples
#' bin_variance(trials = 10, prob = 0.3)
bin_variance = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_variance(trials, prob))
}

#' @title bin_mode
#' @description calculates the mode of a binomial distribution
#' @param trials is the number of trials
#' @param prob is the probability of success
#' @return the mode of a binomial distribution
#' @export
#' @examples
#' bin_mode(trials = 10, prob = 0.3)
bin_mode = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_mode(trials, prob))
}

#' @title bin_skewness
#' @description calculates the skewness of a binomial distribution
#' @param trials is the number of trials
#' @param prob is the probability of success
#' @return the skewness of a binomial distribution
#' @export
#' @examples
#' bin_skewness(trials = 10, prob = 0.3)
bin_skewness = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_skewness(trials, prob))
}

#' @title bin_kurtosis
#' @description calculates the kurtosis of a binomial distribution
#' @param trials is the number of trials
#' @param prob is the probability of success
#' @return the kurtosis of a binomial distribution
#' @export
#' @examples
#' bin_kurtosis(trials = 10, prob = 0.3)
bin_kurtosis = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_kurtosis(trials, prob))
}
