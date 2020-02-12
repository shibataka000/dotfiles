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

# aws
complete -C aws_completer aws

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
source <(kubectl completion bash)
complete -o default -F __start_kubectl k
complete -o default -F __start_kubectl kw

# terraform
complete -C /usr/local/bin/terraform terraform
