# ✏️ Esercizi

```{exercise}
:label: label-pandas-01

Scrivi le istruzioni Pandas per selezionare, dal set di dati `penguins.csv`, le osservazioni in cui `bill_depth_mm` >= 18.7, considerando solo i pinguini dell'isola Dream. Dopo avere importato i dati, si eliminino i valori mancanti.
```

````{solution} label-pandas-01
:class: dropdown

```{code-block} python
import numpy as np 
import pandas as pd

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)

df[(df["bill_depth_mm"] >= 18.7) & (df["island"] == "Dream")].head(10)
```
````

+++

```{exercise}
:label: label-pandas-02

Scrivi le istruzioni Pandas per selezionare, dal set di dati `penguins.csv`, le prime 5 osservazioni della specie Chinstrap, considerando solo quelli pinguini sull'isola Torgersen di sesso femminile. Dopo avere importato i dati, si eliminino i valori mancanti.
```

````{solution} label-pandas-02
:class: dropdown

```{code-block} python
import numpy as np 
import pandas as pd

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)

temp = df[(df["species"] == "Chinstrap") & (df["island"] == "Dream") & (df["sex"] == "female")]
temp.iloc[1::5]
```
````

+++

```{exercise}
:label: label-pandas-03

Si trovi la media, la deviazione standard e la numerosità delle osservazioni `bill_length_mm` per i pinguini di sesso maschile della specie Chinstrap che si trovano sull'isola Dream. Dopo avere importato i dati, si eliminino i valori mancanti.
```

````{solution} label-pandas-03
:class: dropdown

```{code-block} python
import numpy as np 
import pandas as pd

df = pd.read_csv('data/penguins.csv')
df.dropna(inplace=True)

summary_stats = (
    df.loc[:, ["island", "species", "sex", "bill_length_mm"]]
    .groupby(["island", "species", "sex"])
    .aggregate(["mean", "std", "count"])
)
summary_stats
```
````