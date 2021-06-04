# general
export DOTFILES="$HOME/.dotfiles"
alias ll="ls -l"

# emacs
alias emacs="emacs -nw"
alias e="emacs"

# golang
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
export GOOS="linux"
export GOARCH="amd64"

# python
export PATH="$PATH:$HOME/.local/bin"
export PIPENV_VENV_IN_PROJECT="true"

# aws
export AWS_PROFILE="default"
if [ $(which aws) ]; then
    complete -C aws_completer aws
fi

# azure
ARM_CREDENTIALS=$HOME/.azure/credentials
if [ -e $ARM_CREDENTIALS ]; then
    . $ARM_CREDENTIALS
fi

# gcp
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.gcp/credentials

# terraform
if [ $(which terraform) ]; then
    complete -C terraform terraform
fi

# kubectl
alias k=kubectl
alias kw="watch kubectl"
export KUBECTL_EXTERNAL_DIFF="diff -u -N --color=auto"
if [ $(which kubectl) ]; then
    source <(kubectl completion bash)
    complete -o default -F __start_kubectl k kw
fi

# kubectx, kubens
KUBECTX="$DOTFILES/kubectx"
export PATH="$PATH:$KUBECTX"
source $KUBECTX/completion/kubectx.bash
source $KUBECTX/completion/kubens.bash
alias kctx=kubectx
alias kns=kubens

# kustomize
export XDG_CONFIG_HOME=$HOME/.config
if [ $(which kustomize) ]; then
    source <(kustomize completion bash)
fi

# kind
if [ $(which kind) ]; then
    source <(kind completion bash)
fi

# flux
if [ $(which flux) ]; then
    source <(flux completion bash)
fi

# starship
export STARSHIP_CONFIG=$DOTFILES/.starship.toml
if [ $(which starship) ]; then
    eval "$(starship init bash)"
fi
