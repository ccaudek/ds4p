# ✏️ Esercizi

```{exercise}
:label: ex-eda-pensuins-1

Si importi il file `penguins.csv` e si verifichi la presenza di dati mancanti. Se ci sono dei dati mancanti li si escluda. Si trovi la proporzione di osservazioni che sono state raccolte sull'isola Dream.
```

````{solution} ex-eda-pensuins-1
:class: dropdown
:label: sol-eda-pensuins-1

```{code-block} python
import numpy as np 
import pandas as pd

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)
df.shape

df.value_counts('island', normalize=True)
```

il 36.9% delle osservazioni è relativa all'isola Dream.
````

+++

```{exercise}
:label: ex-eda-pensuins-2

Per i dati dell'esercizio {ref}`ex-eda-pensuins-1`, si trovino la media e la deviazione standard, quale statistica descrittiva, della variabile `body_mass_g`. Si verifichi il risultato applicando la formula della deviazione standard.
```

````{solution} ex-eda-pensuins-2
:class: dropdown
:label: sol-eda-pensuins-2

```{code-block} python
import numpy as np 
import pandas as pd

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)

df['body_mass_g'].mean()
df['body_mass_g'].std(ddof=0)

y = df['body_mass_g']

def mystd(x):
    vx = np.sum((x - np.mean(x))**2) / len(x)
    std = np.sqrt(vx)
    return std

mystd(y)
```
La media è 4207.057057057057; la deviazione standard è 804.0058601595629.
````

+++

```{exercise}
:label: ex-eda-penguins-3

Si ripeta l'esercizio {ref}`ex-eda-pensuins-2` usando solo i dati dell'isola Biscoe.
```

````{solution} ex-eda-penguins-3
:class: dropdown
:label: sol-eda-penguins-3

```{code-block} python
import numpy as np 
import pandas as pd

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)

df[df['island'] == 'Biscoe']['body_mass_g'].mean()
df[df['island'] == 'Biscoe']['body_mass_g'].std(ddof=0)
```
La media è 4719.171779141105; la deviazione standard è 788.4303859944841.
````

+++

```{exercise}
:label: ex-eda-penguins-4

Per i dati dell'esercizio {ref}`ex-eda-penguins-3`, si costruisca un istogramma per verificare il tipo di distribuzione dei dati. Si verifichi se, per questi dati, è plausibile la regola $s ≈ 1.4281 MAD$. 
```

````{solution} ex-eda-penguins-4
:class: dropdown
:label: sol-eda-penguins-4

```{code-block} python
import numpy as np 
import pandas as pd

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)

df[df['island'] == 'Biscoe']['body_mass_g'].plot.hist()

y = df[df['island'] == 'Biscoe']['body_mass_g']
y

mad = np.median(np.abs(y - np.median(y)))
mad

1.4826 * mad
```

Anche se i dati mostrano una leggera asimmetria negativa, la regola $s ≈ 1.4281 MAD$ descrive in maniera approssimativa quello che succede nel campione. Questo ci offre un modo per interpretare la deviazione standard.
````

+++

```{exercise}
:label: ex-eda-penguins-5

Per dati che si distribuiscono in maniera approssimativamente Normale, ci possiamo aspettare che il 95% dei dati sia compreso nell'intervallo $\bar{y} \pm 2 s$. Si verifichi questa affermazione usando i dati dei pinguini maschi che sono stati osservati sull'isola Dream prima del 2009.
```

````{solution} ex-eda-penguins-5
:class: dropdown
:label: sol-eda-penguins-5

```{code-block} python
import numpy as np 
import pandas as pd

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)

eval_string = "island == 'Dream' & sex == 'male' & year < 2009"
y = df.query(eval_string)['flipper_length_mm']
y.hist()
y.quantile(0.975) - y.quantile(0.025)
4 * y.std(ddof=0)
```

Nel caso presente, la "regola empirica" è valida.
````

+++

```{exercise}
:label: ex-eda-penguins-6

Si considerino le osservazioni relative all'isola Biscoe e alla specie Adelie. Esaminiamo la variabile `flipper_length_mm`. Per questa variabile, si trovino gli eventuali valori *outlier* costruendo un boxplot. Dopo avere eliminato gli *outlier*, si calcoli la media.
```

