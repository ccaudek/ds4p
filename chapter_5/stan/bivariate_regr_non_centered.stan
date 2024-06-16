data {
  int<lower=1> N;         // Number of observations
  vector[N] x;            // Predictor variable
  vector[N] y;            // Outcome variable
}

transformed data {
  real mean_x = mean(x);
  real sd_x = sd(x);
  real mean_y = mean(y);
  real sd_y = sd(y);
  vector[N] x_std = (x - mean_x) / sd_x;  // Standardized predictor
  vector[N] y_std = (y - mean_y) / sd_y;  // Standardized outcome
}

parameters {
  real alpha_std;         // Standardized, non-centered intercept
  real beta_std;          // Standardized, non-centered slope coefficient
  real<lower=0> sigma_std;  // Standardized, non-centered residual standard deviation
}

model {
  alpha_std ~ normal(0, 1); // Non-centered parameterization
  beta_std ~ normal(0, 1);  // Non-centered parameterization
  sigma_std ~ normal(0, 1); // Non-centered parameterization

  // Model using standardized data
  y_std ~ normal(alpha_std + beta_std * x_std, sigma_std);
}

generated quantities {
  real alpha = mean_y - alpha_std * sd_y;  // Convert alpha back to original scale
  real beta = beta_std * sd_y / sd_x;     // Convert beta back to original scale
  real sigma = sigma_std * sd_y;          // Convert sigma back to original scale
  vector[N] y_rep;                        // Posterior predictive checks

  for (int i = 1; i <= N; i++) {
    y_rep[i] = normal_rng(alpha + beta * x[i], sigma);  // Generate replicated data
  }
}





