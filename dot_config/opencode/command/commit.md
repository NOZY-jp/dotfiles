---
description: jujutsuでコミットを作成
agent: build
model: opencode/grok-code
---

現在のステージングされた変更をコミットしてください。

## 引数
- 言語: $1 (`en` または `ja`、省略時は `ja`)

## バリデーション
- **言語が `en` または `ja` 以外の場合は、エラーメッセージを表示して終了してください。**

使用方法: `/commit [言語]`

## 前提
jujutsuを使用しています。fishシェルで実行してください。

## 言語設定
- `ja` (デフォルト): コミットメッセージを日本語で記述
- `en`: コミットメッセージを英語で記述

## 手順
1. `fish -c 'jj status'` で現在の状態を確認
2. `fish -c 'jj diff'` で変更内容を確認
3. 変更内容を分析して適切なコミットメッセージを作成
4. `fish -c 'jj commit "{コミットメッセージ}"'` でコミットを実行

## Conventional Commits形式
コミットメッセージは以下の形式で記述してください:
`<type>: <description>`

### Prefix一覧
- feat: 新機能の追加
- fix: バグ修正
- docs: ドキュメントのみの変更
- style: コードの意味に影響しない変更（フォーマット等）
- refactor: バグ修正でも機能追加でもないコード変更
- perf: パフォーマンス改善
- test: テストの追加・修正
- build: ビルドシステムや外部依存関係の変更
- ci: CI設定の変更
- chore: その他の変更（設定ファイル等）
- revert: 以前のコミットの取り消し

例:
- feat: add user authentication
- fix: resolve null pointer in login
- docs: update API documentation
- chore: update dependencies
