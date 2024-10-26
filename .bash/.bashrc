# dotfiles
DOTFILES="${HOME}/.dotfiles"

# asdf
. "${HOME}/.asdf/asdf.sh"

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
export GOPATH="${HOME}/go"
export PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"
export GOOS="linux"
export GOARCH="amd64"

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
