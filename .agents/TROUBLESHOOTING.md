---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [needs-review]
created: 2026-05-27
updated: 2026-05-27
nexus_version: 6.0
---
# Atlas â€” Troubleshooting Guide

> Kháº¯c phá»¥c cÃ¡c lá»—i thÆ°á»ng gáº·p khi váº­n hÃ nh Gemini CLI + Atlas Skills.

---

## ðŸ’¥ Lá»—i 1: JavaScript heap out of memory

### Triá»‡u chá»©ng
```
<--- Last few GCs --->
[4696:...] Mark-Compact (reduce) 7438.7 (7510.9) MB â†’ ...
FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory
```

### NguyÃªn nhÃ¢n
- Máº·c Ä‘á»‹nh Node.js cáº¥p **~4 GB heap** (hoáº·c theo RAM mÃ¡y).
- Multimodal AI (Ä‘á»c áº£nh) decode JPG thÃ nh RGB tensor: `width Ã— height Ã— 3 channels Ã— 4 bytes`.
  - VÃ­ dá»¥ áº£nh 3307Ã—2339: 3307 Ã— 2339 Ã— 3 Ã— 4 â‰ˆ **93 MB raw má»—i áº£nh**.
- 5 áº£nh batch = 465 MB tensor + model state + conversation context â†’ vá»¡ 4 GB heap.

### Fix theo báº­c (Æ°u tiÃªn tá»« trÃªn xuá»‘ng)

#### Báº­c 1: DÃ¹ng pdf-stream-extract.sh (FIX CÄ‚N CÆ )
```bash
bash .gemini/hooks/pdf-stream-extract.sh "00_Raw/<file>.pdf" \
  --dpi 120 --max-width 1200 --quality 75
```
- Resize trÆ°á»›c khi Ä‘Æ°a vÃ o Vision â†’ tensor giáº£m ~5.5Ã—
- Split double-page scan â†’ process 1 ná»­a/láº§n
- Quality 75 â†’ file size nhá» hÆ¡n 30%

#### Báº­c 2: TÄƒng heap Node.js
```powershell
# PowerShell (Windows)
$env:NODE_OPTIONS="--max-old-space-size=16384"
gemini

# Persistent:
[Environment]::SetEnvironmentVariable("NODE_OPTIONS", "--max-old-space-size=16384", "User")
```
```bash
# bash/zsh (Mac/Linux/WSL)
export NODE_OPTIONS="--max-old-space-size=16384"
gemini

# Persistent â€” thÃªm vÃ o ~/.bashrc hoáº·c ~/.zshrc:
echo 'export NODE_OPTIONS="--max-old-space-size=16384"' >> ~/.bashrc
```
- `16384` = 16 GB heap. Adjust theo RAM mÃ¡y (Ä‘á»«ng vÆ°á»£t 75% RAM).
- ÄÃ¢y chá»‰ lÃ  band-aid; báº­c 1 váº«n cáº§n thiáº¿t.

#### Báº­c 3: Aggressive downscale
```bash
bash .gemini/hooks/pdf-stream-extract.sh "<file>" \
  --dpi 100 --max-width 900 --grayscale
```
- DPI 100: váº«n Ä‘á»§ rÃµ cho kanji size N5.
- max-width 900: tensor ~9.5 MB.
- `--grayscale`: 3 channel â†’ 1 channel â†’ tensor giáº£m 3Ã— ná»¯a (xuá»‘ng ~3 MB).

#### Báº­c 4: Single-sheet streaming + restart phiÃªn
1. Restart `gemini`.
2. `@pdf-investigator extract chá»‰ sheet-001-L`.
3. Chá» output â†’ `/compact` hoáº·c restart.
4. `@pdf-investigator extract chá»‰ sheet-001-R`.
5. Láº·p.

---

## ðŸ› Lá»—i 2: Agent loading error â€” Invalid tool name

### Triá»‡u chá»©ng
```
Failed to load agent from D:\...\agents\xxx.md:
  Validation failed: Agent Definition:
  tools.0: Invalid tool name
```

### NguyÃªn nhÃ¢n
DÃ¹ng tool name cá»§a Claude Code (`Read`, `Grep`, `Bash`) thay vÃ¬ Gemini CLI (`read_file`, `grep_search`, `run_shell_command`).

### Fix
Xem danh sÃ¡ch tool há»£p lá»‡ trong `.gemini/RULES.md` â†’ Â§Format Standards â†’ Tool names.

Mapping:
| Sai | ÄÃºng |
|---|---|
| `Read` | `read_file` |
| `Grep` | `grep_search` |
| `Glob` | `glob` |
| `Bash` | `run_shell_command` |
| `Edit` | `replace` |
| `Write` | `write_file` |
| `WebFetch` | `web_fetch` |
| `WebSearch` | `google_web_search` |

---

## ðŸ”£ Lá»—i 3: YAML frontmatter parsing failed â€” bad indentation

### Triá»‡u chá»©ng
```
YAML frontmatter parsing failed: bad indentation of a mapping entry (3:198)
```

### NguyÃªn nhÃ¢n
String trong YAML chá»©a dáº¥u `:` (mapping separator) mÃ  khÃ´ng Ä‘Æ°á»£c quote.

### Fix
Bá»c string chá»©a `:` trong dáº¥u nhÃ¡y:
```yaml
# âŒ SAI
description: ÄÃ¢y lÃ  ANTI-HALLUCINATION: luÃ´n citation page range.

# âœ… ÄÃšNG
description: "ÄÃ¢y lÃ  ANTI-HALLUCINATION mode â€” luÃ´n citation page range."
```

