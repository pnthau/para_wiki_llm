---
domain: "IT"
type: "concept"
status: "active"
tags: [it, css, selector, web-basics]
created: 2026-06-06
source: "00_Raw/Selector khác nhau trong CSS.md"
nexus_version: 8.2
---

# 🎯 CSS Selectors (Các bộ chọn CSS)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Element Selector** | Chọn tất cả phần tử theo **tên thẻ HTML**. Áp dụng toàn bộ.<br>```css<br>p { color: red; text-align: center; }<br>h1 { font-size: 2rem; }<br>``` |
| **ID Selector (`#`)** | Chọn **1 phần tử duy nhất** theo thuộc tính `id`.<br>- Prefix: `#` trước id.<br>- `id` **phải là duy nhất** trong toàn trang — vi phạm gây lỗi validation.<br>- Không được bắt đầu bằng chữ số hay ký tự đặc biệt.<br>```css<br>#header { background: #333; color: white; }<br>``` |
| **Class Selector (`.`)** | Chọn **nhiều phần tử** cùng chung một `class`. Có thể tái sử dụng.<br>- Prefix: `.` trước tên class.<br>- Kết hợp: `p.center` → chỉ `<p>` có `class="center"`.<br>- Một phần tử có thể mang **nhiều class**: `class="box highlight"`.<br>```css<br>.center { text-align: center; }<br>p.highlight { background: yellow; }<br>``` |
| **Grouping Selector (`,`)** | Gộp nhiều selector dùng chung cùng một style — **giảm code trùng lặp** (nguyên tắc DRY).<br>```css<br>/* Thay vì viết 3 rule riêng: */<br>h1, h2, p {<br>  text-align: center;<br>  color: gray;<br>}<br>``` |
| **Universal Selector (`*`)** | Chọn **tất cả** phần tử trên trang. Thường dùng để reset CSS.<br>```css<br>* { margin: 0; padding: 0; box-sizing: border-box; }<br>``` |
| **Descendant Selector** | Chọn phần tử **con cháu** nằm bên trong phần tử cha (không kể độ sâu).<br>```css<br>/* Mọi <a> nằm trong <nav>, ở bất kỳ độ sâu nào */<br>nav a { text-decoration: none; }<br>``` |
| **Child Selector (`>`)** | Chọn phần tử **con trực tiếp** của cha (chỉ 1 cấp sâu).<br>```css<br>/* Chỉ <li> là con trực tiếp của <ul> */<br>ul > li { list-style: none; }<br>``` |
| **Pseudo-class (`:`)** | Chọn phần tử ở một **trạng thái đặc biệt**.<br>```css<br>a:hover { color: orange; }    /* Khi hover chuột */<br>a:visited { color: purple; }  /* Đã click vào */<br>input:focus { border: 2px solid blue; } /* Đang nhập */<br>li:first-child { font-weight: bold; }   /* Phần tử con đầu tiên */<br>``` |

> [!TIP]
> **⚡ Cheat-sheet "Khi nào dùng selector nào?"**
> | Tình huống | Dùng |
> | :--- | :--- |
> | Style tất cả một loại thẻ | `element` |
> | Style 1 phần tử đặc biệt duy nhất | `#id` |
> | Style nhóm phần tử có thể tái dùng | `.class` |
> | Style trạng thái động (hover, focus) | `:pseudo-class` |
> | Reset toàn bộ margin/padding | `*` |
> | Style phần tử lồng nhau trong cha | `parent child` hoặc `parent > child` |

> [!NOTE]
> **💡 Hint cho Java Developer:**
> - `#id` ≈ **tên biến duy nhất** — mỗi biến chỉ tồn tại 1 lần trong scope.
> - `.class` ≈ **interface** — nhiều class Java khác nhau có thể `implements` cùng 1 interface, nhiều thẻ HTML khác nhau có thể dùng cùng 1 `.class`.
> - `Descendant selector` ≈ **composition** — cha "sở hữu" con, nhưng không cần biết con là ai.

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| CSS Selectors là "cơ chế nhắm mục tiêu" của CSS. Nắm 4 loại cốt lõi: `element`, `#id`, `.class`, `grouping (,)`. Trong thực tế, kết hợp thêm `pseudo-class (:hover, :focus)` và `descendant selector` để xây dựng UI động và có cấu trúc. Ưu tiên `.class` over `#id` để code có tính tái sử dụng cao hơn. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[CSS_Basics]]
- [[CSS_Syntax]]
- [[HTML_Basics]]
