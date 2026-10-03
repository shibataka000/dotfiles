#!/bin/bash

# source other files
TOPLEVEL="$(git -C "$(dirname "$(realpath "${BASH_SOURCE[0]}")")" rev-parse --show-toplevel)"
source ${TOPLEVEL}/.bash/.bash_env
source ${TOPLEVEL}/.bash/.bash_credentials
source ${TOPLEVEL}/.bash/.bash_aliases
source ${TOPLEVEL}/.bash/.bash_completion

# starship
if [ $(command -v starship) ]; then
    eval "$(starship init bash)"
fi
