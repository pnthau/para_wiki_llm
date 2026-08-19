# 🇬🇧 English Vocab Master Database
> **Mục tiêu:** Lưu trữ và vận dụng tiếng Anh qua 2 cơ chế: **Ôn tập ngắt quãng (Spaced Repetition)** và **Học thụ động (Passive Learning)**.

## 🎯 1. Template Từ vựng (Vocabulary Card)
*Tạo một file mới trong thư mục `02_Areas/English` cho mỗi từ vựng quan trọng và dán cấu trúc này vào:*

```markdown
---
tags:
  - vocab/english
  - vocab/IT
sr-due: 2026-08-02
sr-interval: 1
sr-ease: 250
---
# {{Title}} (Từ vựng)

- **Phiên âm:** 
- **Nghĩa tiếng Việt:** 
- **Ngữ cảnh (Context):** Thường dùng khi nào?

### 🔄 Học thụ động (Passive Exposure)
*(Viết 2 câu ví dụ thực tế liên quan trực tiếp đến dự án Java hoặc đời sống công sở của bạn. Không viết ví dụ chung chung)*
1. 
2. 

### ⏱️ Ôn tập ngắt quãng (Flashcard)
{{Title}} nghĩa là gì và cho 1 ví dụ? :: (Điền nghĩa và ví dụ vào đây. Cài plugin Spaced Repetition để ôn tập)
```

---

## 📡 2. Bảng Điều Khiển Học Thụ Động (Passive Dashboard)
*(Sử dụng plugin Dataview để hiển thị ngẫu nhiên hoặc hiển thị 5 từ vựng mới nhất bạn vừa học lên màn hình mỗi ngày. Đặt đoạn code này ở màn hình trang chủ của Vault)*

```dataview
TABLE Nghĩa_tiếng_Việt, Ngữ_cảnh
FROM #vocab/english
SORT file.mtime DESC
LIMIT 5
```
