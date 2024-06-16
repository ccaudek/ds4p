# ✏️ Esercizi 

I presenti esercizi si possono risolvere "a mano" (cosa che incoraggio a fare in maniera preliminare per capire meglio). Presento comunque la soluzione usando Python, così ci abituiamo ad usarlo.

```{exercise}
:label: label-key-notions-sums-01

Si valuti $\sum_{r=1}^4 r^2$.
```

````{solution} label-key-notions-sums-01
:class: dropdown

```{code-block} python
import numpy as np

np.sum([r**2 for r in range(1, 5)])
```
La soluzione è 30.
````

+++

```{exercise}
:label: label-key-notions-sums-02

Sia $X$ = $\{2, 2, 1, 3, 1\}$.
Si valuti $\sum_{i=1}^5 x_i$.
```

````{solution} label-key-notions-sums-02
:class: dropdown

In tutti gli esercizi utilizzo un array NumPy anziché una lista Python. La differenza è che una lista Python può contenere dati di tipi diversi, mentre tutti gli elementi in un array NumPy sono omogenei. Ne segue che un array NumPy numerico è simile ad un vettore numerico e quindi ad esso possiamo applicare le operazioni aritmetiche.

```{code-block} python
import numpy as np

x = np.array([2, 2, 1, 3, 1])
np.sum(x)
```
La soluzione è 9.
````

+++

```{exercise}
:label: label-key-notions-sums-03

Sia $X$ = $\{3, 1, 2, 9, 1\}$.
Si valuti $\sum_{i=1}^5 3 x_i$.
```

````{solution} label-key-notions-sums-03
:class: dropdown

```{code-block} python
import numpy as np

x = np.array([3, 1, 2, 9, 1])
np.sum(3*x)
```
La soluzione è 48. Oppure

```{code-block} python
import numpy as np

x = np.array([3, 1, 2, 9, 1])
3*np.sum(x)
```
````

+++

```{exercise}
:label: label-key-notions-sums-04

Sia $a$ = 10.
Si valuti $\sum_{i=1}^4 a$.
```

````{solution} label-key-notions-sums-04
:class: dropdown

La soluzione è $4 \cdot 10 = 40$. Se vogliamo usare un ciclo `for`:

```{code-block} python
a = 10
s = 0
for i in range(1, 5):
    s += a
print(s)
```
````

+++

```{exercise}
:label: label-key-notions-sums-05

Siano $a$ = 3 e $X$ = $\{9, 2, -1, 4, 1\}$.
Si valuti $\sum_{i=1}^5 a x_i$.
```

````{solution} label-key-notions-sums-05
:class: dropdown

```{code-block} python
import numpy as np

a = 3
x = np.array([9, 2, -1, 4, 1])
np.sum(a * x)
```
La soluzione è 45. In maniera equivalente potevamo scrivere `a*np.sum(x)`.
````

+++

```{exercise}
:label: label-key-notions-sums-06

Siano $a$ = 2 e $X$ = $\{8, -2, 1, 1, 0\}$.
Si valuti $\sum_{i=1}^5 (a + x_i)$.
```

````{solution} label-key-notions-sums-06
:class: dropdown

```{code-block} python
import numpy as np

a = 2
x = np.array([8, -2, 1, 1, 0])
5*a + np.sum(x)
```
La soluzione è 18.
````

+++

```{exercise}
:label: label-key-notions-sums-07

Siano $X = \{8, -2, 1, 1, 0\}$ e $Y = \{3, 2, 6, -1, 9\}$.
Si valuti $\sum_{i=1}^5 (x_i + y_i)$.
```

````{solution} label-key-notions-sums-07
:class: dropdown

```{code-block} python
import numpy as np

x = np.array([8, -2, 1, 1, 0])
y = np.array([3, 2, 6, -1, 9])
np.sum(x + y)
```
La soluzione è 27.
````

+++

```{exercise}
:label: label-key-notions-sums-08

Siano $X = \{8, -2, 1, 1, 0\}$ e $Y = \{3, 2, 6, -1, 9\}$.
Si valuti $\sum_{i=1}^5 (x_i \cdot y_i)$.
```

````{solution} label-key-notions-sums-08
:class: dropdown

Non è possibile sommare elemento per elemento una lista.  Possiamo procedere così:

```{code-block} python
import numpy as np

x = np.array([1, 2, 3])
y = np.array([4, 5, 6])

(x + y).sum()
```
````

+++

```{exercise}
:label: label-key-notions-sums-09

Sia $X = \{4, -1, 5, 6, 1\}$.
Si valuti $\sum_{i=1}^5 (x_i - \bar{x})$.
```

````{solution} label-key-notions-sums-09
:class: dropdown

```{code-block} python
import numpy as np

x = np.array([4, -1, 5, 6, 1])
(x - np.mean(y)).mean()
```
La soluzione è 0.
````

+++

```{exercise}
:label: label-key-notions-sums-10

Sia $X = \{4, -1, 5, 6, 1\}$.
Si valuti $\frac{\sum_{i=1}^5 (x_i - \bar{X})^2}{5}$.
```

````{solution} label-key-notions-sums-10
:class: dropdown

```{code-block} python
import numpy as np

x = np.array([4, -1, 5, 6, 1])
x.var()
```
La soluzione è 6.8.
````