````{solution} ex-eda-penguins-6
:class: dropdown
:label: sol-eda-penguins-6

```{code-block} python
import numpy as np 
import pandas as pd

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)

eval_string = "island == 'Biscoe' & species == 'Adelie'"
y = df.query(eval_string)['flipper_length_mm']
y.hist()
newdf = pd.DataFrame(y)
_ = newdf.boxplot(column=['flipper_length_mm'])  
q1 = y.quantile(0.25)
q3 = y.quantile(0.75)
IQR = q3 - q1
outliers = newdf[((newdf < (q1 - 1.5*IQR)) | (newdf > (q3 + 1.5*IQR)))]
outliers.dropna(subset=['flipper_length_mm'])
newdf2 = newdf[newdf['flipper_length_mm'] > 172]
newdf2['flipper_length_mm'].mean()
```
````

+++

```{exercise}
:label: ex-eda-penguins-7

Per i dati dell'esercizio {ref}`ex-eda-pensuins-1`, dopo avere eliminato i dati mancanti, si costruisca un violin plot che include uno strip plot della variabile `flipper_length_mm` in funzione di `species`.

```

````{solution} ex-eda-penguins-7
:class: dropdown
:label: sol-eda-penguins-7

```{code-block} python
import numpy as np 
import pandas as pd
import seaborn as sns

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)

ax = sns.violinplot(
    data=df,
    x = 'species',
    y = 'flipper_length_mm',
    color = '.8'
)

ax = sns.stripplot(
    data = df,
    x = 'species',
    y = 'flipper_length_mm',
    palette = 'colorblind'
)
```
````

+++

```{exercise}
:label: ex-eda-penguins-8

Per i dati dell'esercizio {ref}`ex-eda-pensuins-1`, dopo avere eliminato i dati mancanti, si consideriano solo i dati dei pinguini femmina che non si trovano sull'isola Biscoe. Si trovi la deviazione standard, quale statistica inferenziale, per le variabili `bill_length_mm`	 e `bill_depth_mm`, separatamente per ciascuna specie.
```

````{solution} ex-eda-penguins-8
:class: dropdown
:label: sol-eda-penguins-8

```{code-block} python
import numpy as np 
import pandas as pd

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)

eval_string = "island != 'Biscoe' & sex == 'female'"
newdf = df.query(eval_string)
newdf.groupby("species")[["bill_length_mm", "bill_depth_mm"]].std(ddof=1)
```
````

+++

```{exercise}
:label: ex-eda-penguins-9

Per i dati dell'esercizio {ref}`ex-eda-pensuins-1`, dopo avere eliminato i dati mancanti, si consideriano solo le osservazioni raccolte nel 2009. Si trovi il numero di osservazioni e la media per le variabili 'bill_length_mm' e 'bill_depth_mm', separatamente per ciascuna specie e ciascun genere.
```

````{solution} ex-eda-penguins-9
:class: dropdown
:label: sol-eda-penguins-9

```{code-block} python
import numpy as np 
import pandas as pd

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)

newdf = df[df['year'] == 2008]
summary_stats = (newdf.loc[:, ['species', 'sex', 'bill_length_mm', 'bill_depth_mm']]
                         .groupby(['species', 'sex'])
                         .aggregate(['mean', 'count']))
summary_stats.round(2)
```
````

+++

```{exercise}
:label: ex-eda-1

Si consideri la variabile x = 28, 16, 40, 21, 33, 15, 42, 13, 11, 14, 96. Si calcoli il valore soglia che, in un boxplot, separa i valori anomali dal massimo numero possibile che può essere assunto dal valore adiacente superiore.
```

````{solution} ex-eda-1
:class: dropdown
:label: sol-eda-1

69.5
````

+++

```{exercise}
:label: ex-eda-2

Si consideri la variabile x = 28, 16, 40, 21, 33, 15, 42, 13, 11, 14, 96. Si calcoli il valore soglia che, in un boxplot, separa i valori anomali dal massimo numero possibile che può essere assunto dal valore adiacente superiore.
```

````{solution} ex-eda-2
:class: dropdown
:label: sol-eda-2

0.83
````

+++

