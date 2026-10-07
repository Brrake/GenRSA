# GenRSA-Windows
Genera chiavi RSA utilizzando openssl.exe 


1) Apri il file ".env"    

    - OPENSSL_KEY_SIZE : Dimensione in bit della chiave RSA -- DEFAULT : 2048
    - OPENSSL_OUT_DIR : Path di uscita della chiavi (Pubblica/Privata) -- DEFAULT : ./keys
    - OPENSSL_PATH : Path openssl.exe -- DEFAULT :"C:\Program Files\Git\usr\bin"

Fonti : 
    - openssl.exe -> Git : https://git-scm.com/download/win 