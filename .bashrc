DOTFILES="${HOME}/.dotfiles"

# general
alias ll="ls -l"
alias diff="diff -u -N --color=auto"

# emacs
alias emacs="emacs -nw"

# golang
export GOPATH="${HOME}/go"
export PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"
export GOOS="linux"
export GOARCH="amd64"

# python
export PATH="${PATH}:${HOME}/.local/bin"
export PIPENV_VENV_IN_PROJECT="true"

# starship
export STARSHIP_CONFIG="${DOTFILES}/.starship.toml"
if [ $(command -v starship) ]; then
    eval "$(starship init bash)"
fi

# aws
export AWS_PROFILE="default"
if [ $(command -v aws) ]; then
    complete -C aws_completer aws
fi

# azure
ARM_CREDENTIALS="${HOME}/.azure/credentials"
if [ -e "${ARM_CREDENTIALS}" ]; then
    source "${ARM_CREDENTIALS}"
fi

# gcp
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.gcp/credentials"
GCLOUD_BASH_COMPLETION="/snap/google-cloud-sdk/current/completion.bash.inc"
if [ -e "${GCLOUD_BASH_COMPLETION}" ]; then
    source "${GCLOUD_BASH_COMPLETION}"
fi

# terraform
if [ $(command -v terraform) ]; then
    complete -C terraform terraform
fi

# gh
if [ $(command -v gh) ]; then
    source <(gh completion -s bash)
fi

# kubectl
alias k="kubectl"
alias kw="watch kubectl"
export KUBECTL_EXTERNAL_DIFF="diff -u -N --color=auto"
if [ $(command -v kubectl) ]; then
    complete -o default -F __start_kubectl k kw
fi

# krew
export PATH="${PATH}:${KREW_ROOT:-$HOME/.krew}/bin"

# kustomize
export XDG_CONFIG_HOME="${HOME}/.config"

# completion
for app in helm kubectl kustomize kind istioctl
do
    if [ $(command -v "${app}") ]; then
        source <(${app} completion bash)
    fi
done