```{exercise}
:label: ex-eda-3

Si scelga l’affermazione più appropriata per descrivere la correlazione.

a.
Il coefficiente di correlazione r di Pearson quantifica la relazione tra due variabili.

b.
Il coefficiente di correlazione r di Pearson quantifica la relazione tra due variabili ordinali.

c.
Il coefficiente di correlazione r di Pearson quantifica la relazione lineare tra due variabili.

d.
Il coefficiente di correlazione r di Pearson ci dice se esiste un’associazione tra due variabili oppure se non esiste.

e.
Il coefficiente di correlazione r di Pearson non può essere calcolato se la relazione tra due variabili è curvilinea.
```

````{solution} ex-eda-3
:class: dropdown
:label: sol-eda-3

Il coefficiente di correlazione r di Pearson quantifica la relazione lineare tra due variabili.
````


```{exercise}
:label: ex-eda-4

Si scelga l’affermazione più appropriata per descrivere la correlazione.

a.
Tanto più il coefficiente di correlazione 𝑟
 di Pearson si avvicina a -1 tanto più forte è l’associazione lineare tra 𝑋
 e 𝑌.

b.
Tanto più il coefficiente di correlazione 𝑟
 di Pearson si avvicina a -1 o a +1 tanto più forte è l’associazione lineare tra 𝑋
 e 𝑌.

c.
Tanto più il coefficiente di correlazione 𝑟
 di Pearson si avvicina a 0.5 tanto più forte è l’associazione lineare tra 𝑋
 e 𝑌.


d.
Tanto più il coefficiente di correlazione 𝑟
 di Pearson si avvicina a +1 tanto più forte è l’associazione lineare tra 𝑋
 e 𝑌.

e.
Tanto più il coefficiente di correlazione 𝑟
 di Pearson si avvicina a 0 tanto più forte è l’associazione lineare tra 𝑋
 e 𝑌.
```

````{solution} ex-eda-4
:class: dropdown
:label: sol-eda-4

Tanto più il coefficiente di correlazione 𝑟 di Pearson si avvicina a -1 o a +1 tanto più forte è l’associazione lineare tra 𝑋 e 𝑌.
````

+++

```{exercise}
:label: ex-eda-5

Si scelga l’affermazione corretta.

a.
Se il coefficiente di correlazione 𝑟
 di Pearson è 0 allora non vi è associazione tra 𝑋
 e 𝑌
.


b.
Se il coefficiente di correlazione 𝑟
 di Pearson è 0 allora 𝑋
 e 𝑌
 sono perfettamente associate.


c.
Se il coefficiente di correlazione 𝑟
 di Pearson è 0 allora 𝑋
 e 𝑌
 sono due grandezze incommensurabili.


d.
Se il coefficiente di correlazione 𝑟
 di Pearson è 0 allora non c'è associazione lineare tra 𝑋
 e 𝑌
.


e.
Se il coefficiente di correlazione 𝑟
 di Pearson è 0 allora c’è un’associazione curvilinea tra 𝑋
 e 𝑌
.
```

````{solution} ex-eda-5
:class: dropdown
:label: sol-eda-5

Se il coefficiente di correlazione 𝑟
 di Pearson è 0 allora non c'è associazione lineare tra 𝑋
 e 𝑌
.
````

+++
```{exercise}
:label: ex-eda-6

Si scelga l’affermazione corretta.

a.
Il valore del coefficiente di correlazione 𝑟
 di Pearson cambia se viene cambiata l’unità di misura delle variabili 𝑋
 e 𝑌
.

b.
Il valore del coefficiente di correlazione 𝑟
 di Pearson non cambia se prendiamo il logaritmo di una delle due variabili.

c.
Il valore del coefficiente di correlazione 𝑟
 di Pearson non cambia se prendiamo il logaritmo di entrambe le variabili.

d.
Il valore del coefficiente di correlazione 𝑟
 di Pearson non cambia se viene cambiata l’unità di misura delle variabili 𝑋
 e 𝑌.

e.
Il valore del coefficiente di correlazione 𝑟
 di Pearson non cambia se moltiplichiamo per 0 una delle due variabili.
````


````{solution} ex-eda-6
:class: dropdown
:label: sol-eda-6

Il valore del coefficiente di correlazione 𝑟
 di Pearson non cambia se viene cambiata l’unità di misura delle variabili 𝑋
 e 𝑌.
````

+++

```{exercise}
:label: ex-eda-7

