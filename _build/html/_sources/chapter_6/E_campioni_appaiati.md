# ✏️ Esercizi

## Confronto di due medie di popolazione: campioni appaiati

```{exercise}
:label: ex-confronto_pop_appaiati_5

Ciascuno dei cinque topi da laboratorio è stato rilasciato due volte in un labirinto. Le cinque coppie di volte per scappare erano:

|       Topo       |  1  | 2  |  3  |  4  |  5  |
|------------------|-----|----|-----|-----|-----|
| Prima versione   | 129 | 89 | 136 | 163 | 118 |
| Seconda versione | 113 | 97 | 139 | 85  |  75 |

a) Calcolare $\bar{d}$ e $sd$.
b) Fornire una stima puntuale per $\mu_1$ - $\mu_2$ = $\mu_d$.
c) Costruire l'intervallo di confidenza al 90% per $\mu_1$ - $\mu_2$ = $\mu_d$ da questi dati.
d) Verificare, al livello di significatività del 10%, l'ipotesi che i topi impieghino in media meno tempo a percorrere il labirinto alla seconda prova.
```

````{solution} ex-confronto_pop_appaiati_5
:class: dropdown
:label: sol-confronto_pop_appaiati_5

a. $\bar{d}$ = 25.2; $s_d$ = 35.6609
b. $\bar{d}$ = 25.2
c. $25.2\pm$ 34.0
d. T = 1.580; df = 4; $t_{0.10}$ = 1.533, rifiuto $H_0$ (richiede meno tempo)

````

+++

```{exercise}
:label: ex-confronto_pop_appaiati_7

L'ordine degli psicologici della Toscana ha condotto un'analisi per valutare i valori di stima su studi privati o pubblici perchè  sospetta che i recenti valori di stima degli studi nel quartiere condotti dal governo a fini fiscali siano troppo alti. Ha assunto una società privata per stimare i valori di dieci studi nel quartiere. I risultati, in migliaia di euro, sono


| Studio | Governo |   Azienda privata |     
|--------|---------|-------------------|
|    1   |  217    |       219         |   
|    2   |  350    |       338         |      
|    3   |  296    |       291         |    
|    4   |  237    |       237         |     
|    5   |  237    |       235         |    
|    6   |  272    |       269         |  
|    7   |  257    |       239         |    
|    8   |  277    |       275         |      
|    9   |  312    |       320         |     
|   10   |  335    |       335         |    


a) Fornire una stima puntuale della differenza tra la valutazione privata media di tutti questi studi e la valutazione governativa di tutti questi studi.
b) Costruire l'intervallo di confidenza al 99% sulla base di questi dati per la differenza.
c) Verificare, al livello di significatività dell'1%, l'ipotesi che i valori stimati dal governo di tutti questi studi siano superiori ai valori stimati dalla società di valutazione privata.
```

```{solution} ex-confronto_pop_appaiati_7
:class: dropdown
:label: sol-confronto_pop_appaiati_7

a. 3.2
b. $3.2\pm$ 7.5
c. T = 1.392; df = 9; $t_{0.10}$ = 2.821, non rifiuto $H_0$ (il materiale sperimentale si consuma meno).
```

+++

```{exercise}
:label: ex-confronto_pop_appaiati_9

Gli psicologici di una cooperativa sociale desiderano testare un nuovo test sperimentale per valutare per la flessibilità cognitiva. Per testare il nuovo strumento questo viene proposto a 11 soggetti, di seguito al vecchio test. Dopo viene valutata l'attendibilità dei due strumenti. 

| Soggetti |  Test  | Test sperimentale |     
|----------|--------|-------------------|
|    1     |   5.1  |        5.0        |   
|    2     |   6.5  |        6.5        |      
|    3     |   3.6  |        3.1        |    
|    4     |   3.5  |        3.7        |     
|    5     |   5.7  |        4.5        |    
|    6     |   5.0  |        4.1        |   
|    7     |   6.4  |        5.3        |    
|    8     |   4.7  |        2.6        |      
|    9     |   3.2  |        3.0        |     
|    10    |   3.5  |        3.5        | 
|    11    |   6.4  |        5.1        | 

a) Fornire una stima puntuale della differenza nei due test.
b) Costruire l'intervallo di confidenza al 99% per la differenza sulla base di questi dati.
c) Verificare, al livello di significatività dell'1%, l'ipotesi che l'attendibilità media del test sperimentale sia inferiore a quella del test.
```

```{solution} ex-confronto_pop_appaiati_9
:class: dropdown
:label: sol-confronto_pop_appaiati_9

a. 0.65
b. $0.65\pm$ 0.69
c. T = 3.014; df = 10; $t_{0.10}$ = 2.764, rifiuto $H_0$ (il materiale esperimentale si consuma meno)
```
