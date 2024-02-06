# Inferenza bayesiana

Questa sezione della dispensa presenta un'introduzione all'inferenza bayesiana, un metodo statistico per stimare un parametro di interesse $\theta$ (ad esempio, la media della popolazione o il coefficiente di regressione) utilizzando il Teorema di Bayes. La formula chiave per l'approccio bayesiano è:

$$
p(\theta \mid y) \propto p(y \mid \theta) \cdot p(\theta). 
$$

In questa formula, abbiamo tre componenti:

1. La verosimiglianza $p(y \mid \theta)$: Questa rappresenta la probabilità di osservare i dati $y$ dato un valore specifico di $\theta$. In altre parole, misura quanto i dati supportano un determinato valore del parametro $\theta$.

2. La probabilità a priori $p(\theta)$: Questa è la distribuzione di probabilità di $\theta$ prima di considerare i dati $y$. Riflette le nostre credenze o conoscenze iniziali riguardo a $\theta$ prima di avere accesso ai dati.

3. La probabilità a posteriori $p(\theta \mid y)$: Questa rappresenta la distribuzione di probabilità aggiornata di $\theta$ dopo aver osservato i dati $y$. In altre parole, combina l'informazione fornita dai dati con la nostra conoscenza iniziale per ottenere una stima più accurata di $\theta$.

In sintesi, l'approccio bayesiano considera sia l'informazione fornita dai dati osservati che le nostre conoscenze iniziali per ottenere una stima del parametro $\theta$ sotto forma di una distribuzione di probabilità, nota come distribuzione a posteriori.

D'altra parte, le statistiche classiche o frequentiste si concentrano principalmente sulla verosimiglianza $p(y \mid \theta)$ senza coinvolgere una distribuzione a priori. Ciò rende l'approccio bayesiano un metodo più flessibile che incorpora le credenze pregresse e fornisce una valutazione probabilistica del parametro di interesse.

Nel corso di questa parte della dispensa, esploreremo il processo di aggiornamento bayesiano e le procedure per riassumere la distribuzione a posteriori. Metteremo particolare enfasi sulle famiglie coniugate, concentrandoci in particolare sul caso beta-binomiale. Discuteremo le procedure Monte Carlo a Catena di Markov, focalizzandoci sull'algoritmo di Metropolis, utilizzato per approssimare la distribuzione a posteriori.

Introdurremo i concetti di predizione bayesiana, necessari per costruire la distribuzione predittiva a posteriori, e la distribuzione predittiva a priori. Applicheremo l'inferenza bayesiana a diversi scenari, tra cui il caso di una proporzione, il confronto tra due proporzioni, il caso di una media da una distribuzione normale e il confronto tra due medie. Esploreremo anche il modello bayesiano di Poisson per le frequenze.

Infine, presenteremo il modello gerarchico bayesiano, un potente strumento per affrontare situazioni in cui le osservazioni sono raggruppate o organizzate in diversi livelli di incertezza.
