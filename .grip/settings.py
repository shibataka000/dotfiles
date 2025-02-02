import subprocess

PASSWORD = subprocess.run(["gh", "auth", "token"], capture_output=True, text=True, check=True).stdout.strip()
PORT = 8000
STYLE_URLS = ["https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.8.1/github-markdown.css"]
