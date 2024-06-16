# ✏️ Esercizi

## Calcolo delle probabilità

```{exercise}
:label: label-prob-01

Supponiamo di lanciare 3 dadi equilibrati a 4 facce marcate con 1, 2, 3, 4. Sia $X$ la somma dei valori ottenuti dal lancio dei tre dadi. Si trovi la probabilità $P(X) > 8$.
```

````{solution} label-prob-01
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

```{exercise}
:label: label-prob-02

Utilizzando il file condiviso su Google Drive, ogni studente inserirà il proprio nome e la data di compleanno nel formato specificato. Successivamente, il file Excel con i dati verrà importato in Python. L'obiettivo del problema è confrontare la predizione teorica calcolata risolvendo il "paradosso del compleanno" con i dati effettivamente ottenuti dagli studenti. Questo problema ci permetterà di confrontare la teoria con i dati reali e di analizzare quanto sia probabile che ci siano studenti con compleanni uguali all'interno della classe. Di seguito, trovate un esempio di come contare il numero di compleanni uguali utilizzando il codice Python.
```

````{solution} label-prob-02
:class: dropdown

```{code-block} python
def count_same_birthdays(birthday_list):
    same_birthdays = {}
    for name, birthday in birthday_list:
        if birthday in same_birthdays:
            same_birthdays[birthday].append(name)
        else:
            same_birthdays[birthday] = [name]

    return same_birthdays

# Example input with 5 students
birthday_list = [
    ("Mario Rossi", "agosto 3"),
    ("Giovanna Bianchi", "agosto 3"),
    ("Maria Neri", "agosto 3"),
    ("Francesco Ferrari", "giugno 12"),
    ("Alice Esposito", "maggio 26"),
    ("Giovanna Romano", "giugno 12"),
    ("Maria Gallo", "agosto 3"),
]

same_birthdays = count_same_birthdays(birthday_list)

# Print shared birthdays
for birthday, students in same_birthdays.items():
    if len(students) > 1:
        print(f"Compleanno {birthday}: {', '.join(students)}")
```

````
