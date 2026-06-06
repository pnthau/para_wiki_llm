#!/usr/bin/env bash
# Atlas — Vault Health Score Dashboard
# Output 0-100 score theo 6 component, kèm top issues.
#
# Usage: ./vault-health.sh [--brief]

set -uo pipefail

BRIEF=0
[ "${1:-}" = "--brief" ] && BRIEF=1

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT"

# Find helper: skip vault-irrelevant dirs
find_md() {
  find "${1:-.}" -type d \( -name .git -o -name .gemini -o -name .obsidian \
    -o -name .trash -o -name node_modules \) -prune -o \
    -type f -name '*.md' -print 2>/dev/null
}

# Count totals
TOTAL=$(find_md . | wc -l)
if [ "$TOTAL" -eq 0 ]; then
  echo "Vault rỗng. Score: N/A"
  exit 0
fi

# 1. LINKAGE: % notes có ≥1 wiki-link
WITH_LINKS=$(find_md . | while read -r f; do
  grep -q '\[\[' "$f" && echo 1
done | wc -l)
LINKAGE=$((WITH_LINKS * 100 / TOTAL))

# 2. MOC COVERAGE: % notes được MOC reference
MOC_TARGETS=$(grep -rohE '\[\[[^]|#]+' ./MOCs/ 2>/dev/null | sed 's/\[\[//' | sort -u)
MOC_COVERED=0
while read -r note; do
  bn=$(basename "$note" .md)
  if echo "$MOC_TARGETS" | grep -qFx "$bn"; then
    MOC_COVERED=$((MOC_COVERED + 1))
  fi
done < <(find_md .)
MOC_COVERAGE=$((MOC_COVERED * 100 / TOTAL))

# 3. YAML COMPLIANCE: % notes có frontmatter mở/đóng đúng
WITH_YAML=$(find_md . | while read -r f; do
  first_line=$(head -1 "$f" | tr -d '\r')
  if [ "$first_line" = "---" ]; then
    if tr -d '\r' < "$f" | awk 'NR>1 && /^---$/ {found=1; exit} END {exit !found}'; then
      echo 1
    fi
  fi
done | wc -l)
YAML_COMPLIANCE=$((WITH_YAML * 100 / TOTAL))

# 4. FRESHNESS: % notes update trong 90 ngày
FRESH=$(find_md . | xargs -I{} stat -c '%Y {}' 2>/dev/null | awk -v now=$(date +%s) -v cutoff=$((90*86400)) '{ if (now - $1 < cutoff) c++ } END { print c+0 }')
FRESHNESS=$((FRESH * 100 / TOTAL))

# 5. ATOMICITY: % notes <300 lines
ATOMIC=$(find_md . | while read -r f; do
  lines=$(wc -l < "$f")
  [ "$lines" -lt 300 ] && echo 1
done | wc -l)
ATOMICITY=$((ATOMIC * 100 / TOTAL))

# 6. DIET: 1 - (violations / total)
LARGE=$(find . -size +1M ! -name '*.md' \
  -not -path './.git/*' -not -path './.obsidian/*' \
  -not -path './node_modules/*' 2>/dev/null | wc -l)
NM_LEAK=$(find ./01_Projects -path '*node_modules*' -name '*.md' 2>/dev/null | wc -l)
DIET_VIOL=$((LARGE + NM_LEAK))
if [ "$DIET_VIOL" -eq 0 ]; then
  DIET=100
else
  DIET=$((100 - (DIET_VIOL * 100 / (TOTAL + DIET_VIOL))))
  [ "$DIET" -lt 0 ] && DIET=0
fi

# Total weighted score
TOTAL_SCORE=$(awk "BEGIN { printf \"%.0f\", \
  0.25*$LINKAGE + 0.20*$MOC_COVERAGE + 0.20*$YAML_COMPLIANCE + \
  0.15*$FRESHNESS + 0.10*$ATOMICITY + 0.10*$DIET }")

# Status icon
status_icon() {
  local s=$1
  if [ "$s" -ge 90 ]; then echo "✅"
  elif [ "$s" -ge 75 ]; then echo "🟢"
  elif [ "$s" -ge 60 ]; then echo "🟡"
  else echo "🔴"
  fi
}

