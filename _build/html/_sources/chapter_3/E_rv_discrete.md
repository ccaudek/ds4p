# ✏️ Esercizi

## Variabili casuali discrete

```{exercise}
:label: label-rv-discr-01

Da un grande numero di dati relativi ad un compito di attenzione svolto da pazienti OCD si ottiene la seguente distribuzione di massa di probabilità, dove $X$ è il tempo di completamento del compito:


| x    |  42  |  43  | 44   | 45   | 46   | 47   |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | 
| P(x) | 0.10 | 0.23 | 0.34 | 0.25 | 0.05 | 0.02 |

a. Si trovi il tempo medio di completamento del compito. 

b. Si trovi la deviazione standard del tempo necessario per completare questo compito, in questa popolazione.

```

````{solution} label-rv-discr-01
:class: dropdown

a. 43.54 

b. 1.2046
````

+++

```{exercise}
:label: label-rv-discr-02

Si consideri una roulette con il doppio 0: numeri da 1 a 36, metà rossi metà neri, 0 e doppio 0 verdi. Consideriamo la puntata su un numero.  

a. Si trovi la distribuzione di massa di probabilità di $X$. 

b. Si trovi il valore atteso di $X$.  

c. Si trovi la deviazione standard di $X$.
```

````{solution} label-rv-discr-02
:class: dropdown

a. -1 con probabilità 20/38; +1 con probabilità 18/38. 

b. -0.0526. 

c. 0.998614.
````

+++

```{exercise}
:label: label-rv-discr-03

Si consideri il gioco in cui, per ogni puntata di un euro, risultano i seguenti esiti possibili:

| Outcome	  	| -1.00 | 0.00 |  3.00 | 5.00	|
| ------------- | ----- | ---- | ----- | ------ | 
| Probability	|  0.30	| 0.40	| 0.20 | 0.10	|

Sia X la v.c. corrispondente all'esito della puntata di un euro nel gioco definito sopra.  Si calcoli la deviazione standard di X.
```

````{solution} label-rv-discr-03
:class: dropdown

```{code-block} python
import numpy as np
import pandas as pd

x = np.array([-1, 0, 3, 5])
px = np.array([0.3, 0.4, 0.2, 0.1])

ex = np.sum( x * px)
ex

np.sqrt(np.sum( x**2 * px) - ex**2)
```

La soluzione è 1.9899748742132397.
````

+++

```{exercise}
:label: label-rv-discr-04

Per la v.c. X = {1, 3, 5}, la distribuzione di probabilità è 1/4, 1/4, 1/2.  Si calcoli la varianza di X.
```

````{solution} label-rv-discr-04
:class: dropdown

2.75
````

+++

```{exercise}
:label: label-rv-discr-05

Sia X la variabile aleatoria che può assumere i valori 0, 1, 2, 3, 4, 5. Qui sotto è fornita la distribuzione di probabilità della variabile aleatoria X (a meno di una delle probabilità che è mancante)

|0    |   1    |  2     |    3   |    4    |     5|
| --- |--- |--- |--- |--- |--- |
|??   |0.45 | 0.24 | 0.12 |  0.09 | 0.05|

```

````{solution} label-rv-discr-05
:class: dropdown

1.57
````

+++

```{exercise}
:label: label-rv-discr-06
:class: dropdown

Si calcoli la deviazione standard della variabile aleatoria corrispondende al numero di punti che si ottengono dal lancio di un dado equilibrato.

```

````{solution} label-rv-discr-06
1.707
````

+++

```{exercise}
:label: label-rv-discr-07

Una moneta onesta viene lanciata 3 volte.  Sia X il numero di volte "testa".  Si calcoli il valore atteso di X.

```

````{solution} label-rv-discr-07
:class: dropdown

I valori possibili di X sono 0, 1, 2, 3, con probabilità, rispettivamente di 1/8, 3/8, 3/8, 1/8. Il valore atteso di X è 1.5.
````