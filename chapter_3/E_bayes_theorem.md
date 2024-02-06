# ✏️ Esercizi

## Teorema di Bayes

```{exercise}
:label: label-prob-bayes-theorem-01

Un esame del sangue rilieva correttamente il vampirisimo il 95% delle volte, $Pr(Positive|Vampire)$ = 0.95. Il test ha un tasso di falsi psitivi di $Pr(Positive | Mortal)$ = 0.01. Sappiamo anche che i vampiri sono rari -- circa lo 0.1% della popolazione, $Pr(Vampire)$ = 0.001. Si trovi la probabilità di essere un vampiro dato che il test ha dato un risultato positivo. (da Statistical rethinking)
```

````{solution} label-prob-bayes-theorem-01
:class: dropdown

Per calcolare $Pr(Vampire|Positive)$ applichiamo il teorema di Bayes: 
$Pr(Vampire | Positive) = \frac{Pr(Positive | Vampire) * Pr(Vampire)}{Pr(Positive)}$.

```{code-block} python
Pr_Positive_Vampire = 0.95
Pr_Positive_Mortal = 0.01
Pr_Vampire = 0.001
tmp = Pr_Positive_Vampire * Pr_Vampire
Pr_Positive = tmp + Pr_Positive_Mortal * (1 - Pr_Vampire)
Pr_Vampire_Positive = tmp / Pr_Positive
Pr_Vampire_Positive
```
La risposta è 0.08683729433272395.
````

+++

```{exercise}
:label: label-prob-bayes-theorem-02

Supponiamo che la probabilità che il tempo sia nuvoloso sia del 40%. Supponiamo inoltre che la probabilità di pioggia in un dato giorno sia del 20%. Supponiamo infine che la probabilità che il tempo sia nuvoloso in un giorno di pioggia sia dell'85%.

Se fuori è nuvoloso in un dato giorno, qual è la probabilità che quel giorno piova?
```

````{solution} label-prob-bayes-theorem-02
:class: dropdown

```{code-block} python
def bayesTheorem(pA, pB, pBA):
    return pA * pBA / pB

pRain = 0.2
pCloudy = 0.4
pCloudyRain = 0.85

bayesTheorem(pRain, pCloudy, pCloudyRain)
```

La risposta è 0.425.

````

+++

```{exercise}
:label: label-prob-bayes-theorem-03

Come sapete, i test Covid-19 sono comuni al giorno d'oggi, ma alcuni risultati dei test non sono veri. Assumiamo: un test diagnostico ha un'accuratezza del 99% e il 60% di tutte le persone testate ha il Covid-19. In tali circostanze, se un paziente risulta positivo, qual è la probabilità che abbia effettivamente il Covid-19?
```

````{solution} label-prob-bayes-theorem-03
:class: dropdown

```{code-block} python

```

La probabilità a posteriori di essere positivo dato un risultato positivo al test si trova con il teorema di Bayes: (probabilità a priori x verosimiglianza) / p(essere positivo).

La probabilità di essere positivo è 0.99 x 0.6 + 0.01 x 0.4 = 0.598.

Dunque, (0.6 x 0.99) / 0.598 = 0.993.

````

+++

```{exercise}
:label: label-prob-bayes-theorem-04

Come sapete, i test Covid-19 sono comuni al giorno d'oggi, ma alcuni risultati dei test non sono veri. Assumiamo: un test diagnostico ha un'accuratezza del 99% e il 60% di tutte le persone testate ha il Covid-19. In tali circostanze, se un paziente risulta positivo, qual è la probabilità che abbia effettivamente il Covid-19?
```

````{solution} label-prob-bayes-theorem-04
:class: dropdown

La probabilità a posteriori di essere positivo dato un risultato positivo al test si trova con il teorema di Bayes: (probabilità a priori x verosimiglianza) / p(essere positivo).

La probabilità di essere positivo è 0.99 x 0.6 + 0.01 x 0.4 = 0.598.

Dunque, (0.6 x 0.99) / 0.598 = 0.993.

````

+++

```{exercise}
:label: label-prob-bayes-theorem-05

Supponiamo che un test per l'utilizzo di un particolare droga sia sensibile al 97% e specifico al 95%. Cioè, il test produrrà il 97% di risultati veri positivi per i tossicodipendenti e il 95% di risultati veri negativi per i non tossicodipendenti. Supponiamo che lo 0.5% della popolazione generale faccia uso della droga. Qual è la probabilità che un individuo selezionato a caso con un test positivo sia un tossicodipendente?
```

````{solution} label-prob-bayes-theorem-05
:class: dropdown

```{code-block} python
def drug_user(prob_th=0.5,sensitivity=0.99,specificity=0.99,prevelance=0.01,verbose=True):
    """
    """
    p_user = prevelance
    p_non_user = 1-prevelance
    p_pos_user = sensitivity
    p_neg_user = specificity
    p_pos_non_user = 1-specificity
    
    num = p_pos_user*p_user
    den = p_pos_user*p_user+p_pos_non_user*p_non_user
    
    prob = num/den
    
    if verbose:
        if prob > prob_th:
            print("The test-taker could be an user")
        else:
            print("The test-taker may not be an user")

    return prob

p = drug_user(prob_th=0.5,sensitivity=0.97,specificity=0.95,prevelance=0.005)
print("Probability of the test-taker being a drug user is:", round(p, 3))
```

Anche con un test corretto al 97% per rilevare casi positivi e corretto al 95% per rifiutare casi negativi, la vera probabilità di essere un tossicodipendente con un risultato positivo è solo dell'8.9%.

````

+++

```{exercise}
:label: label-prob-bayes-theorem-06

In riferimento al problema precedente, si trovi la prevalenza nella popolazione tale per cui il test produca una probabilità di essere un tossicodipendente pari a 0.5.
```

````{solution} label-prob-bayes-theorem-06
:class: dropdown

Il modo più semplice di risolvere questo problema è di usare un ciclo for.

```{code-block} python
import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as st
import seaborn as sns

ps = []
pres = []
for pre in np.linspace(0.0, 0.1, num=10000):
    pres.append(pre)
    p = drug_user(
        prob_th=0.5, sensitivity=0.97, specificity=0.95, prevelance=pre, verbose=False
    )
    ps.append(p)

plt.figure(figsize=(10, 5))
plt.title("Probability of user with prevalence rate")
plt.plot(pres, ps, linestyle='-')
plt.grid(True)
plt.xlabel("Prevalence (percentage)")
plt.ylabel("Probability of being a user")
plt.show()
```

```{code-block} python
import pandas as pd 

df= pd.DataFrame()

df["prevalence"] = pres
df["post_prob"] = ps
df.head()
```

```{code-block} python
# find row with closest value to 0.5 in post_prob column
df_closest = df.iloc[(df['post_prob']-0.5).abs().argsort()[:1]]
print(df_closest)
```

La prevalenza nella popolazione deve essere circa uguale a 0.049.

````