#!/bin/bash
set -euo pipefail
pane_current_path="${1}"
if git -C "${pane_current_path}" rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  basename $(git -C "${pane_current_path}" rev-parse --show-toplevel)
else
  basename "${pane_current_path}"
fi
