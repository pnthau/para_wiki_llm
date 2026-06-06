#!/usr/bin/env bash
# Atlas Git Time Machine — Atomic snapshot helper
# Usage: ./git-snapshot.sh "<commit message>"
# KHÔNG tự push. Chỉ đề xuất chuỗi lệnh.

set -euo pipefail

MSG="${1:-checkpoint: atlas autosave $(date +%Y-%m-%d_%H%M)}"
ROOT="$(git rev-parse --show-toplevel)"

cd "$ROOT"

echo "🧭 Atlas Git Time Machine"
echo "─────────────────────────"
echo

# 1. Show status
echo "📂 Working tree status:"
git status --short
echo

# 2. Stage suggestion
echo "✅ Files đã staged:"
git diff --cached --name-only || echo "(không có)"
echo

# 3. Generate commit-message preview
echo "💬 Proposed commit message:"
echo "  $MSG"
echo

# 4. Suggest commands (KHÔNG tự chạy)
echo "🚀 Lệnh đề xuất (copy-paste để chạy):"
echo
echo "  git add ."
echo "  git commit -m \"$MSG\""
echo "  # Push thủ công khi sẵn sàng:"
echo "  # git push origin \$(git branch --show-current)"
echo

# 5. Last 3 commits for context
echo "📜 3 commits gần nhất:"
git log --oneline -3 2>/dev/null || echo "(repo mới, chưa có commit)"
echo

echo "─────────────────────────"
echo "⚠️  Atlas KHÔNG tự commit/push. Quyết định cuối thuộc về John."
