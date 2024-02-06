# ✏️ Esercizi

## Calcolo delle probabilità

```{exercise}
:label: label-rv-01

Supponiamo di lanciare 3 dadi equilibrati a 4 facce marcate con 1, 2, 3, 4. Sia $X$ la somma dei valori ottenuti dal lancio dei tre dadi. Si trovi la probabilità $P(X) > 8$.
```

````{solution} label-rv-01
:class: dropdown

```{code-block} python
import numpy as np
import pandas as pd
import itertools as it
import math

die_rolls = list(it.product(range(1, 7), repeat=5))
results = np.arange(5, 31)
prob_distr = pd.DataFrame()
freq = sum(sum(rol) == results for rol in die_rolls)
prob_distr['py'] = freq / sum(freq)
prob_distr['y'] = results
prob_distr[prob_distr['y'] == 19]
```
La soluzione è 0.094522.

Oppure, in maniera più semplice:

```
die_rolls = list(it.product(range(1, 7), repeat=5))
n1 = sum(sum(rol) == 19 for rol in die_rolls)
n = len(die_rolls)
n1 / n
```

````
