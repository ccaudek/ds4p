// run with 4 chains and 2k iters.
// all data should be scaled to mean 0 and std 1:
data {
  int<lower=1> N;   // number of observations
  int<lower=1> K;   // number of independent variables, including the intercept
  matrix[N, K] X;   // data matrix
  vector[N] y;      // dependent variable vector
}
parameters {
  real alpha;           // intercept
  vector[K] beta;       // coefficients for independent variables
  real<lower=0> sigma;  // model error
}
model {
  // priors
  alpha ~ student_t(3, 0, 2.5);
  beta ~ student_t(3, 0, 2.5);
  sigma ~ exponential(1);

  // likelihood
  y ~ normal(alpha + X * beta, sigma);
}
generated quantities {
  vector[N] log_lik; // Log-likelihood for each observation
  vector[N] y_rep;  // Posterior predictions for each observation

  for (n in 1:N) {
    log_lik[n] = normal_lpdf(y[n] | alpha + dot_product(X[n], beta), sigma);
    y_rep[n] = normal_rng(alpha + dot_product(X[n], beta), sigma);
  }
}
