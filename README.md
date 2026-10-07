# GenRSA-Windows

Script per generare una coppia di chiavi RSA (privata e pubblica) su Windows utilizzando OpenSSL.

## Funzionamento

Quando esegui `start.py`, il programma:

- controlla che `openssl.exe` sia presente nel percorso configurato;
- crea la directory di output se non esiste;
- genera la chiave privata con `openssl genpkey`;
- genera la chiave pubblica con `openssl rsa -pubout`;
- salva i file nella cartella specificata.

## Requisiti

- Python 3
- OpenSSL per Windows
- Percorso standard di Git for Windows:
  `C:\Program Files\Git\usr\bin`

Se non hai OpenSSL installato, puoi scaricarlo da:
https://git-scm.com/download/win

## Configurazione

Il progetto usa un file `.env` con queste variabili:

```env
OPENSSL_KEY_SIZE=2048
OPENSSL_OUT_DIR=keys
OPENSSL_PATH="C:\Program Files\Git\usr\bin"
```

### Variabili disponibili

- `OPENSSL_KEY_SIZE`: dimensione della chiave RSA in bit (default: `2048`)
- `OPENSSL_OUT_DIR`: cartella di output (default: `keys`)
- `OPENSSL_PATH`: directory che contiene `openssl.exe` (default: `C:\Program Files\Git\usr\bin`)

> Se il file `.env` non esiste, lo script crea automaticamente una copia da `.env.example`.

## Esecuzione

### Esecuzione standard

```bash
python .\start.py
```

### Esecuzione con parametri custom

```bash
python .\start.py --key_size 4096 --out_dir keys --openssl_path "C:\Program Files\Git\usr\bin"
```

### Argomenti supportati

```bash
--key_size    Dimensione della chiave in bit
--out_dir    Cartella dove salvare le chiavi
--openssl_path   Percorso della directory contenente openssl.exe
```

## Output

Di default i file vengono creati in:

```text
keys/private_key.pem
keys/public_key.pem
```

## Esempio

```bash
python .\start.py --key_size 4096
```

Questo genera una chiave RSA a 4096 bit e salva i file nella cartella `keys`.

## Note

- Il programma esce con errore se `openssl.exe` non viene trovato.
- Se la cartella di output non esiste, viene creata automaticamente.
- La cartella di output può essere cambiata sia via `.env` sia via CLI.