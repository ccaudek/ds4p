# ✏️ Esercizi

```{exercise}
:label: label-matplotlib-01

Usando Matplotlib, si disegni una spezzata utilizzando le coordinate $x$ = 1, 2, 3 e $y$ = 2, 4, 1. Si aggiungano le etichette per l'asse X e per l'asse Y e un titolo.
```

````{solution} label-matplotlib-01
:class: dropdown

```{code-block} python
import matplotlib.pyplot as plt
x = [1,2,3]
y = [2,4,1]
plt.plot(x, y)
plt.xlabel('x - axis')
plt.ylabel('y - axis')
plt.title('This is a graph')
plt.show()
```
````

+++

```{exercise}
:label: label-matplotlib-02

Si modifichi lo script dell'esercizio precedente in modo tale da disegnare, non una spezzata, ma tre punti rossi.
```

````{solution} label-matplotlib-02
:class: dropdown

```{code-block} python
import matplotlib.pyplot as plt
x = [1,2,3]
y = [2,4,1]
plt.plot(x, y, "or")
plt.xlabel('x - axis')
plt.ylabel('y - axis')
plt.title('This is a graph')
plt.show()
```
````

+++

+++

```{exercise}
:label: label-matplotlib-03

Si modifichi lo script dell'esercizio precedente in modo tale da utilizzare il tema "darkgrid" di Seaborn.
```

````{solution} label-matplotlib-03
:class: dropdown

```{code-block} python
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_theme(style="darkgrid")

x = [1,2,3]
y = [2,4,1]
plt.plot(x, y, "or")
plt.xlabel('x - axis')
plt.ylabel('y - axis')
plt.title('This is a graph')
plt.show()
```
````

+++

```{exercise}
:label: label-matplotlib-04

Si leggano i dati contenuti nel file `penguins.csv`. Si rimuovano i dati mancanti. Usando Matplotlib, si generi un diagramma a dispersione della lunghezza del becco dei pinguini (in mm) come funzione della massa de corpo (in g), considerando solo i pinguini della specie Adelie. Si aggiungano al grafico un titolo e le etichette appropriate. 
```

````{solution} label-matplotlib-04
:class: dropdown

```{code-block} python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv("data/penguins.csv")
df.dropna(inplace=True)

eval_string = "species == 'Adelie'"
df1 = df.query(eval_string)[["body_mass_g", "bill_length_mm"]]

x = df1["body_mass_g"]
y = df1["bill_length_mm"]

plt.plot(x, y, "o")
plt.xlabel("Body mass (g)")
plt.ylabel("Bill length (mm)")
plt.title("Bill length as a function of body mass")
plt.show()
```
````

+++

```{exercise}
:label: label-matplotlib-05

Si leggano i dati contenuti nel file `penguins.csv`. Si rimuovano i dati mancanti. Usando Seaborn, si generi un grafico che utilizza dei boxplot per descrivere la lunghezza del becco dei pinguini (in mm) come funzione dell'isola su cui si trovano e del genere. 
```

````{solution} label-matplotlib-05
:class: dropdown

```{code-block} python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv("data/penguins.csv")
df.dropna(inplace=True)
_ = sns.catplot(df, x="island", y="bill_length_mm", hue="sex", kind="box")
```
````

+++

```{exercise}
:label: label-matplotlib-06

Si leggano i dati contenuti nel file `penguins.csv`. Si rimuovano i dati mancanti. Usando Seaborn, si generi un grafico che utilizza degli half-violin plots per descrivere la lunghezza del becco dei pinguini (in mm) come funzione della specie e del genere, considerando solo i pinguini dell'isola Dream. 
```

````{solution} label-matplotlib-06
:class: dropdown

```{code-block} python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv("data/penguins.csv")
df.dropna(inplace=True)

eval_string = "island == 'Dream'"
df1 = df.query(eval_string)[["species", "bill_length_mm", "sex"]]

_ = sns.catplot(df1, x="species", y="bill_length_mm", hue="sex", kind="violin", split=True)
```
````