data {
  int<lower=0> N; // Number of observations
  array[N] int S; // Sex indicator (0 for F, 1 for M), Predictor
  array[N] real H; // Height, Mediator
  array[N] real W; // Weight, Outcome
}

parameters {
  real alphaH; // Intercept for height model
  real betaH; // Effect of sex on height
  real alphaW; // Intercept for weight model
  real betaW_H; // Effect of height on weight
  real betaW_S; // Direct effect of sex on weight
  real<lower=0> sigmaH; // Std dev for height model
  real<lower=0> sigmaW; // Std dev for weight model
}

model {
  // Priors
  alphaH ~ normal(0, 1); // Less restrictive priors for intercepts and effects
  betaH ~ normal(0, 1);
  alphaW ~ normal(0, 1);
  betaW_H ~ normal(0, 1);
  betaW_S ~ normal(0, 1);
  sigmaH ~ cauchy(0, 1); // Using a Cauchy distribution for sigma, more appropriate for std devs
  sigmaW ~ cauchy(0, 1);
  
  // Mediation Model
  for (i in 1:N) {
    // A path: Effect of sex on height
    H[i] ~ normal(alphaH + betaH * S[i], sigmaH);
    
    // B and C' path: Effect of height (and sex) on weight
    W[i] ~ normal(alphaW + betaW_H * H[i] + betaW_S * S[i], sigmaW);
  }
}
