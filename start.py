import dotenv
dotenv.load_dotenv()
import subprocess
import os
from pathlib import Path
import sys

OPENSSL_KEY_SIZE = int(os.getenv('OPENSSL_KEY_SIZE'))
OPENSSL_OUT_DIR = os.getenv('OPENSSL_OUT_DIR')
OPENSSL_PATH = os.getenv('OPENSSL_PATH')

script_dir = Path(__file__).resolve().parent
out_dir = script_dir / OPENSSL_OUT_DIR
openssl_path = Path(OPENSSL_PATH).resolve()
out_dir.mkdir(exist_ok=True)

if __name__ == '__main__':
    print('Welcome to GenRSA-Windows!')
    try:
        # Check if openssl.exe exists
        if not (openssl_path / 'openssl.exe').exists():
            print('Error: openssl.exe not found.')
            print('Please make sure you have all the necessary files and try again.')
            sys.exit(1)

        print('Generating private key...')
        subprocess.run([
            openssl_path / "openssl", "genpkey", "-algorithm", "RSA", "-out", f"{out_dir}\\private_key.pem", "-pkeyopt", f"rsa_keygen_bits:{OPENSSL_KEY_SIZE}"
        ], check=True, cwd=openssl_path)

        print('Generating public key...')
        subprocess.run([
            openssl_path / "openssl", "rsa", "-pubout", "-in", f"{out_dir}\\private_key.pem", "-out", f"{out_dir}\\public_key.pem"
        ], check=True, cwd=openssl_path)

        print('Done!')
    except subprocess.CalledProcessError as e:
        #print(e.output)
        print('An error occurred. Please make sure you have all the necessary files and try again.')
        sys.exit(1)