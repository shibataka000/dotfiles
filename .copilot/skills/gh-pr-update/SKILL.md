---
name: gh-pr-update
description: Pull requestの変更内容をタイトル・本文へ反映します。
disable-model-invocation: true
---

# gh-pr-update

1. `gh pr view --json title,body` を実行してPRのタイトル・本文を取得してください。
2. `gh pr diff` を実行してPRの変更内容を取得してください。
3. 「PRのタイトル・本文」と「PRの変更内容」の間に矛盾や乖離がないか確認してください。矛盾や乖離がある場合はステップ4へ進んでください。矛盾や乖離がない場合は処理を終了してください。
4. 「PRのタイトル・本文」と「PRの変更内容」の間の矛盾や乖離をなくすためにPRのタイトル・本文をどう修正すべきか考えてください。
5. PRのタイトル・本文をステップ4で考えた内容へ変更してよいかユーザーに確認してください。
6. `gh pr edit --title <title> --body <body>` を実行してPRのタイトル・本文をステップ4で考えた内容へ変更してください。
