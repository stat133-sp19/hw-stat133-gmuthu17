# title: check_prob
# description: test if an input is a valid probability value
# param: prop is the probability to test
# return: whether input is a valid probability value
check_prob = function(prob) {
  if (prob >= 0 & prob <= 1) {
    return (TRUE)
  } else {
    stop('invalid prob value')
  }
}

# title: check_trials
# description: test if an input is a valid value for trials
# param: trials is the number of trials to test
# return: whether input is a valid value for trials
check_trials = function(trials) {
  if (trials >= 0 & trials %% 1 == 0) {
    return (TRUE)
  } else {
    stop('invalid trials value')
  }
}

# title: check_success
# description: test if an input is a valid value for number of successes
# param: success is the value to be tested
# param: trials is the number of trials
# return: whether input is a valid value for number of successes
check_success = function(success, trials) {
  if (success >= 0 & success <= trials & trials %% 1 == 0 & success %% 1 == 0) {
    return (TRUE)
  } else {
    stop('invalid success value')
  }
}