CÃ¡c kÃ½ tá»± cáº§n quote khi xuáº¥t hiá»‡n trong YAML string: `:`, `#`, `&`, `*`, `[`, `]`, `{`, `}`, `|`, `>`, `!`, `%`, `@`, `` ` ``.

---

## ðŸ“ Lá»—i 4: Slash command bá»‹ rename `/plan` â†’ `/workspace.plan`

### Triá»‡u chá»©ng
```
â„¹ Workspace command '/plan' was renamed to '/workspace.plan' because it conflicts with built-in command.
```

### NguyÃªn nhÃ¢n
Gemini CLI cÃ³ built-in `/plan` (Plan Mode). Custom command trÃ¹ng tÃªn bá»‹ thÃªm prefix `workspace.`.

### Lá»±a chá»n
- **Giá»¯ nguyÃªn**: dÃ¹ng `/workspace.plan` (váº«n hoáº¡t Ä‘á»™ng).
- **Äá»•i tÃªn**: Atlas Ä‘Ã£ rename `commands/plan.toml` â†’ `commands/atlas-plan.toml`. Sá»­ dá»¥ng `/atlas-plan`.

TÃªn cáº¥m trÃ¹ng (built-in): `/plan`, `/agents`, `/tools`, `/commands`, `/help`, `/clear`, `/quit`, `/compact`, `/rewind`, `/checkpoint`.

---

## ðŸš« Lá»—i 5: Auto-replace lan rá»™ng (linter bug)

### Triá»‡u chá»©ng
Tool names trong frontmatter biáº¿n thÃ nh `read_file_file`, `grep_search_search`, hoáº·c body chá»©a `read_fileME`, `thread_file-safe`.

### NguyÃªn nhÃ¢n
Linter / IDE extension Ä‘ang cháº¡y regex replace dáº¡ng `read` â†’ `read_file` (substring match, khÃ´ng cÃ³ word boundary).

### Fix táº¡m
Cháº¡y:
```bash
cd <vault>
find .gemini/agents -name "*.md" -exec sed -i \
  -e 's/read_file_file/read_file/g' \
  -e 's/grep_search_search/grep_search/g' \
  -e 's/write_file_file/write_file/g' \
  -e 's/read_fileME/README/g' \
  -e 's/thread_file/thread/g' \
  {} \;
```

### Fix cÄƒn cá»©
TÃ¬m vÃ  disable extension/script Ä‘ang cháº¡y. Kiá»ƒm tra:
- `.git/hooks/` cÃ³ gÃ¬ láº¡ khÃ´ng
- VSCode/Cursor extensions
- `package.json` scripts (post-commit, pre-write)

---

## ðŸ¤– Lá»—i 6: Gemini bá»‹a chuyá»‡n vá» ná»™i dung file

### Triá»‡u chá»©ng
- Há»i "trong NEJ Vol1 trang 50 cÃ³ gÃ¬" â†’ Gemini tráº£ lá»i confident nhÆ°ng sai.
- Bá»‹a furigana cho kanji khÃ´ng tháº¥y trong source.
- Tá»± táº¡o example dialogue giáº£ máº¡o source.

### NguyÃªn nhÃ¢n
1. File scan PDF khÃ´ng cÃ³ text layer â†’ Gemini khÃ´ng "Ä‘á»c" Ä‘Æ°á»£c.
2. Context overflow â†’ model "quÃªn" pháº§n Ä‘áº§u, fill báº±ng training data.
3. KhÃ´ng cÃ³ anti-hallucination guardrails.

### Fix
1. **Ingest Ä‘Ãºng cÃ¡ch**: dÃ¹ng `/pdf-ingest <file>` â†’ workflow OCR + chunking.
2. **Query Ä‘Ãºng cÃ¡ch**: dÃ¹ng `/pdf-query <keyword>` â†’ báº¯t buá»™c citation + abstain.
3. **Apply RULES.md Anti-Hallucination Protocol** (Ä‘Ã£ cÃ³ sáºµn trong vault):
   - Citation grounding báº¯t buá»™c
   - Abstain pattern khi khÃ´ng tÃ¬m tháº¥y
   - Source Trust Tier (Tier 5 = model memory bá»‹ cáº¥m tráº£ lá»i alone)

---

## ðŸ©º Health Check Commands

```bash
# Verify agents load
gemini  # rá»“i gÃµ /agents

# Validate all YAML frontmatter
python3 -c "
import yaml, glob
for f in glob.glob('.gemini/agents/*.md'):
    try:
        yaml.safe_load(open(f).read().split('---',2)[1])
        print('OK:', f)
    except Exception as e:
        print('FAIL:', f, e)
"

# Validate TOML commands
python3 -c "
import tomli, glob
for f in glob.glob('.gemini/commands/*.toml'):
    try:
        tomli.load(open(f,'rb'))
        print('OK:', f)
    except Exception as e:
        print('FAIL:', f, e)
"

# Check Node heap setting
echo $NODE_OPTIONS  # bash
$env:NODE_OPTIONS    # PowerShell

# Verify ImageMagick + pdftoppm available
which convert pdftoppm pdfinfo identify
```

---

## ðŸ“ž Khi táº¥t cáº£ Ä‘á»u fail

1. Restart `gemini` CLI hoÃ n toÃ n (close terminal, má»Ÿ má»›i).
2. Backup `.gemini/` folder â†’ xÃ³a â†’ restore tá»« Git.
3. Reduce scope: thay vÃ¬ `/pdf-ingest` full file, thá»­ `--from 1 --to 5` Ä‘á»ƒ test pipeline trÆ°á»›c.
4. Äá»c log Gemini CLI: thÆ°á»ng á»Ÿ `~/.gemini/logs/` hoáº·c `%USERPROFILE%\.gemini\logs\`.