Consideriamo due variabili continue, 𝑋
 e 𝑌
. Sappiamo che la covarianza tra 𝑋
 e 𝑌
 è 23.9768
 e che la correlazione tra 𝑋
 e 𝑌
 è 0.6911
. Sapendo che le medie di 𝑋
 e 𝑌
 sono, rispettivamente, uguali a 123.4547 e 253.8992, e sapendo che la deviazione standard di 𝑋
 è 4.182
, si trovi la deviazione standard di 𝑌
.
```

````{solution} ex-eda-7
:class: dropdown
:label: sol-eda-7

8.3
````

+++

```{exercise}
:label: ex-eda-8

Sia 𝑋 = {39, 46, 3, 25, 2, 13, 40, 44, 12, 42, 20, 32, 37, 43, 48}. Si trovi la distribuzione di frequenze assolute per la partizione di 𝑋 in 5 classi di eguale ampiezza (0-10, 10-20, …, 40-50). Si utilizzino intervalli chiusi a destra e aperti a sinistra. Nelle alternative di risposta, i numeri sono ordinati in modo tale che il primo corrisponde alla frequenza assoluta della classe inferiore, il secondo alla frequenza assoluta della classe successiva a quella più bassa, ecc.
```

````{solution} ex-eda-8
:class: dropdown
:label: sol-eda-8

2 3 1 4 5
````

+++

```{exercise}
:label: ex-eda-9

Si importi il file parenthood.csv fornito su Moodle nella cartella Risorse > data. Il significato delle variabili è il seguente:

dan.sleep: ore di sonno della psicologa che ha fornito i dati (Danielle Navarro);

dan.grump: irritabilità della psicologa il giorno dopo, misurata su una scala da 0 a 100;

baby.sleep: ore di sonno del figlio (o figlia) di Danielle;

day: giorno della misurazione delle variabili;

X: indice da 1 a 100 (si può ignorare).

Si calcoli la media delle ore di sonno di Danielle.
```

````{solution} ex-eda-9
:class: dropdown
:label: sol-eda-9

6.9652
````

+++

```{exercise}
:label: ex-eda-10

Si legga in R il file parenthood.csv fornito su Moodle nella cartella Risorse > data. Il significato delle variabili è il seguente:

dan.sleep: ore di sonno della psicologa che ha fornito i dati (Danielle Navarro);

dan.grump: irritabilità della psicologa il giorno dopo, misurata su una scala da 0 a 100;

baby.sleep: ore di sonno del figlio (o figlia) di Danielle;

day: giorno della misurazione delle variabili;

X: indice da 1 a 100 (si può ignorare).

Si calcoli la correlazione tra le ore di sonno di Danielle e l’irritabilità di Danielle il giorno dopo. Si calcoli nuovamente questa correlazione dopo avere cambiato l’unità di misura della durata del sonno: da ore in minuti. Si interpretino i risultati ottenuti.
```

````{solution} ex-eda-10
:class: dropdown
:label: sol-eda-10

Quando la durata del sonno è espressa in ore la correlazione è -0.903384. Tale valore non cambia quando esprimiamo la durata del sonno in minuti.
````


+++

```{exercise}
:label: ex-eda-11

Si legga in R il file parenthood.csv fornito su Moodle nella cartella Risorse > data. Il significato delle variabili è il seguente:

dan.sleep: ore di sonno della psicologa che ha fornito i dati (Danielle Navarro);

dan.grump: irritabilità della psicologa il giorno dopo, misurata su una scala da 0 a 100;

baby.sleep: ore di sonno del figlio (o figlia) di Danielle;

day: giorno della misurazione delle variabili;

X: indice da 1 a 100 (si può ignorare).

Si calcoli e si interpreti il terzo quantile delle ore di sonno di Danielle.
```

````{solution} ex-eda-11
:class: dropdown
:label: sol-eda-11

7.74 significa che nel 75 percento delle notti Danielle dorme meno di 7.74 ore.
````