OVERALL_ICON=$(status_icon "$TOTAL_SCORE")
OVERALL_LABEL=""
if [ "$TOTAL_SCORE" -ge 90 ]; then OVERALL_LABEL="Excellent"
elif [ "$TOTAL_SCORE" -ge 75 ]; then OVERALL_LABEL="Good"
elif [ "$TOTAL_SCORE" -ge 60 ]; then OVERALL_LABEL="Fair"
else OVERALL_LABEL="Poor"
fi

# Brief mode: 1-line output
if [ "$BRIEF" -eq 1 ]; then
  echo "Vault Health: $TOTAL_SCORE/100 $OVERALL_ICON $OVERALL_LABEL ($TOTAL notes)"
  exit 0
fi

# Full report
cat <<EOF
# 🌿 Vault Health Report — $(date +%Y-%m-%d)

**Overall**: $TOTAL_SCORE/100 $OVERALL_ICON **$OVERALL_LABEL**
**Total notes**: $TOTAL

## Component scores

| Component | Score | Weight | Status |
|---|---|---|---|
| Linkage (≥1 wiki-link) | $LINKAGE/100 | 25% | $(status_icon $LINKAGE) |
| MOC Coverage | $MOC_COVERAGE/100 | 20% | $(status_icon $MOC_COVERAGE) |
| YAML Compliance | $YAML_COMPLIANCE/100 | 20% | $(status_icon $YAML_COMPLIANCE) |
| Freshness (<90 ngày) | $FRESHNESS/100 | 15% | $(status_icon $FRESHNESS) |
| Atomicity (<300 lines) | $ATOMICITY/100 | 10% | $(status_icon $ATOMICITY) |
| Vault Diet | $DIET/100 | 10% | $(status_icon $DIET) |

## Top Issues

EOF

# Issues
issue_num=0
if [ "$NM_LEAK" -gt 0 ]; then
  issue_num=$((issue_num + 1))
  echo "$issue_num. 🔴 **node_modules leak**: $NM_LEAK markdown files trong \`01_Projects/*/node_modules/\`"
fi
if [ "$LARGE" -gt 0 ]; then
  issue_num=$((issue_num + 1))
  echo "$issue_num. 🟡 **Large files**: $LARGE binary file >1MB chưa exclude"
fi
ORPHAN_RATIO=$((100 - MOC_COVERAGE))
if [ "$ORPHAN_RATIO" -gt 30 ]; then
  issue_num=$((issue_num + 1))
  echo "$issue_num. 🟡 **MOC coverage thấp**: $((TOTAL - MOC_COVERED)) notes chưa link vào MOC nào"
fi
if [ "$YAML_COMPLIANCE" -lt 90 ]; then
  issue_num=$((issue_num + 1))
  echo "$issue_num. 🟡 **YAML thiếu**: $((TOTAL - WITH_YAML)) notes thiếu frontmatter"
fi
if [ "$FRESHNESS" -lt 60 ]; then
  issue_num=$((issue_num + 1))
  echo "$issue_num. 🟡 **Stale notes**: $((TOTAL - FRESH)) notes >90 ngày không update"
fi
if [ "$ATOMICITY" -lt 80 ]; then
  issue_num=$((issue_num + 1))
  echo "$issue_num. 🟡 **Non-atomic**: $((TOTAL - ATOMIC)) notes >300 lines"
fi

if [ $issue_num -eq 0 ]; then
  echo "✨ Không phát hiện issue lớn nào — vault healthy!"
fi

cat <<EOF

## Quick wins

EOF
[ "$NM_LEAK" -gt 0 ] && echo "- Update \`.geminiignore\` + \`git rm -r --cached node_modules/\` (~2 phút)"
[ "$ORPHAN_RATIO" -gt 30 ] && echo "- \`bash .gemini/hooks/vault-cleanup.sh orphans\` để fix MOC coverage (~15 phút)"
[ "$YAML_COMPLIANCE" -lt 90 ] && echo "- Chạy \`@vault-auditor lint yaml\` để fix frontmatter (~10 phút)"
[ "$FRESHNESS" -lt 60 ] && echo "- Review stale notes: \`find . -mtime +90 -name '*.md' | head -10\`"

echo
echo "Generated by \`vault-health.sh\` — Atlas v6.0"
