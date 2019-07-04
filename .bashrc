# general
DOTFILES=$HOME/.dotfiles
alias ll="ls -l"

# emacs
alias emacs="emacs -nw"
alias e="emacs"

# golang
export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"

# python
export PATH="$HOME/.local/bin:$PATH"
export PIPENV_VENV_IN_PROJECT="true"

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
source <(kubectl completion bash)
complete -o default -F __start_kubectl k
source $DOTFILES/kube-ps1.sh
export PS1='$(kube_ps1)'$PS1

# terraform
complete -C /usr/local/bin/terraform terraform
