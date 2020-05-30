# general
export DOTFILES="$HOME/.dotfiles"
alias ll="ls -l"

# emacs
alias emacs="emacs -nw"
alias e="emacs"

# golang
export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"
export GOOS="linux"
export GOARCH="amd64"

# python
export PATH="$HOME/.local/bin:$PATH"
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

# k8s
alias k=kubectl
alias kc=kubectx
alias kn=kubens
alias kw="watch kubectl"
if [ $(which kubectl) ]; then
    source <(kubectl completion bash)
    complete -o default -F __start_kubectl k
    complete -o default -F __start_kubectl kw
fi

# kube-ps1
. $DOTFILES/.kube-ps1/kube-ps1.sh
export PS1='$(kube_ps1)'$PS1
export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_CTX_COLOR=85
export KUBE_PS1_NS_COLOR=75

# terraform
if [ $(which terraform) ]; then
    complete -C terraform terraform
fi

# kind
if [ $(which kind) ]; then
    source <(kind completion bash)
fi

# kustomize
export XDG_CONFIG_HOME=$HOME/.config
