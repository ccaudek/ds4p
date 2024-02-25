data {
  int<lower=0> N;
  array[N] int<lower=0, upper=1> y;
}
parameters {
  real<lower=0, upper=1> theta;
}
model {
  theta ~ beta(4, 6);
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
