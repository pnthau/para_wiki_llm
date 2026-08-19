# 🔬 Science Research Master Database
> **Mục tiêu:** Quản lý tri thức Khoa học (Toán, Vật lý, Sinh học, Systems Thinking...). Tích hợp **Học thụ động**, **Ôn tập ngắt quãng** và **Học tăng cường (Reinforcement Learning)**.

## 🎯 1. Template Khái niệm Khoa học (Concept Card)
*Khi học một khái niệm khoa học mới (ví dụ: Butterfly Effect, Paradigm Shift), hãy tạo một file và dùng cấu trúc sau:*

```markdown
---
tags:
  - science/concept
  - science/systems-thinking
sr-due: 2026-08-02
sr-interval: 1
sr-ease: 250
---
# {{Title}} (Khái niệm Khoa học)

### 🧩 1. Khái niệm cốt lõi (Passive Exposure)
> **Tóm tắt siêu ngắn (Occam's Razor):** [Viết lại khái niệm bằng đúng 1 câu duy nhất, ngôn ngữ bình dân].

### ⏱️ 2. Ôn tập ngắt quãng (Spaced Repetition)
Hỏi: Bản chất của {{Title}} là gì và cho 1 ví dụ thực tế? 
:: Đáp: (Ghi đáp án ở đây. Hệ thống Spaced Repetition sẽ tự nhắc bạn ôn lại dựa trên mức độ quên của não).

### ⚙️ 3. Học tăng cường / Phản hồi (Reinforcement Learning Loop)
*(Đây là phần quan trọng nhất. Dùng để ghi lại quá trình "Thử và Sai" - Error & Trial, tạo ra Vòng lặp phản hồi củng cố)*
* **Thất bại/Sai lầm (Thesis):** Khi áp dụng lý thuyết này vào đời sống hoặc lúc code, tôi đã sai ở đâu? (Ví dụ: Biết là phải Zoom out nhưng vẫn cáu gắt và đổ lỗi cho team).
* **Phân tích (Antithesis):** Tại sao lại thất bại? (Do áp lực hạch hạnh nhân, do quên...).
* **Giải pháp tinh chỉnh (Synthesis):** Lần tới khi gặp tình huống tương tự, tôi sẽ phản ứng thế nào? (Bài học kinh nghiệm).
```

---

## 📡 2. Bảng Theo Dõi Khái Niệm Khoa Học (Dashboard)
*(Sử dụng Dataview để xem nhanh các khái niệm bạn đang nghiên cứu, giúp não bộ "nhìn thấy" chúng thụ động mỗi khi mở kho Obsidian)*

```dataview
TABLE Tóm_tắt_siêu_ngắn
FROM #science/concept
SORT file.mtime DESC
```
