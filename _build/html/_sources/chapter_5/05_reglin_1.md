(sec-regr-intro)=
# Il modello di regressione lineare

In precedenza abbiamo visto come stimare i parametri di un modello bayesiano nel quale le osservazioni sono indipendenti e identicamente distribuite secondo una densità gaussiana,

$$
\begin{equation}
y_i \stackrel{i.i.d.}{\sim} \mathcal{N}(\mu, \sigma), \quad i = 1, \dots, n.
\end{equation}
$$ (eq-normalsamplingmodel)

Il modello dell'eq. {eq}`eq-normalsamplingmodel` assume che ogni $y_i$ sia la realizzazione di una v.c. distribuita come $\mathcal{N}(\mu, \sigma^2)$. Da un punto di vista bayesiano, questo modello può essere implementato imponendo delle distribuzioni a priori ai parametri $\mu$ e $\sigma$ e generando la verosimiglianza in base ai dati osservati. Per esempio, possiamo usare le seguenti distribuzioni a priori.

$$
\begin{align}
y_i \mid \mu, \sigma & \stackrel{iid}{\sim} \mathcal{N}(\mu, \sigma^2)\notag\\
\mu & \sim \mathcal{N}(\mu_0, \tau^2) \notag\\
\sigma & \sim \mbox{Cauchy}(x_0, \gamma) \notag
\end{align}
$$

Con queste informazioni, possono poi essere trovate le distribuzioni a posteriori dei parametri {cite:p}`gelman2020regression`. Esploreremo ora un'estensione del modello bayesiano che ci consentirà di descrivere la *relazione lineare* tra due variabili (si veda l'appendice {ref}`lin-fun-appendix`).

Il ricercatore spesso si trova ad osservare un'altra variabile, chiamiamola $x$, che risulta associata ad ogni risposta $y_i$. Come possiamo estendere il modello dell'equazione {eq}`eq-normalsamplingmodel` per studiare la relazione tra $y_i$ e $x_i$? La risposta a questa domanda è fornita dal modello di regressione lineare.

L'equazione {eq}`eq-normalsamplingmodel` rappresenta un modello statistico che assume che tutte le osservazioni $y_i$ abbiano una media comune $\mu$. Tuttavia, se vogliamo considerare anche una nuova variabile $x_i$ che assume valori diversi per ogni $y_i$, dobbiamo modificare quel modello. In particolare, invece della media comune $\mu$, introduciamo una media $\mu_i$ specifica per ciascuna osservazione $y_i$.

$$
y_i \mid \mu_i, \sigma \stackrel{ind}{\sim} \mathcal{N}(\mu_i, \sigma), \quad i = 1, \dots, n.
$$ (eq-normalsamplinglinearmodel)

Per modellare la relazione tra il predittore $x_i$ e la risposta $y_i$, il modello di regressione assume che la media della distribuzione da cui abbiamo estratto $y_i$, ovvero $\mu_i$, sia una funzione lineare del predittore $x_i$, ovvero

$$
\mu_i = \beta_0 + \beta_1 x_i,
$$ (eq-regmodel)

dove $\beta_0$ e $\beta_1$ sono i parametri incogniti rappresentanti l'intercetta e la pendenza della retta di regressione, rispettivamente.

Sostituendo la relazione lineare dell'eq. {eq}`eq-regmodel` nell'eq. {eq}`eq-normalsamplinglinearmodel`, otteniamo il modello di regressione lineare:

$$
y_i \mid \beta_0, \beta_ 1, \sigma \stackrel{ind}{\sim} \mathcal{N}(\beta_0 + \beta_ 1 x_i, \sigma), \quad i = 1, \dots, n.
$$ (eq-linearmodel)

Questa nuova equazione, chiamata *modello di regressione lineare*, ci permette di studiare la relazione tra $y_i$ e $x_i$ considerando $\mu_i$ come una funzione lineare di $x_i$. L'eq. {eq}`eq-linearmodel` afferma che ciascuna osservazione $y_i$ è estratta casualmente dalla distribuzione $\mathcal{N}(\mu_i, \sigma)$, dove $\mu_i$ è la media associata alla $i$-esima osservazione e $\sigma$ è la deviazione standard comune a tutte le osservazioni.  In altre parole, il modello di regressione suppone che esista una relazione lineare tra $x_i$ e $\mu_i$ e che ogni valore di $y_i$ sia una realizzazione di una variabile casuale con media $\mu_i$ e deviazione standard $\sigma$. 

Nell'eq. {eq}`eq-linearmodel`, $x_i$ è considerata una costante nota e $\beta_0$ e $\beta_1$ sono variabili casuali, che vengono stimate tramite l'inferenza bayesiana. Questo procedimento consiste nell'assegnare una distribuzione a priori a $\beta_0$ e a $\beta_1$, trovare la verosimiglianza dei dati e calcolare la distribuzione a posteriori dei parametri $\beta_0$ e $\beta_1$. La costante $\beta_0$ rappresenta il valore atteso di $y_i$ quando $x_i=0$, mentre la costante $\beta_1$ rappresenta l'incremento atteso di $y_i$ quando $x_i$ aumenta di un'unità.

Va sottolineato che il modello fornisce una stima del valore atteso $\mu_i$ e non del valore effettivo di ciascuna osservazione $y_i$. In altre parole, la relazione lineare tra $\mu_i$ e $x_i$ non può essere utilizzata per prevedere il valore esatto di $y_i$ per un dato valore di $x_i$, ma solo per fornire una stima del valore atteso di $y_i$ per quel dato valore di $x_i$.

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
