---
description: bookmarkの変更分をコードレビュー
agent: sisyphus
model: zai-coding-plan/glm-5
---

指定されたtarget-bookmarkとbase-bookmarkとの差分を確認し、コードレビューを行ってください。

## 引数
- target-bookmark: $1
- base-bookmark : $2 (省略時は `main`)
- 言語: $3 (`en` または `ja`、省略時は `ja`)

## バリデーション
- **target-bookmarkが指定されていない場合は、エラーメッセージを表示して終了してください。**

使用方法: `/code-rv <target-bookmark> [base-bookmark] [言語]`

## 前提
- jujutsu (jj) を使用しています。fishシェルで実行してください。
- 実行環境はWSL2を想定しています（クリップボード操作に `clip.exe` を使用）。
- 比較対象のベースは `$2` です。

## 手順
1. `fish -c 'jj bookmark list'` でbookmarkの存在を確認してください。
2. `fish -c 'jj diff -r "$2::$1"'` を実行し、コードの変更内容を取得してください。
3. 取得した差分（diff）に基づき、以下の観点でコードレビューをサブエージェント、ultrabrainに委託してください。
   - バグの可能性
   - 可読性と保守性
   - パフォーマンスへの影響
   - エッジケースの考慮
4. レビュー結果をMarkdown形式で生成してください。
5. 生成したMarkdownを一時ファイル（例: `review_result.md`）に保存してください。
6. `fish -c 'cat review_result.md | clip.exe'` を実行し、結果をクリップボードにコピーしてください。
7. 「クリップボードにコピーしました」と伝えて完了してください。

## 言語設定
- `ja` (デフォルト): レビューコメントを日本語で記述
- `en`: レビューコメントを英語で記述

## レビュー出力フォーマット例 (Markdown)

# Code Review for `$1`

## Summary
(変更の概要を1-2行で)

## 🔍 Issues / Concerns
- [Major/Minor] ファイル名: 行番号
  - 指摘内容...

## ✨ Good Points
- 良い実装や工夫されている点...

## 💡 Suggestions
- こうするとより良くなるという提案...
