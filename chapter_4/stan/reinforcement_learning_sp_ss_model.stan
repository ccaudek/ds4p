data {
  int<lower=1> nTrials;               
  array[nTrials] int<lower=1,upper=2> choice;     
  array[nTrials] real<lower=-1, upper=1> reward; 
}

transformed data {
  vector[2] initV = rep_vector(0.0, 2);  // initial values for V
}

parameters {
  real<lower=0,upper=1> lr; // learning rate
  real<lower=0,upper=3> tau; // temperature
}

model {
  // Priors for the learning rate and temperature
  lr ~ beta(2, 2); 
  tau ~ normal(1, 0.5); // Assuming most values around 1 with some dispersion
 
  vector[2] v = initV; // Initial value for V
  real pe; // prediction error for each trial

  for (t in 1:nTrials) {
    // Compute action probabilities and model choice behavior
    choice[t] ~ categorical_logit(tau * v);

    // Calculate prediction error
    pe = reward[t] - v[choice[t]];

    // Update values based on prediction error and learning rate
    v[choice[t]] = v[choice[t]] + lr * pe;
  }
}

generated quantities {
  array[nTrials] real log_lik; // log-likelihood for each trial for model comparison or evaluation
  vector[2] v = initV; // Re-initialize v for generated quantities
  
  for (t in 1:nTrials) {
    log_lik[t] = categorical_logit_lpmf(choice[t] | tau * v); // Calculate log-likelihood
    if (t < nTrials) {
      real pe = reward[t] - v[choice[t]]; // Recalculate prediction error
      v[choice[t]] = v[choice[t]] + lr * pe; // Update v for next trial's log-likelihood calculation
    }
  }
}
