# BlackTheory

> [!WARNING]
> **Questo repository è stato realizzato esclusivamente per finalità didattiche, di auditing e di analisi della sicurezza.**
>
> Le informazioni contenute non devono essere utilizzate per scopi diversi dalla **correzione della vulnerabilità** oggetto della presente documentazione.
>
> L'autore:
> - Non incoraggia né supporta utilizzi impropri o attività non autorizzate.
> - Non è responsabile di eventuali abusi o danni derivanti da utilizzi non conformi.
> - Non è affiliato con GreenTheory o società collegate.
>
> Qualsiasi utilizzo non autorizzato di queste informazioni può costituire reato secondo la normativa vigente. Procedere solo in un **ambiente controllato** e con **autorizzazione esplicita**.

## 📋 Panoramica

Questo documento illustra l'analisi di una vulnerabilità individuata nel sistema di gestione dei QR code utilizzati per l'accesso alle strutture GreenTheory.

## 🧩 Contesto

GreenTheory utilizza un sistema di accesso basato su QR code generati dall'applicazione mobile ufficiale.  
Ogni QR code contiene identificativi relativi all'utente e alla sede della palestra.

### 🔍 Contenuto QR Code

Il QR code contiene i seguenti dati:
- `client_id` → Identificativo univoco dell'utente (o abbonamento)
- `center_id` → Identificativo univoco della sede della palestra
- `timestamp` → Data e ora di generazione del QR code (formato UNIX epoch)

### 🛠️ Comportamento applicazione ufficiale

L'applicazione ufficiale, alla sua apertura, controlla la data di scadenza dell'abbonamento dell'utente utilizzando il servizio:
```
https://gym.theoryholding.com/request/get-expiration-date.php
```

Nei parametri di questa chiamata è possibile recuperare:
- Il **token** dell'utente, fondamentale per lo sfruttamento della vulnerabilità
- Il `client_id`, utilizzato per verificare lo stato dell'abbonamento (ricavabile anche dal QR code)

## 🔓 Vulnerabilità Identificata

La vulnerabilità risiede nel fatto che il servizio di verifica **non valida l'associazione tra token e client_id**.

### Exploit

Un utente in possesso di un token valido (anche con abbonamento scaduto) può:

1. Utilizzare il proprio token per interrogare il servizio con **qualsiasi** `client_id`
2. Verificare lo stato di abbonamenti altrui senza autorizzazione
3. Generare QR code validi utilizzando `client_id` con abbonamenti attivi

### Limitazioni

- **Token richiesto** → È necessario possedere un token valido (ottenibile solo con un abbonamento, anche scaduto).
- **Delay tra ingressi** → Potrebbe esistere un tempo minimo tra accessi consecutivi con lo stesso `client_id`. L'utilizzo di un ID recentemente utilizzato potrebbe risultare in un accesso negato al tornello.

## ✨ Funzionalità implementate

**Accesso al menu**: Swipe da sinistra verso destra per aprire il menu laterale delle impostazioni.

### Stealth Mode
L'applicazione replica l'interfaccia e il comportamento dell'app originale per evitare sospetti durante l'utilizzo ai tornelli.

### Rolling Client IDs
Permette di specificare una lista di `client_id` validi che vengono automaticamente alternati. Quando la funzionalità è attiva, un doppio tap sul QR code effettua lo switch al `client_id` successivo nella lista.

## 🚀 Getting Started

### Prerequisiti

- Un abbonamento GreenTheory (anche scaduto) per ottenere un token valido.
- Un HTTPS interceptor (es. Hodor, HTTP Toolkit, mitmproxy).

### Setup

#### 1. Recupero `client_id` e `center_id`

- Aprire l'applicazione ufficiale GreenTheory
- Generare il QR code
- Decodificare il QR code per estrarre i parametri

#### 2. Recupero Token

- Configurare un HTTPS interceptor sul dispositivo
- Aprire l'applicazione GreenTheory
- Intercettare la chiamata a `get-expiration-date.php`
- Estrarre il parametro `token` dalla richiesta HTTPS

#### 3. Configurazione Ambiente

Creare un file `.env` nella directory del progetto seguendo la struttura di `example.env`:
```env
CLIENT_ID=your_client_id
CENTER_ID=your_center_id
TOKEN=your_token
BASE_URL=https://gym.theoryholding.com/request/
```

#### 4. Run / Build dell'applicazione

## 📝 Note Tecniche

La vulnerabilità è classificabile come **Broken Access Control** (OWASP Top 10 - A01:2021), derivante dalla mancata validazione server-side dell'associazione tra credenziali e risorse richieste.

## 🔒 Raccomandazioni per la Mitigazione

- Implementare validazione server-side dell'associazione token-client_id
- Utilizzare token con scope limitato al solo `client_id` del proprietario
- Implementare rate limiting sulle chiamate API
- Aggiungere logging e monitoring degli accessi anomali