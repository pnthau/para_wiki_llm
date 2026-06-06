---
domain: "IT"
type: "concept"
status: "active"
tags: [it, css, web-basics, syntax]
created: 2026-06-06
source: "00_Raw/Cú pháp của CSS.md"
nexus_version: 8.2
---

# 🎨 CSS Syntax (Cú pháp CSS)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Cấu trúc Rule CSS** | Một **Rule** = **Selector** + **Declaration Block** (khối khai báo).<br>```css<br>p {<br>  color: red;      /* property: value */<br>  text-align: center;<br>}<br>```<br>- **Selector** (`p`): Chỉ tới phần tử HTML cần áp dụng.<br>- **Property** (`color`): Tên thuộc tính.<br>- **Value** (`red`): Giá trị của thuộc tính.<br>- Mỗi khai báo kết thúc bằng dấu `;`.<br>- Toàn bộ khối khai báo bọc trong `{ }`. |
| **3 Loại Selector Cơ bản** | **1. Element Selector** — Chọn theo tên thẻ HTML:<br>```css<br>h1 { color: blue; }<br>```<br>**2. Class Selector** (`.`) — Chọn theo thuộc tính `class` (dùng lại nhiều lần):<br>```css<br>.highlight { background: yellow; }<br>```<br>**3. ID Selector** (`#`) — Chọn theo `id` duy nhất trên trang:<br>```css<br>#header { font-size: 32px; }<br>``` |
| **Chú thích (Comment)** | Bắt đầu bằng `/*` và kết thúc bằng `*/`.<br>Có thể viết trên 1 dòng hoặc nhiều dòng. Trình duyệt bỏ qua hoàn toàn.<br>```css<br>/* Đây là chú thích một dòng */<br>/*<br>  Đây là chú thích<br>  nhiều dòng<br>*/<br>``` |
| **3 Cách nhúng CSS vào HTML** | **1. External (Tệp ngoài — KHUYẾN NGHỊ)**: Tách biệt hoàn toàn CSS sang file `.css`.<br>```html<br><link rel="stylesheet" href="style.css"><br>```<br>**2. Internal (Trong thẻ `<style>`)**: Viết CSS trong `<head>` của file HTML.<br>```html<br><style> p { color: red; } </style><br>```<br>**3. Inline (Trực tiếp trên thẻ)**: Ưu tiên cao nhất nhưng khó bảo trì.<br>```html<br><p style="color: red;">Text</p><br>``` |
| **Thứ tự ưu tiên (Specificity)** | Khi nhiều rule cùng tác động lên 1 phần tử, CSS áp dụng theo thứ tự ưu tiên từ cao đến thấp:<br>`Inline style` > `#ID` > `.class` > `element`<br>**Quy tắc vàng:** Tránh dùng `!important` vì gây khó debug — thay vào đó hãy tăng độ đặc hiệu của Selector. |

> [!TIP]
> **💡 Hint cho Java Developer:** Hãy tư duy CSS như **Dependency Injection** trong Spring: `External CSS` giống `@Bean` — tách biệt cấu hình (style) ra khỏi logic (HTML). Dùng `Inline style` giống viết hardcode — chỉ dùng khi thực sự cần thiết, tránh tạo ra "technical debt".

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Một Rule CSS = `selector { property: value; }`. Ba loại selector cơ bản là: Element, Class (`.`), ID (`#`). Luôn ưu tiên dùng **External CSS** để tách biệt giao diện khỏi nội dung — nguyên tắc này tương đương với **Separation of Concerns** trong lập trình Java. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[CSS_Basics]]
- [[HTML_Basics]]
- [[JavaScript_Basics]]
