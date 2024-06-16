# ✏️ Esercizi

## Probabilità congiunta

```{exercise}
:label: label-joint-prob-01

Si considerino le variabili causali $X \in \{0, 1, 2\}$ e $Y \in \{1, 2, 4\}$ con la seguente distribuzione di massa di probabilità congiunta:


| x\/y |  0   |   1  | 2    | 
| ---- | ---- | ---- | ---- |  
|  1   | 0.1  | 0.1  | 0.0  | 
|  2   | 0.2  | 0.1  | 0.1  | 
|  4   | 0.0  | 0.2  | 0.2  | 

Si trovi Cov(X,Y).
```

````{solution} label-joint-prob-01
:class: dropdown

```{code-block} python
import numpy as np

x = np.array([0, 1, 2])
y = np.array([1, 2, 4])
sample = [(i, j) for i in x for j in y]
sample

pmf = np.array([.1, .2, 0, .1, .1, .2, 0, .1, .2])
pmf.sum()

px = np.array([.3, .4, .3])
ex = np.sum(x * px)
ex

py = np.array([.2, .4, .4])
ey = np.sum(y * py)
ey

res = []
for i in range(9):
    res.append((sample[i][0] - ex) * (sample[i][1] - ey) * pmf[i])
sum(res)
```
0.5
````

+++

```{exercise}
:label: label-joint-prob-02

Le variabili causali $X$ e $Y$ sono indipendenti. La variabile $X$ ha la seguente distribuzione di massa di probabilità:

| x    |  1   |   2  | 3    | 
| ---- | ---- | ---- | ---- |  
| P(x) | 0.2  | 0.2  | 0.6  | 

La variabile $Y$ ha la seguente distribuzione di massa di probabilità:

| y    |  0   |   1  | 2    | 
| ---- | ---- | ---- | ---- |  
| P(y) | 0.4  | 0.3  | 0.3  | 

Si trovino E(X), E(Y), E(XY).
```

````{solution} label-joint-prob-02
:class: dropdown

E(X) = 2.4, E(Y) = 0.9, E(XY) = 2.16.
````
