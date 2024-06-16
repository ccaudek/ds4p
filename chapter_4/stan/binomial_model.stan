data {
  int<lower=0> ntrials; // Numero di prove
  int<lower=0> y; // Successi osservati
  real<lower=0> alpha_prior; // Parametro alpha per il prior Beta
  real<lower=0> beta_prior; // Parametro beta per il prior Beta
}
parameters {
  real<lower=0, upper=1> theta; // Parametro stimato, limitato tra 0 e 1
}
model {
  // Prior
  theta ~ beta(alpha_prior, beta_prior);
  
  // Likelihood
  y ~ binomial(ntrials, theta);
}
