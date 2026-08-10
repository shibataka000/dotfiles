#!/bin/bash

# source other files
TOPLEVEL="$(cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")" && git rev-parse --show-toplevel)"
source ${TOPLEVEL}/.bash/.bash_env
source ${TOPLEVEL}/.bash/.bash_aliases
source ${TOPLEVEL}/.bash/.bash_completion
source ${TOPLEVEL}/.bash/.bash_functions

# azure
ARM_CREDENTIALS="${HOME}/.azure/credentials"
if [ -e "${ARM_CREDENTIALS}" ]; then
    source "${ARM_CREDENTIALS}"
fi

# starship
if [ $(command -v starship) ]; then
    eval "$(starship init bash)"
fi
