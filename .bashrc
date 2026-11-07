#!/bin/bash

# source other files
TOPLEVEL="$(git -C "$(dirname "$(realpath "${BASH_SOURCE[0]}")")" rev-parse --show-toplevel)"
source ${TOPLEVEL}/.bash/environment
source ${TOPLEVEL}/.bash/aliases
source ${TOPLEVEL}/.bash/completion

# direnv
if [ $(command -v direnv) ]; then
    eval "$(direnv hook bash)"
fi

# starship
if [ $(command -v starship) ]; then
    eval "$(starship init bash)"
fi
