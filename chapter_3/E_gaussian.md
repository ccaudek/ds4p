# ✏️ Esercizi

## Distribuzione Normale

```{exercise}
:label: label-distributions-gauss-01

Lo Scholastic Aptitude Test (SAT) è un test attitudinale richiesto per
l'ammissione ai college degli Stati Uniti. I punteggi SAT si distribuiscono normalmente
con media 500 e deviazione standard 100. Supponiamo che un college ammetta soltanto
studenti che ottengono punteggi nel 15 percento superiore della
distribuzione. Qual è il punteggio minimo per potere essere ammessi?
```

````{solution} label-distributions-gauss-01
:class: dropdown

```{code-block} python
import scipy.stats as st

st.norm.ppf(0.85, 500, 100)
```
La soluzione è 603.643338949379.
````

+++

```{exercise}
:label: label-distributions-gauss-02

Lo Scholastic Aptitude Test (SAT) è un test attitudinale richiesto per
l'ammissione ai college degli Stati Uniti. I punteggi SAT si distribuiscono normalmente
con media 500 e deviazione standard 100. Supponiamo che John Doe ottenga un punteggio
pari a 628.  Se vengono presentate 900 domande di ammissione, ci possiamo aspettare
che il numero di studenti con un punteggio superiore a quello di John Doe sia
approssimativamente uguale a:
```

````{solution} label-distributions-gauss-02
:class: dropdown

```{code-block} python
import scipy.stats as st

(1 - st.norm.cdf(628, 500, 100)) * 900
```
La soluzione è 90.
````

+++

```{exercise}
:label: label-distributions-gauss-03

Lo Scholastic Aptitude Test (SAT) è un test attitudinale richiesto per
l'ammissione ai college degli Stati Uniti. I punteggi SAT si distribuiscono normalmente
con media 500 e deviazione standard 100. Supponiamo che ad un college facciano
domanda di ammissione 800 candidati.  Ci possiamo aspettare che il seguente
numero di candidati ottenga un punteggio compreso tra 550 e 600:
```

````{solution} label-distributions-gauss-03
:class: dropdown

```{code-block} python
import scipy.stats as st

(st.norm.cdf(600, 500, 100) - st.norm.cdf(550, 500, 100)) * 800
```

La soluzione è 120 (119.90).
````

+++

```{exercise}
:label: label-distributions-gauss-04

Viene creato un test per misurare il livello di motivazione degli studenti
delle scuole superiori. I punteggi del test seguono approssimativamente la distribuzione
normale con media 25 e deviazione standard 6. Maggiore il punteggio nel test,
maggiore il livello di motivazione dello studente. A Mario Rossi viene detto che
solo il 35% degli studenti che hanno completato il test mostra un livello di
motivazione superiore al suo.  Quale punteggio ha ottenuto Mario Rossi nel test?
```

````{solution} label-distributions-gauss-04
:class: dropdown

```{code-block} python
import scipy.stats as st

st.norm.ppf(0.65, 25, 6)
```

La soluzione è 27.311922798445405.
````

+++

```{exercise}
:label: label-distributions-gauss-05

L'altezza e il peso sono due misure usate per monitorare la crescita dei bambini.
La World Health Organization misura lo sviluppo infantile confrontando il peso di
bambini aventi la stessa età e lo stesso genere.  Nel 2009, il peso delle
bambine alte 80 cm si distribuiva normalmente con media μ = 10.2 kg e
deviazione standard σ = 0.8 kg. Nel 2009, qual era la proporzione di bambine alte
80 cm con un peso inferiore a 7.9 kg?
```

````{solution} label-distributions-gauss-05
:class: dropdown

```{code-block} python
import scipy.stats as st

st.norm.cdf(7.9, 10.2, 0.8)
```

La soluzione è 0.0020201374899460095.
````

+++

```{exercise}
:label: label-distributions-gauss-06

Supponiamo che l'altezza delle bambine di 5 anni segua la distribuzione normale
con una media di 115 cm. Sappiamo che solo il 5% delle bambine di 5 anni ha un'altezza
superiore a 125 cm.  Si calcoli la deviazione standard della distribuzione dell'altezza
delle bambine di 5 anni.
```

````{solution} label-distributions-gauss-06
:class: dropdown

```{code-block} python
import scipy.stats as st

# st.norm.ppf(0.95, 0, 1) = (x - mu) / sigma
x = 125
mu = 115
sigma = (x - mu) / st.norm.ppf(0.95, 0, 1)
sigma
```

La soluzione è 6.0795683191176915.
````

+++

```{exercise}
:label: label-distributions-gauss-07

La durata della gravidanza dal concepimento alla nascita del bambino segue
approssimativamente la distribuzione normale con media di 266 giorni e deviazione
standard di 16 giorni. Quale proporzione di gravidanze ha una durata compresa tra
240 e 270 giorni?
```

````{solution} label-distributions-gauss-07
:class: dropdown

```{code-block} python
import scipy.stats as st

st.norm.cdf(270, 266, 16) - st.norm.cdf(240, 266, 16)
```

La soluzione è 0.5466250462677041.
````

+++

```{exercise}
:label: label-distributions-gauss-08

La durata della gravidanza dal concepimento alla nascita del bambino segue
approssimativamente la distribuzione normale con media di 266 giorni e deviazione
standard di 16 giorni. Qual è la durata che comprende il 70% delle gravidanze aventi
la durata minore?
```

````{solution} label-distributions-gauss-08
:class: dropdown

```{code-block} python
import scipy.stats as st

st.norm.ppf(.70, 266, 16)
```

La soluzione è 274.39040820332866.
````

+++

```{exercise}
:label: label-distributions-gauss-09

In ciascun anno vengono bruciati in media 4300 acri di foresta in New Mexico. Il numero di acri bruciati nel corso degli anni segue approssimativamente la distribuzione normale
con una deviazione standard di 750 acri. Qual è la probabilità che in un dato anno
venga bruciata una superficie compresa tra 2500 e 4200 acri?
```

````{solution} label-distributions-gauss-09
:class: dropdown

```{code-block} python
import scipy.stats as st

(st.norm.cdf(4200, 4300, 750) - st.norm.cdf(2500, 4300, 750))
```

La soluzione è 0.43876734745178986.
````
