---
name: gh-pr-create
description: Create a pull request on GitHub.
---

Create a pull request on GitHub.

1. Run the following commands.

```bash
PULL_REQUEST_TEMPLATE="$(git rev-parse --show-toplevel)/.github/PULL_REQUEST_TEMPLATE.md"
if [ -f "${PULL_REQUEST_TEMPLATE}" ]; then
  gh pr create --fill --draft --body-file "${PULL_REQUEST_TEMPLATE}"
else
  gh pr create --fill --draft
fi
```
