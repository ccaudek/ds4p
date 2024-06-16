data {
  int<lower=0> N;         // Numero di misurazioni
  vector[N] def;          // Valori di deformazione
}
parameters {
  vector<lower=0, upper=1>[N] s;       // Slant per ogni misurazione
  vector<lower=0, upper=1>[N] omega;   // Velocità di rotazione locale per ogni misurazione
  real<lower=0> sigma;
}
model {
  // Priori
  s ~ beta(1, 1);
  omega ~ beta(1, 1);
  
  // Likelihood
  for (i in 1:N) {
    def[i] ~ normal(s[i] * omega[i], sigma); // Assumendo una certa varianza sigma
  }
}
