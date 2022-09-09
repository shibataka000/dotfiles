import os
import yaml

home = os.environ["HOME"]
hosts_filepath = os.path.join(home, ".config", "gh", "hosts.yml")
with open(hosts_filepath) as f:
    hosts = yaml.safe_load(f)

PASSWORD = hosts["github.com"]["oauth_token"]
PORT = 8000
