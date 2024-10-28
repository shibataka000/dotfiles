# dotfiles
DOTFILES="${HOME}/.dotfiles"

# asdf
if [ -e "${HOME}/.asdf/asdf.sh" ]; then
    source "${HOME}/.asdf/asdf.sh"
fi

# aws
export AWS_PROFILE="default"

# azure
ARM_CREDENTIALS="${HOME}/.azure/credentials"
if [ -e "${ARM_CREDENTIALS}" ]; then
    source "${ARM_CREDENTIALS}"
fi

# gcp
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.gcp/credentials"

# gh
export PATH="${PATH}:${HOME}/.gh/bin"

# go
export PATH="${PATH}:/usr/local/go/bin"
export PATH="${PATH}:${HOME}/go/bin"

# krew
export PATH="${PATH}:${KREW_ROOT:-$HOME/.krew}/bin"

# kubectl
export KUBECTL_EXTERNAL_DIFF="diff -u -N --color=auto"

# kustomize
export XDG_CONFIG_HOME="${HOME}/.config"

# python
export PATH="${PATH}:${HOME}/.local/bin"
export PIPENV_VENV_IN_PROJECT="true"

# starship
export STARSHIP_CONFIG="${DOTFILES}/.starship/starship.toml"
if [ $(command -v starship) ]; then
    eval "$(starship init bash)"
fi
