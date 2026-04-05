---
name: gh-pr-create
description: Pull requestを作成します。
disable-model-invocation: true
---

# gh-pr-create

1. 以下のコマンドを実行してください。

```bash
PULL_REQUEST_TEMPLATE="$(git rev-parse --show-toplevel)/.github/PULL_REQUEST_TEMPLATE.md"
if [ -f "${PULL_REQUEST_TEMPLATE}" ]; then
  gh pr create --fill --draft --body-file "${PULL_REQUEST_TEMPLATE}"
else
  gh pr create --fill --draft
fi
```
