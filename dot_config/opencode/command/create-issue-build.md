---
description: GitHubにissueを作成
agent: build
model: opencode/grok-code
---

GitHubにissueを作成してください。

ghコマンドを使用して実際にissueを登録します。

引数が指定されている場合はその内容でissueを作成:
$ARGUMENTS

引数がない場合は、現在の状況を分析してissueを作成してください。

コマンド例:
```
gh issue create --title "タイトル" --body "本文"
```

ラベルを付ける場合:
```
gh issue create --title "タイトル" --body "本文" --label "bug"
```
