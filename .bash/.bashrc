# This should be read before .bash_completion

ROOT="$(cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")" && git rev-parse --show-toplevel)"

# aws
export AWS_PROFILE="default"

# azure
ARM_CREDENTIALS="${HOME}/.azure/credentials"
if [ -e "${ARM_CREDENTIALS}" ]; then
    source "${ARM_CREDENTIALS}"
fi

# claude code
export CLAUDE_CODE_USE_BEDROCK=1

# gcp
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.gcp/credentials"

# go
export PATH="${PATH}:/usr/local/go/bin"
export PATH="${PATH}:${HOME}/go/bin"

# krew
export PATH="${PATH}:${KREW_ROOT:-$HOME/.krew}/bin"

# kubectl
export KUBECTL_EXTERNAL_DIFF="diff -u -N --color=auto"

# python
export PIPENV_VENV_IN_PROJECT="true"

# starship
export STARSHIP_CONFIG="${ROOT}/.starship/starship.toml"
if [ $(command -v starship) ]; then
    eval "$(starship init bash)"
fi

# tools
export PATH="${PATH}:${HOME}/github.com/shibataka000/tools"

# XDG Base Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export PATH="${PATH}:${HOME}/.local/bin"
