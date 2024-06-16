# ✏️ Esercizi

## Distribuzione binomiale

```{exercise}
:label: label-binomial-01

Sia X una v.c. binomiale di parametri $n$ = 5 e $p$ = 0.5. Si trovino le probabilità indicate.

a. $P(X \leq 3$

b. $P(X \geq 3$

c. $P(X == 3$

d. $P(X == 0)$

e. $P(X == 5)$
```

````{solution} label-binomial-01
:class: dropdown

a. 0.8125 

b. 0.5000 

c. 0.3125 

d. 0.0313 

e. 0.0312

````

+++

```{exercise}
:label: label-binomial-02

Una moneta sbilanciata ha probabilità di testa uguale a 2/3. La moneta è lanciata 10 volte. 

a. Si trovi la probabilità di ottenere testa non più di 5 volte.

b. Si trovi la probabilità di ottenere testa più spesso che croce.
```

````{solution} label-binomial-02
:class: dropdown

```{code-block} python
import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as st

st.binom.cdf(5, 10, 2/3)
```
0.21312808006909523


0.7868719199309048
````

+++

```{exercise}
:label: label-binomial-03

Uno psicologo ha messo a punto un intervento per fare in modo che almeno la metà dei suoi pazienti riescano ad eseguire un certo compito. In un campione casuale di 20 pazienti 14 riescono a completare il compito. Qual è la probabilità che 14 o più pazienti su 20 riescano a completare il compito se nella popolazione la proporzione di coloro che riesco a fare questo è solo pari a 0.5?
```

````{solution} label-binomial-03
:class: dropdown

0.0577
````

+++

```{exercise}
:label: label-binomial-04
Determinare se le seguenti situazioni suggeriscono una variabile casuale con una distribuzione binomiale:

a) Il numero di domande corrette se si indovina casualmente in un quiz di 20 domande a scelta multipla in cui ogni domanda ha 4 possibili risposte.
b) Il numero di persone con gli occhi blu in un gruppo di 10 persone estratte da una stanza di 30 persone senza ripetizione.
c) Il numero di cinguettii di uccelli che si possono sentire in un giorno se il numero medio di cinguettii all'ora è 15.
d) Il numero di teste viste in 30 lanci di una moneta.
e) Il numero di ciascuna delle 3 specie di fiori presenti in una raccolta di 100 fiori.
f) Il numero di lanci di due dadi che danno un totale primo se i dadi vengono lanciati 50 volte.
g) Il numero di 400 soggetti che assumono aspirina che hanno indicato di aver avuto un mal di testa lo stesso giorno in cui hanno assunto questo farmaco.

```

````{solution} label-binomial-04
:class: dropdown

a) Sì, questo suggerisce una variabile casuale con una distribuzione binomiale
b) No. Le "prove" (le persone estratte dalla stanza e testate se hanno gli occhi blu o meno) non sono indipendenti. Man mano che vengono estratte persone con gli occhi blu dalla stanza, la probabilità che la prossima persona estratta dalla stanza abbia gli occhi blu diminuisce.
c) No. Non c'è un limite superiore al numero di cinguettii che si potrebbero sentire. In una situazione binomiale, il numero massimo di successi è limitato dal numero fisso di prove.
d) Sì, questo suggerisce una variabile casuale con una distribuzione binomiale
e) No. Ci sono più di due risultati possibili. Se una specie potesse essere il "successo" e un'altra essere il "fallimento", quale sarebbe la terza specie?
f) Sì, questo suggerisce una variabile casuale con una distribuzione binomiale
g) Sì, questo suggerisce una variabile casuale con una distribuzione binomiale

````
