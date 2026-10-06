@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------



set OPENSSL_KEY_SIZE=2048
set PROJ_DIR=%cd%
set OPENSSL_OUT_DIR=%PROJ_DIR%\keys

set OPENSSL_PATH="C:\Program Files\Git\usr\bin"

cd %OPENSSL_PATH%

echo ---- Benvenuto su GenRSA-Windows! ----

rem Controlla se il file variables.bat esiste
if not exist .\openssl.exe (
    echo ---- Errore: Il file openssl.exe non e' stato trovato. ----
    echo ---- Assicurati di avere tutti i file necessari e riprova. ----
    pause
    exit /b
)


rem Verifica che la cartella di out esista
if not exist %OPENSSL_OUT_DIR% (
    echo ---- Creazione cartella di out... ----
    mkdir %OPENSSL_OUT_DIR%
)

rem Genera private key
echo ---- Generazione private key... ----
.\openssl genpkey -algorithm RSA -out "%OPENSSL_OUT_DIR%\private_key.pem" -pkeyopt rsa_keygen_bits:%OPENSSL_KEY_SIZE%

rem Genera public key da private key
echo ---- Generazione public key... ----
.\openssl rsa -pubout -in "%OPENSSL_OUT_DIR%\private_key.pem" -out "%OPENSSL_OUT_DIR%\public_key.pem"

pause