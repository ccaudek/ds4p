# ✏️ Esercizi

## Inferenza sulle frequenze

````{exercise}
:label: label-bayes_inf-01

Si consideri la seguente serie storica di disastri minerari del carbone registrati nel Regno Unito dal 1851 al 1962 (Jarrett, 1979):

```{code-block} python
disaster_data = pd.Series(
    [4, 5, 4, 0, 1, 4, 3, 4, 0, 6, 3, 3, 4, 0, 2, 6,
    3, 3, 5, 4, 5, 3, 1, 4, 4, 1, 5, 5, 3, 4, 2, 5,
    2, 2, 3, 4, 2, 1, 3, 0, 2, 1, 1, 1, 1, 3, 0, 0,
    1, 0, 1, 1, 0, 0, 3, 1, 0, 3, 2, 2, 0, 1, 1, 1,
    0, 1, 0, 1, 0, 0, 0, 2, 1, 0, 0, 0, 1, 1, 0, 2,
    3, 3, 1, 0, 2, 1, 1, 1, 1, 2, 4, 2, 0, 0, 1, 4,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1]
)
```

I valori indicano il numero di disastri per ciascun anno.

Supponiamo di avere osservato, nell'ultimo anno, 0 incidenti minerari in Inghilterra. Siamo interessati alla distribuzione predittiva a posteriori che utilizza il dato che abbiamo osservato e le credenze a priori basate sui dati precedenti. Supponiamo di volere rappresentare le nostre credenze a priori con un modello esponenziale il cui parametro viene dedotto dalla serie storica indicata sopra. Ipotizziamo inoltre che il numero di incidenti minerari possa essere rappresentato da una verosimiglianza di Poisson.

Si trovi la distribuzione predittiva a posteriori per il numero di incidenti minerari in Inghilterra, usando i dati osservati (0) e le nostre credenze precedenti descritte da una distribuzione esponenziale.

Si interpreti il risultato ottenuto.
````

````{solution} label-bayes_inf-01
:class: dropdown

```{code-block} python
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import scipy as sc
import statistics
import arviz as az
import seaborn as sns
import scipy.stats as st
import pymc as pm
import xarray as xr

disaster_data = pd.Series(
    [4, 5, 4, 0, 1, 4, 3, 4, 0, 6, 3, 3, 4, 0, 2, 6,
    3, 3, 5, 4, 5, 3, 1, 4, 4, 1, 5, 5, 3, 4, 2, 5,
    2, 2, 3, 4, 2, 1, 3, 0, 2, 1, 1, 1, 1, 3, 0, 0,
    1, 0, 1, 1, 0, 0, 3, 1, 0, 3, 2, 2, 0, 1, 1, 1,
    0, 1, 0, 1, 0, 0, 0, 2, 1, 0, 0, 0, 1, 1, 0, 2,
    3, 3, 1, 0, 2, 1, 1, 1, 1, 2, 4, 2, 0, 0, 1, 4,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1]
)

years = np.arange(1851, 1962)

plt.plot(years, disaster_data, "o", markersize=8, alpha=0.4)
plt.ylabel("Disaster count")
plt.xlabel("Year")

avg_disasters = np.mean(disaster_data)

with pm.Model() as disaster_model:
    rate = pm.Exponential("rate", avg_disasters)
    disasters = pm.Poisson("disasters", rate, observed=0)

with disaster_model:
    trace = pm.sample(2000)

with disaster_model:
    axes_arr = az.plot_trace(trace)

az.summary(trace, hdi_prob=0.94, round_to=3)

with disaster_model:
    post_pred = pm.sample_posterior_predictive(trace)

az.plot_posterior(post_pred.posterior_predictive.disasters, hdi_prob=0.94)

az.summary(post_pred, hdi_prob=0.94, round_to=3)
```

````
