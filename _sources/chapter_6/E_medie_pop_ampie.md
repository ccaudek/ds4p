# ✏️ Esercizi

## Confronto di due medie di popolazione

```{exercise}
:label: ex-confronto-medie-1

Un amministratore universitario ha affermato che gli studenti della magistrale trascorrono più tempo a studiare rispetto a quelli della triennale.

a. Verificare questa affermazione rispetto all'impostazione predefinita secondo cui il numero medio di ore di studio settimanali dei due gruppi è lo stesso, utilizzando le seguenti informazioni basate su campioni casuali di ciascun gruppo di studenti. Test al livello di significatività dell'1%.


|               |  n  | $\bar{x}$ |  s  |
|---------------|-----|-----------|-----|
| Magistrale    | 35  |   15.6    | 2,9 |
| Triennale     | 35  |   12.3    | 4.1 |

b. Calcolare la significatività osservata del test.
```

````{solution} ex-confronto-medie-1
:class: dropdown
:label: sol-confronto-medie-1

a. Z = 3.888, $z_{0.01}$ = 2.326, rifiuto $H_0$ (Gli studenti della magistrale studiano di più)
b. $p-value$ = 0.0001 

````

+++

```{exercise}
:label: ex-confronto-medie-2

Agli studenti di due classi della scuola di psicologia sono state date due versioni dello stesso test, ma con l'ordine delle domande disposte dal più facile al più difficile nella versione A e in ordine inverso nella versione B. Agli studenti selezionati a caso di ciascuna classe è stata data la versione A e il resto Versione B. I risultati sono mostrati nella tabella.

|             |  n  |$\bar{x}$|  s   |   
|-------------|-----|---------|------|
| Versione A  | 31  |   83    | 4.6  |   
| Versione B  | 32  |   78    | 4.3  |   

a. Costruire l'intervallo di confidenza al 90% per la differenza nelle medie delle classi di tutti gli studenti che hanno eseguito la versione A di tale test e di tutti gli studenti che hanno eseguito la versione B di tale test.
b. Testare al livello di significatività dell'1% l'ipotesi che la versione A del test sia più semplice della versione B (anche se le domande sono le stesse).
c. Calcolare la significatività osservata del test.

```

```{solution} ex-confronto-medie-2
:class: dropdown
:label: sol-confronto-medie-2

a. $5\pm$ 1.8
b. Z = 4.454, $z_{0.01}$ = 2.326, rifiuto $H_0$ 
c. $p-value$ = 0.0000

```

+++

```{exercise}
:label: ex-confronto-medie-3

Confrontando il rendimento scolastico degli studenti universitari affiliati al laboratorio collettivo degli studenti e di quegli studenti maschi non affiliati, è stato estratto un campione casuale di studenti da ciascuna delle due popolazioni di un campus universitario. Di seguito sono riportate le statistiche riassuntive sui GPA degli studenti.

|               |  n  |$\bar{x}$|   s  |  
|---------------|-----|---------|------|
| Laboratorio   | 645 |   2.90  | 0.47 |   
| Non affiliato | 450 |   2.88  | 0.42 |   

Verifica, al livello di significatività del 5%, se i dati forniscono prove sufficienti per concludere che esiste una differenza nel GPA medio tra la popolazione di studenti del laboratorio collettivo e la popolazione di studenti maschi non affiliati in questo campus universitario.

```

```{solution} ex-confronto-medie-3
:class: dropdown
:label: sol-confronto-medie-3

Z = 0.738, $\pm$ $z_{0.025}$ = $\pm$ 1.960, non rifiuto $H_0$ (no differenze)
```
