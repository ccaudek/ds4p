# ✏️ Esercizi

## Inferenza su una media

```{exercise}
:label: label-one-mean-01

L’ispettore sanitario della città desidera determinare il numero medio di colonie di E. coli (frequenze) per 100 mL d’acqua in una popolare spiaggia cittadina. Si supponga che il numero di batteri per litro d’acqua segua una distribuzione normale con media µ e deviazione standard nota pari a σ = 15. Raccoglie 10 campioni d’acqua e trova i seguenti conteggi dei batteri: 185 200 225 208 194 217 220 203 206 190. Se il conteggio medio vero supera 200, la spiaggia è considerata non sicura per la balneazione.

(1) Si trovi la distribuzione a posteriori del numero di batteri assumendo una distribuzione a priori gaussiana di media 200 e deviazione standard 20. Si interpreti il risultato ottenuto. (2) Si calcoli l'intervallo di credibilità al 95% per il parametro $\mu$ (numero di batteri).  Si interpreti il risultato ottenuto.
```

````{solution} label-one-mean-01
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

y = np.array([185, 200, 225, 208, 194, 217, 220, 203, 206, 190])

model = pm.Model()

with model:
    # Priors
    mu = pm.Normal("mu", mu=200, sigma=20)
    # Likelihood (sampling distribution) of observations
    Y_obs = pm.Normal("Y_obs", mu=mu, sigma=15, observed=y)

with model:
    idata = pm.sample()

az.summary(idata, hdi_prob=0.95,  round_to=2)

az.plot_trace(idata)

posterior = az.extract(idata)

np.mean(posterior["mu"] > 200)
```

````
