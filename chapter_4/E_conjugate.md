# ✏️ Esercizi

## Caso Beta-Binomiale

```{exercise}
:label: label-conjugate-prior-01

Supponiamo di avere osservato 17 successi in 29 prove Bernoulliane. Si supponga di utilizzare una distibuzione a priori Beta di parametri alpha = 4 e beta = 17. Si calcoli la media della distribuzione a posteriori per il parametro theta (probabilità di successo).
```

````{solution} label-conjugate-prior-01
:class: dropdown

```{code-block} python

```
0.42
````

+++

```{exercise}
:label: label-conjugate-prior-02

Supponiamo di avere osservato 17 successi in 30 prove Bernoulliane. Si supponga di utilizzare una distibuzione a priori Beta di parametri alpha = 5 e beta = 13. Si calcoli la distribuzione a posteriori per il parametro theta (probabilità di successo). In tale distribuzione a posteriori, qual è il valore theta che lascia sotto di sé una probabilità pari a 0.4?
```

````{solution} label-conjugate-prior-02
:class: dropdown

```{code-block} python

```
0.4395
````

+++

```{exercise}
:label: label-conjugate-prior-03

Supponiamo di avere osservato 17 successi in 28 prove Bernoulliane. Si supponga di utilizzare una distibuzione a priori Beta di parametri alpha = 5 e beta = 19. Si calcoli la probabilità che, nella distribuzione a posteriori, theta (probabilità di successo) assuma un valore compreso nell’intervallo tra 0.5 e 0.75.
```

````{solution} label-conjugate-prior-03
:class: dropdown

```{code-block} python

```
0.1312
````

+++

```{exercise}
:label: label-conjugate-prior-04

Supponiamo di avere osservato 18 successi in 30 prove Bernoulliane. Si supponga di utilizzare una distibuzione a priori Beta di parametri alpha = 8 e beta = 20. Si calcoli la distribuzione a posteriori per il parametro theta (probabilità di successo). In tale distribuzione a posteriori, qual è il valore (theta_0) tale per cui (P(theta > theta_0 =) 0.7?
```

````{solution} label-conjugate-prior-04
:class: dropdown

```{code-block} python

```
0.5178
````

+++

```{exercise}
:label: label-beta-binom-01

Supponiamo di avere osservato 18 successi in 24 prove bernoulliane. Ipotizziamo una distribuzione a priori Beta(3, 9) per il parametro $\theta$ (probabilità di successo). Si trovi la media della distribuzione a posteriori.
```

````{solution} label-beta-binom-01
:class: dropdown

```{code-block} python
y = 18
n = 24

alpha_prior = 3
beta_prior = 9

alpha = alpha_prior + y
beta = beta_prior + n - y

mean = alpha / (alpha + beta)
mean
```
0.5833333333333334
````

+++

```{exercise}
:label: label-beta-binom-02

Supponiamo di avere osservato 18 successi in 24 prove bernoulliane. Ipotizziamo una distribuzione a priori Beta(3, 9) per il parametro $\theta$ (probabilità di successo). Si trovi la varianza della distribuzione a posteriori.
```

````{solution} label-beta-binom-02
:class: dropdown

```{code-block} python
y = 18
n = 24

alpha_prior = 3
beta_prior = 9

alpha = alpha_prior + y
beta = beta_prior + n - y

var = alpha * beta / ((alpha + beta) ** 2 * (alpha + beta + 1))
var
```
0.006569069069069069
````

+++

```{exercise}
:label: label-beta-binom-03
Supponiamo di avere osservato 18 successi in 24 prove bernoulliane. Ipotizziamo una distribuzione a priori Beta(3, 9) per il parametro $\theta$ (probabilità di successo). Si trovi la probabilità che, nella distribuzione a posteriori, il parametro $\theta$ (probabilità di successo) assuma un valore minore di 0.4.

```

````{solution} label-beta-binom-03
:class: dropdown

```{code-block} python
y = 18
n = 24

alpha_prior = 3
beta_prior = 9

alpha = alpha_prior + y
beta = beta_prior + n - y

st.beta.cdf(0.4, alpha, beta)
```
0.013257856051262343
````

+++

```{exercise}
:label: label-beta-binom-04

Supponiamo di avere osservato 18 successi in 24 prove bernoulliane. Ipotizziamo una distribuzione a priori Beta(3, 9) per il parametro $\theta$ (probabilità di successo). Si trovi la probabilità che, nella distribuzione a posteriori, il parametro $\theta$ (probabilità di successo) assuma un valore compreso tra 0.4 e 0.6.
```

````{solution} label-beta-binom-04
:class: dropdown

```{code-block} python
y = 18
n = 24

alpha_prior = 3
beta_prior = 9

alpha = alpha_prior + y
beta = beta_prior + n - y

st.beta.cdf(0.6, alpha, beta) - st.beta.cdf(0.4, alpha, beta)
```
0.5594962066370368
````

+++

```{exercise}
:label: label-beta-binom-05

Supponiamo di avere osservato 18 successi in 24 prove bernoulliane. Ipotizziamo una distribuzione a priori Beta(3, 9) per il parametro $\theta$ (probabilità di successo). Si trovi la moda della distribuzione a posteriori del parametro $\theta$ (probabilità di successo).
```

````{solution} label-beta-binom-05
:class: dropdown

```{code-block} python
y = 18
n = 24

alpha_prior = 3
beta_prior = 9

alpha = alpha_prior + y
beta = beta_prior + n - y

mo = (alpha - 1) / (alpha + beta - 2)
mo
```
0.5882352941176471
````
