(sec-regr-intro)=

# Il modello di regressione lineare

Nel contesto dell'inferenza bayesiana, abbiamo esaminato come stimare i parametri di un modello bayesiano caratterizzato da osservazioni indipendenti e identicamente distribuite (i.i.d.) secondo una distribuzione gaussiana, specificamente:

$$
y_i \stackrel{i.i.d.}{\sim} \mathcal{N}(\mu, \sigma^2), \quad i = 1, \dots, n.
$$ (eq-normalsamplingmodel)

Questo modello presuppone che ciascuna osservazione $y_i$ sia generata da una variabile casuale (v.c.) che segue una distribuzione normale con media $\mu$ e varianza $\sigma^2$. Dall'ottica bayesiana, per implementare tale modello si introducono distribuzioni a priori per i parametri $\mu$ e $\sigma$, e si determina la verosimiglianza dei dati osservati. Esempi di distribuzioni a priori per questi parametri includono:


$$

\begin{align}
\mu & \sim \mathcal{N}(\mu_0, \tau^2), \\
\sigma & \sim \text{Cauchy}(x_0, \gamma).
\end{align}

$$

Attraverso queste scelte priori, si possono dedurre le distribuzioni a posteriori dei parametri $\mu$ e $\sigma$, seguendo ad esempio le indicazioni di {cite:p}`gelman2020regression` per la regressione.

Il passo successivo coinvolge l'estensione di questo modello per esaminare le relazioni lineari tra due variabili, ampliando il nostro ambito alla modellazione della connessione tra una variabile risposta $y_i$ e un predittore $x_i$. Questo approfondimento ci porta a considerare il modello di regressione lineare.

Originariamente, il modello gaussiano assumeva una media comune $\mu$ per tutte le osservazioni $y_i$. Tuttavia, introducendo una variabile $x_i$ associata a ciascun $y_i$, modifichiamo il modello per contemplare una media $\mu_i$ specifica per ogni osservazione, che dipende linearmente da $x_i$, come segue:


$$

y_i \mid \mu_i, \sigma \stackrel{ind}{\sim} \mathcal{N}(\mu_i, \sigma^2), \quad i = 1, \dots, n.

$$

Nel modello di regressione lineare, $\mu_i$ è espresso come funzione lineare di $x_i$:


$$

\mu_i = \beta_0 + \beta_1 x_i,

$$

dove $\beta_0$ rappresenta l'intercetta e $\beta_1$ la pendenza della retta di regressione.

Aggiungendo questa funzione lineare al nostro modello, otteniamo:


$$

y_i \mid \beta_0, \beta_1, \sigma \stackrel{ind}{\sim} \mathcal{N}(\beta_0 + \beta_1 x_i, \sigma^2), \quad i = 1, \dots, n.

$$
(eq-linearmodel)

Questo modello di regressione lineare consente di analizzare la relazione tra $y_i$ e $x_i$, interpretando $\mu_i$ come funzione lineare di $x_i$. In termini pratici, ogni osservazione $y_i$ è vista come estratta da una distribuzione gaussiana con media $\mu_i$ (dipendente da $x_i$) e varianza $\sigma^2$ comune.

In questo contesto, $x_i$ è considerato un valore noto e fisso, mentre $\beta_0$ e $\beta_1$ sono stimati attraverso l'inferenza bayesiana, che implica l'attribuzione di distribuzioni a priori a questi parametri, la valutazione della verosimiglianza dei dati osservati, e il calcolo delle distribuzioni a posteriori di $\beta_0$ e $\beta_1$.

È importante sottolineare che il modello fornisce stime dei valori attesi $\mu_i$, piuttosto che prevedere i valori specifici di ogni $y_i$. La relazione lineare tra $\mu_i$ e $x_i$ serve a stimare il valore medio di $y_i$ per un dato $x_i$, anziché predire il valore esatto di $y_i$ per quel $x_i$. Questa distinzione è fondamentale per interpretare correttamente i risultati del modello di regressione lineare nel quadro dell'inferenza statistica bayesiana.


