data {
  int<lower=0> N; // Number of observations
  array[N] int<lower=0> y; // Observed gestures
  real<lower=0> alpha; // Mean parameter of the Gamma prior
  real<lower=0> beta; // Standard deviation parameter of the Gamma prior
}

parameters {
  real<lower=0> rate; // Rate parameter of the Poisson distribution
}

model {
  rate ~ gamma(alpha, beta); // Gamma prior for the rate parameter
  y ~ poisson(rate); // Poisson likelihood
}

generated quantities {
  array[N] int<lower=0> events; // Simulated events
  for (i in 1:N) {
    events[i] = poisson_rng(rate); // Generating simulated events
  }
}
