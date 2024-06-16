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
generated quantities {
  int<lower=0> y_pred; // Variabile per la distribuzione predittiva a posteriori
  
  // Generazione dei dati predittivi a posteriori
  // Usa il valore di theta stimato per generare un nuovo risultato
  // da una distribuzione binomiale
  y_pred = binomial_rng(ntrials, theta);
}

