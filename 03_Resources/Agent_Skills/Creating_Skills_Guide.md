---
domain: "IT"
type: "tutorial"
status: "active"
tags: [gemini-cli, agent-skills, meta-knowledge]
created: 2026-05-11
source: "00_Raw/Creating Agent Skills.md"
---

# Hướng dẫn Tạo Agent Skills

> **Tóm tắt:** Agent Skills cho phép mở rộng khả năng của Gemini CLI bằng các kiến thức chuyên biệt, quy trình làm việc và tài nguyên cụ thể.

## 🚀 Cách tạo nhanh (Dùng Skill-Creator)
Yêu cầu Gemini trực tiếp:
> “Create a new skill called ‘code-reviewer’ that analyzes local files for common errors and style violations.”

Gemini sẽ tự động:
1. Tạo thư mục (ví dụ: `.gemini/skills/code-reviewer/`).
2. Tạo file `SKILL.md` với YAML frontmatter (`name` và `description`).
3. Tạo các thư mục tài nguyên: `scripts/`, `references/`, và `assets/`.

## 🛠️ Tạo thủ công (Manual Creation)

### 1. Cấu trúc Thư mục
```text
my-skill/
├── SKILL.md       (Bắt buộc) Hướng dẫn và Metadata
├── scripts/       (Tùy chọn) Các script thực thi (JS, Python...)
├── references/    (Tùy chọn) Tài liệu tham khảo tĩnh
└── assets/        (Tùy chọn) Template hoặc tài nguyên khác
```

### 2. Định nghĩa Skill (SKILL.md)
File này cực kỳ quan trọng vì nó chứa **trigger** để Gemini kích hoạt skill.
```markdown
---
name: my-skill-name
description: 
  Mô tả chi tiết khi nào nên dùng skill này (ví dụ: "Dùng khi user hỏi về review code").
---
# Hướng dẫn cho Agent
[Các quy tắc và bước thực hiện khi skill được kích hoạt]
```

## 🔍 Các cấp độ Discovery (Tầm vóc)
1. **Built-in Skills**: Đi kèm với Gemini CLI.
2. **Extension Skills**: Đi kèm với các extension.
3. **User Skills**: Nằm trong `~/.gemini/skills/` (Toàn cục cho user).
4. **Workspace Skills**: Nằm trong `.gemini/skills/` (Chỉ cho project hiện tại).

## 🔧 Lệnh quản lý
- `/skills list`: Liệt kê các skill đang có.
- `/skills reload`: Làm mới danh sách skill.
- `gemini skills install <url>`: Cài đặt skill từ nguồn bên ngoài.

**Related:**
- [[MOC_IT_Knowledge]]
- [[GEMINI.md]]
