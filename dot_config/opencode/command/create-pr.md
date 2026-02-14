---
description: bookmarkからPRを作成
agent: build
model: opencode/grok-code
---

指定されたbookmarkからGitHub PRを作成してください。

## 引数
- bookmark名: $1
- 言語: $2 (`en` または `ja`、省略時は `ja`)

## バリデーション
- **bookmark名が指定されていない場合は、エラーメッセージを表示して終了してください。**
- **言語が `en` または `ja` 以外の場合は、エラーメッセージを表示して終了してください。**

使用方法: `/create-pr <bookmark名> [言語]`

## 前提
- jujutsuを使用しています。fishシェルで実行してください。
- PRのベースブランチはmainです。

## 手順
1. `fish -c 'jj bookmark list'` でbookmarkの存在を確認
2. `fish -c 'jj log -r "main::$1"'` でmainからの変更を確認
3. 変更内容を分析してPRの説明を作成
4. `fish -c 'jj git push --bookmark $1'` でリモートにpush
5. `gh pr create --head $1 --base main` でPRを作成

## 言語設定
- `ja` (デフォルト): PRタイトルと説明を日本語で記述
- `en`: PRタイトルと説明を英語で記述

PR作成コマンド例:
```
gh pr create --head $1 --base main --title "PRタイトル" --body "$(cat <<'EOF'
## Summary
- 変更点1
- 変更点2
EOF
)"
```

PRのタイトルと説明は変更の「なぜ」を重視し、簡潔に記述してください。
作成したPRのURLを表示してください。
