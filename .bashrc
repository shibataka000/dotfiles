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

# kube-ps1
. $DOTFILES/kube-ps1/kube-ps1.sh
export PS1='$(kube_ps1)'$PS1
export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_CTX_COLOR=75
export KUBE_PS1_NS_COLOR=75

# kustomize
export XDG_CONFIG_HOME=$HOME/.config

# kind
if [ $(which kind) ]; then
    source <(kind completion bash)
fi
