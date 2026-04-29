---
description: 作成するissueの計画を立てる
agent: plan
model: opencode/grok-code
---

現在のコードベースやコンテキストから、GitHubに登録すべきissueを提案してください。

手順:
1. 現在の状況を分析（git status、最近の変更、TODOコメントなど）
2. 登録すべきissueの候補をリストアップ
3. 各issueについて以下を提案:
   - タイトル
   - 本文（問題の説明、再現手順、期待する動作など）
   - ラベル（bug, enhancement, documentation など）

実際にissueを作成するには `/create-issue-build` を使用してください。

$ARGUMENTS
