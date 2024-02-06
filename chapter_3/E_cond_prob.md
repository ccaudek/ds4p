# ✏️ Esercizi

## Probabilità condizionata

```{exercise}
:label: label-prob-conditional_prob-01

Quale delle seguenti espressioni corrisponde all'affermazione: la probabilità che piova lunedì? (da Statistical rethinking)
1. Pr(pioggia)
2. Pr(pioggia | lunedì)
3. Pr(lunedì | pioggia)
4. Pr(pioggia, lunedì) / Pr(lunedì)
```

````{solution} label-prob-conditional_prob-01
:class: dropdown

Interpreto questa domanda come "la probabilità di pioggia dato che è lunedì". Ciò significa che le risposte (2) che (4) sono corrette.
````

+++

```{exercise}
:label: label-prob-conditional_prob-02

Quale delle seguenti affermazioni corrisponde all'espressione: Pr(lunedì | pioggia)? (da Statistical rethinking)

1. La probabilità di pioggia lunedì.
2. La probabilità di pioggia, dato che è lunedì.
3. La probabilità che sia lunedì, dato che sta piovendo.
4. La probabilità che sia lunedì e che piova.
```

````{solution} label-prob-conditional_prob-02
:class: dropdown

Solo la risposta (3) corrisponde all'espressione Pr(lunedì | pioggia).
````

+++

```{exercise}
:label: label-prob-conditional_prob-03

Quale delle seguenti espressioni corrisponde all'affermazione: la probabilità che sia lunedì, dato che sta piovendo? (da Statistical rethinking)

1. Pr(lunedì | pioggia)
2. Pr(pioggia | lunedì)
3. Pr(pioggia | lunedì) Pr(lunedì)
4. Pr(pioggia | lunedì) Pr(lunedì) / Pr(pioggia)
5. Pr(lunedì | pioggia) Pr(pioggia) / Pr(lunedì)
```

````{solution} label-prob-conditional_prob-03
:class: dropdown

Ci sono ancora due risposte corrette. L'opzione di risposta (1) è la notazione standard per la probabilità condizionata. L'opzione di risposta (4) è equivalente, poiché questo è il teorema di Bayes.
````

+++

```{exercise}
:label: label-prob-conditional_prob-04

Per due eventi,  𝐴 e 𝐵, 𝑃(𝐴)=0.73, 𝑃(𝐵)=0.48 e 𝑃(𝐴∩𝐵)=0.29.

1. Trova  𝑃(𝐴∣𝐵).
2. Trova  𝑃(𝐵∣𝐴).
3. Determina se 𝐴 e 𝐵 sono indipendenti.
```

````{solution} label-prob-conditional_prob-04
:class: dropdown

1. 0.6 
2. 0.4 
3. non indipendenti
````

+++

```{exercise}
:label: label-prob-conditional_prob-05

Per due eventi indipendenti  𝐴  e  𝐵,  𝑃(𝐴)=0.81  e  𝑃(𝐵)=0.27. Trova

1. 𝑃(𝐴∩𝐵).
2. 𝑃(𝐴∣𝐵).
3. 𝑃(𝐵∣𝐴).
```

````{solution} label-prob-conditional_prob-05
:class: dropdown

1. 0.22 
2. 0.81 
3. 0.27
````

+++

```{exercise}
:label: label-prob-conditional_prob-06

Per due eventi mutuamente esclusivi 𝐴 e 𝐵, 𝑃(𝐴)=0.17 e 𝑃(𝐵)=0.32.

1. Trova 𝑃(𝐴∣𝐵).
2. Trova 𝑃(𝐵∣𝐴).
```

````{solution} label-prob-conditional_prob-06
:class: dropdown

1. 0
2. 0
````

+++

```{exercise}
:label: label-prob-conditional_prob-07

Calcola le seguenti probabilità in relazione al lancio di un singolo dado equilibrato.

1. La probabilità che il lancio dia un numero pari.
2. La probabilità che il lancio dia un numero pari, dato che non è un due.
3. La probabilità che il risultato dia un numnero pari, dato che non è uno.
```

````{solution} label-prob-conditional_prob-07
:class: dropdown

1. 0.5 
2. 0.4 
3. 0.6
````

+++

```{exercise}
:label: label-prob-conditional_prob-08

In un certo collegio, il 25% degli studenti è stato bocciato in matematica,
il 15% è stato bocciato in chimica, e il 10% è stato bocciato sia in
matematica che in chimica. Viene scelto a caso uno studente. Se lo studente è stato 
bocciato in chimica, qual è la probabilità che sia stato bocciato anche in matematica?
```

````{solution} label-prob-conditional_prob-08
:class: dropdown

Sia M = {studenti bocciati in matematica} e C = {studenti bocciati in chimica},
allora: P(M) = 0.25, P(C) = 0.15, P(M∩C) = 0.10.
La probabilità che uno studente sia stato bocciato in matematica, se si sa
che è stato bocciato in chimica, è P(M|C) = P(M∩C) / P(C) = 0.10 / 0.15 = 2/3.
````

+++

```{exercise}
:label: label-prob-conditional_prob-09

In un certo collegio, il 25% degli studenti è stato bocciato in matematica,
il 15% è stato bocciato in chimica, e il 10% è stato bocciato sia in
matematica che in chimica. Viene scelto a caso uno studente. Se lo studente è stato
bocciato in matematica, qual è la probabilità che sia stato bocciato anche in chimica?
```

````{solution} label-prob-conditional_prob-09
:class: dropdown

La probabilità che uno studente sia stato bocciato in chimica, se si sa che è
stato bocciato in matematica, è P(C|M) = P(C∩M) / P(M) = 0.10 / 0.25 = 2/5.
````

+++

```{exercise}
:label: label-prob-conditional_prob-10

In un certo collegio, il 25% degli studenti è stato bocciato in matematica,
il 15% è stato bocciato in chimica, e il 10% è stato bocciato sia in
matematica che in chimica. Viene scelto a caso uno studente. Qual è la
probabilità che sia stato bocciato in matematica o in chimica?
```

````{solution} label-prob-conditional_prob-10
:class: dropdown

La probabilità che sia stato bocciato in matematica o in chimica, è
P(M∪C) = P(M) + P(C) − P(M∩C) = 0.25 + 0.15 − 0.10 = 0.30.
````



