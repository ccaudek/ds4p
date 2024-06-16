data {
  int<lower=0> N; // Numero di prove
  array[N] int<lower=0> y; // Dati osservati per ogni prova
  real<lower=0> alpha_prior; // Parametro alpha della distribuzione Beta a priori
  real<lower=0> beta_prior; // Parametro beta della distribuzione Beta a priori
}
parameters {
  real<lower=0, upper=1> theta; // Probabilità di successo
}
model {
  // Prior
  theta ~ beta(alpha_prior, beta_prior);
  // Likelihood
  y ~ bernoulli(theta);
}
generated quantities {
    array[N] int<lower=0, upper=1> y_rep; // generated data for posterior predictive checks
    array[N] real log_lik; // log likelihood for each observation

    for (n in 1:N) {
        y_rep[n] = bernoulli_rng(theta); // simulate new data based on posterior of theta
        log_lik[n] = bernoulli_lpmf(y[n] | theta); // calculate log likelihood for each observed data point
    }
}
