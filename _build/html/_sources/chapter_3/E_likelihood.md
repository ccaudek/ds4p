# ✏️ Esercizi

## Verosimiglianza

```{exercise}
:label: label-likelihood-01

Supponiamo di avere osservato 12 successi in 16 prove bernoulliane.  Si trovi il valore della funzione di log-verosimiglianza in corrispondenza del valore $\theta$ = 0.6 (probabilità di successo).

```

````{solution} label-likelihood-01
:class: dropdown

```{code-block} python
import scipy.stats as st
st.binom.logpmf(k=12, n=16, p=0.6)	
```
-2.288478632617663

````

+++

```{exercise}
:label: label-likelihood-02

Supponiamo di avere osservato un dato proveniente da una distribuzione gaussiana, $X$ = 12. Sappiamo che, per tale distribuzione, $\sigma$ = 2. Si trovi il valore della funzione di log-verosimiglianza in corrispondenza del valore $\mu$ = 10.

```

````{solution} label-likelihood-02
:class: dropdown

```{code-block} python
import scipy.stats as st
st.norm.logpdf(12, loc=10, scale=2)
```

-2.112085713764618
````

+++


```{exercise}
:label: label-likelihood-03

Supponiamo di avere osservato il seguente campione proveniente da una distribuzione gaussiana, $X$ = {12, 14, 11, 9}. Sappiamo che, per tale distribuzione, $\sigma$ = 2. Si trovi il valore della funzione di log-verosimiglianza in corrispondenza del valore $\mu$ = 10.

```

````{solution} label-likelihood-03
:class: dropdown

```{code-block} python
import scipy.stats as st
import numpy as np

y = np.array([12, 14, 11, 9])

def log_likelihood(y, mu, sigma):
    return np.sum(st.norm.logpdf(y, loc=mu, scale=sigma))

log_likelihood(y=y, mu=10, sigma=2) 
```

-9.198342855058472
````
