DOTFILES="${HOME}/.dotfiles"

# general
alias ll="ls -l"

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

# aws
export AWS_PROFILE="default"
if [ $(which aws) ]; then
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
if [ $(which terraform) ]; then
    complete -C terraform terraform
fi

# kubectl
alias k="kubectl"
alias kw="watch kubectl"
export KUBECTL_EXTERNAL_DIFF="diff -u -N --color=auto"
if [ $(which kubectl) ]; then
    complete -o default -F __start_kubectl k kw
fi

# kubectx, kubens
alias kctx="kubectx"
alias kns="kubens"
KUBECTX="${DOTFILES}/kubectx"
export PATH="${PATH}:${KUBECTX}"
source "${KUBECTX}/completion/kubectx.bash"
source "${KUBECTX}/completion/kubens.bash"

# kustomize
export XDG_CONFIG_HOME="${HOME}/.config"

# starship
export STARSHIP_CONFIG="${DOTFILES}/.starship.toml"
if [ $(which starship) ]; then
    eval "$(starship init bash)"
fi

# stern
if [ $(which stern) ]; then
    source <(stern --completion bash)
fi

# completion
for app in kubectl kind kustomize flux argo go-get-release
do
    if [ $(which "${app}") ]; then
        source <(${app} completion bash)
    fi
done
