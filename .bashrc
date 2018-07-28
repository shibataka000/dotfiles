# general
alias emacs="emacs -nw"
alias ll="ls -l"

# golang
export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"

# python
export PATH="$HOME/.local/bin:$PATH"

# azure
ARM_CREDENTIALS=$HOME/.azure/credentials
if [ -e $ARM_CREDENTIALS ]; then
    . $ARM_CREDENTIALS
fi
