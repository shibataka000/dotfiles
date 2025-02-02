import subprocess

PASSWORD = subprocess.run(["gh", "auth", "token"], capture_output=True, text=True, check=True).stdout.strip()
PORT = 8000