<!-- In questo modello, ogni osservazione $Y_i$ è estratta a caso da una distribuzione Normale con media $\beta_0 + \beta_1 x_i,$ dove $\beta_0$ è l'intercetta e $\beta_1$ è la pendenza della retta di regressione. La deviazione standard $\sigma$ rappresenta la varianza comune a tutte le osservazioni. Questo modello è chiamato "lineare" perché la relazione tra $\mathbb{E}(Y_i) = \mu_i$ e $x_i$ è lineare e "bivariato" perché coinvolge solo due variabili, $Y$ e $x$. -->

### Assunzioni

Il modello di regressione lineare bivariato assume che la variabile $x$ sia fissa e costante tra i diversi campioni. Per ogni valore di $x$, il modello ipotizza che la variabile $y$ segua una distribuzione Normale di media $\mu_i = \alpha + \beta x_i$ e deviazione standard $\sigma$, dove $\alpha$ e $\beta$ sono i parametri del modello. Questa è l'assunzione di normalità e linearità del modello. Il modello assume anche che le distribuzioni condizionate $p(y \mid x_i)$ siano omoschedastiche, cioè che abbiano la stessa deviazione standard $\sigma$ per tutti i valori di $x_i$. Infine, il modello assume che i dati campionati siano indipendenti e che gli errori $\varepsilon_i$ siano distribuiti in maniera Normale con media zero e deviazione standard $\sigma$. In altre parole, il modello ipotizza che ogni osservazione $y_i$ sia una realizzazione della variabile casuale $Y = y_i \mid X = x_i$.

## Una nota di cautela

Nel suo saggio *Statistical Rethinking*, {cite:t}`McElreath_rethinking` esplora il concetto dei Golem. Nel XVI secolo, la Casa degli Asburgo dominava ampie regioni dell'Europa Centrale, i Paesi Bassi, la Spagna e le colonie americane, sotto la guida di un sovrano che portava il titolo di Imperatore del Sacro Romano Impero. A Praga, il sovrano Rodolfo II promosse l'arte, le scienze e la matematica, trasformando la città in un centro culturale di rilievo.

In questo contesto, emerse il Golem di Praga, un'antica creatura di argilla secondo la tradizione ebraica, animata dalla "verità" ma priva di volontà. Nonostante fosse dotato di una grande potenza, mancava di saggezza e poteva divenire pericoloso se non controllato.

Secondo alcune versioni, il rabbino Judah Loew ben Bezalel costruì il Golem per difendere gli ebrei perseguitati di Praga, impiegando antiche tecniche ebraiche. Tuttavia, il Golem fu in definitiva disattivato a causa della sua potenza incontrollata e pericolosa.

{cite:t}`McElreath_rethinking` ci fa notare che anche gli scienziati creano dei "golem" che assumono la forma di modelli matematici, spesso implementati come software. Questi modelli producono effetti tangibili mediante previsioni e intuizioni, ma non possono essere categorizzati come veritieri o falsi; si configurano piuttosto come strumenti progettati per uno scopo specifico. Essi costituiscono strumenti potenti che possono condurre a scoperte preziose oppure a conclusioni insensate. Ad esempio, un modello di regressione rappresenta una forma di "golem" statistico che effettua calcoli coerenti e precisi. Tuttavia, come i golem, anche il modello di regressione manca di saggezza e non considera il contesto circostante.

In sintesi, {cite:t}`McElreath_rethinking` riflette sul fatto che i modelli scientifici assomigliano ai Golem. Questi modelli, come il popolare modello di regressione, producono risultati concreti ma mancano di saggezza e adattabilità, il che limita la loro utilità nella soluzione di problemi che richiedono un approccio creativo. Inoltre, {cite:t}`McElreath_rethinking` sottolinea il fatto che nessun strumento statistico, di per sé, è in grado di affrontare in maniera sensata il problema dell'inferenza delle cause dalle evidenze empiriche. I Golem statistici non comprendono il concetto di causa ed effetto, ma si limitano a descrivere le associazioni tra variabili. Senza la nostra guida e il nostro scetticismo, i Golem pre-costruiti molto spesso si rivelano inutili. Anzi, potrebbero causare danni, proprio come accadde alla città di Praga.

## Commenti e considerazioni finali

Il modello di regressione lineare bivariato viene utilizzato per studiare l'associazione lineare tra due variabili $x$ e $y$, e per determinare la direzione e l'entità di tale legame. Inoltre, questo modello statistico consente di fare previsioni sul valore atteso della variabile dipendente $y$ sulla base del valore assunto dalla variabile indipendente $x$.
$$
