data {
  int<lower=0> ntrials; // Numero di prove
  // Si rimuove la variabile 'y' poiché non utilizziamo dati osservati
  real<lower=0> alpha_prior; // Parametro alpha per il prior Beta
  real<lower=0> beta_prior; // Parametro beta per il prior Beta
}
parameters {
  real<lower=0, upper=1> theta; // Parametro stimato, limitato tra 0 e 1
}
model {
  // Prior
  theta ~ beta(alpha_prior, beta_prior);
  
  // Si rimuove la likelihood poiché stiamo generando dati a priori
}
generated quantities {
  int<lower=0> y_pred_prior; // Variabile per la distribuzione predittiva a priori
  
  // Generazione dei dati predittivi a priori
  // Usiamo campioni tratti dai prior per theta per generare un nuovo risultato
  // da una distribuzione binomiale senza considerare 'y'
  y_pred_prior = binomial_rng(ntrials, beta_rng(alpha_prior, beta_prior));
}

