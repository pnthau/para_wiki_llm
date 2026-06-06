---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [needs-review]
created: 2026-05-27
updated: 2026-05-27
nexus_version: 6.0
---
# AGENTS â€” Registry cÃ¡c Subagent cá»§a Atlas v6.0

> Tá»± Ä‘á»™ng Ä‘á»c bá»Ÿi Gemini CLI má»—i khi route yÃªu cáº§u.
> Khi thÃªm/sá»­a agent: cáº­p nháº­t báº£ng nÃ y.

---

## ðŸ§© Agent Index

| Agent | File | Tools | Má»¥c Ä‘Ã­ch | Khi nÃ o dÃ¹ng |
|---|---|---|---|---|
| `planner` | `agents/planner.md` | read_file, grep_search, glob | Láº­p káº¿ hoáº¡ch implementation | Feature má»›i, refactor lá»›n, kiáº¿n trÃºc |
| `code-reviewer` | `agents/code-reviewer.md` | + run_shell_command | Review code cháº¥t lÆ°á»£ng + báº£o trÃ¬ | Sau khi sá»­a code, trÆ°á»›c commit |
| `security-reviewer` | `agents/security-reviewer.md` | + run_shell_command | Báº¯t lá»— há»•ng báº£o máº­t | Code Ä‘á»™ng cháº¡m secrets/auth/input |
| `build-error-resolver` | `agents/build-error-resolver.md` | + run_shell_command | Xá»­ lÃ½ lá»—i build | Khi `mvn`/`npm` fail |
| `doc-updater` | `agents/doc-updater.md` | + replace, write_file | Cáº­p nháº­t docs & MOCs | Sau khi merge feature |
| `java-reviewer` | `agents/java-reviewer.md` | + run_shell_command | Review chuyÃªn sÃ¢u Java/Spring | File `.java`, `pom.xml`, `application.yml` |
| `vault-auditor` | `agents/vault-auditor.md` | + run_shell_command | Audit cáº¥u trÃºc PARA + MOCs | Ä á»‹nh ká»³ hoáº·c theo lá»‡nh |
| `n5-tutor` | `agents/n5-tutor.md` | + replace | Coach N5 cÃ¡ nhÃ¢n hÃ³a | Má» i ná»™i dung tiáº¿ng Nháº­t |
| `strategy-advisor` | `agents/strategy-advisor.md` | (default 3) | Cá»‘ váº¥n chiáº¿n lÆ°á»£c (Sun Tzu, 36 káº¿) | TÃ¬nh huá»‘ng Ä‘á»‘i Ä‘áº§u, ra quyáº¿t Ä‘á»‹nh |
| `docs-lookup` | `agents/docs-lookup.md` | + web_fetch, google_web_search | Tra cá»©u docs (API, library) | Khi cáº§n info chÃ­nh thá»©c |
| `pdf-investigator` | `agents/pdf-investigator.md` | + read_many_files, list_directory, run_shell_command, write_file | Ä á» c PDF scan + query cÃ³ citation | Upload PDF, há» i ná»™i dung sÃ¡ch scan |
| `ga-expert` | `agents/ga-expert.md` | + google_web_search, web_fetch, write_file, ask_user | Chuyên gia nuôi gà: bệnh, dinh dưỡng, chuồng trại, kinh tế | Mọi câu hỏi về nuôi gà |

> Ghi chÃº: "default 3" = `read_file`, `grep_search`, `glob`.
> Model: táº¥t cáº£ agent dÃ¹ng `inherit` (káº¿ thá»«a tá»« session). CÃ³ thá»ƒ override trong `settings.json` â†’ `agents.overrides.<name>.modelConfig.model`.

---

## ðŸ”— Má»‘i liÃªn káº¿t Agent â†” Skill

| Agent | Skill liÃªn quan |
|---|---|
| `java-reviewer` | `skills/java-architect` |
| `n5-tutor` | `skills/n5-sensei` |
| `vault-auditor` | `skills/vault-curator` |
| `strategy-advisor` | `skills/strategy-master`, `skills/strategy-proctor` |
| `code-reviewer` | `skills/code-reviewer` |
| `security-reviewer` | `skills/security-reviewer` |
| `doc-updater` | `skills/learning-web-architect` |
| `pdf-investigator` | `skills/pdf-japanese-ocr` |
| `ga-expert` | `skills/ga-expert` |

---

## 📐 Convention (Antigravity CLI compliant)

- **Tên file** = `name` trong frontmatter, lowercase + hyphen/underscore.
- **`description`** phải mô tả rõ **trigger** (khi nào auto-activate).
- **`kind: local`** explicit cho mọi agent project-level.
- **`tools`** dùng tên snake_case chính thức (xem `.agents/RULES.md` cho danh sách).
- **`model`** thÆ°á»ng Ä‘á»ƒ máº·c Ä‘á»‹nh (`inherit`); override trong `settings.json` náº¿u cáº§n.
- **Tool block format** (preferred): má»—i tool 1 dÃ²ng `  - tool_name`.

---

## âž• CÃ¡ch thÃªm agent má»›i

1. Táº¡o file `agents/<name>.md` vá»›i YAML frontmatter chuáº©n (xem `RULES.md` Â§Format Standards).
2. Body pháº£i cÃ³ sections: `## Role`, `## Process`, `## Output Format`.
3. ThÃªm row vÃ o báº£ng trÃªn.
4. Náº¿u agent gáº¯n vá»›i skill: cáº­p nháº­t "Má»‘i liÃªn káº¿t" á»Ÿ trÃªn.
5. Test trong CLI:
   - Restart `gemini`
   - `/agents` Ä‘á»ƒ verify list.
   - GÃµ trigger phrase tá»± nhiÃªn â†’ kiá»ƒm tra auto-route.
   - Hoáº·c force gá»i: `@<name> <task>`.

---

## ðŸ”§ Override model trong settings.json (tÃ¹y chá»n)

Máº·c Ä‘á»‹nh má»i agent káº¿ thá»«a model cá»§a session. Náº¿u muá»‘n Ã©p model cho 1 agent cá»¥ thá»ƒ:

```json
{
  "agents": {
    "overrides": {
      "code-reviewer": {
        "modelConfig": { "model": "gemini-3-flash-preview" },
        "runConfig": { "maxTurns": 50 }
      },
      "planner": {
        "modelConfig": { "model": "gemini-3-preview" }
      }
    }
  }
}
```

File `settings.json` nằm ở `~/.gemini/antigravity-cli/settings.json` (user-level) hoặc `.agents/settings.json` (project-level).
