---
domain: "IT"
type: "concept"
status: "active"
tags: [it, css, list, web-basics]
created: 2026-06-06
source: "00_Raw/Danh sách trong CSS.md"
nexus_version: 8.2
---

# 📋 CSS Lists (Danh sách trong CSS)

| 💡 Từ khóa / Câu hỏi (Cue)          | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| :---------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **2 loại danh sách HTML**           | - `<ul>` — **Unordered List**: Bullet point (không thứ tự).<br>- `<ol>` — **Ordered List**: Số hoặc chữ cái (có thứ tự).<br>- Mỗi phần tử bên trong là thẻ `<li>`.                                                                                                                                                                                                                                                                                                                              |
| **`list-style-type`**               | Thay đổi kiểu **ký hiệu đánh dấu** (marker) của danh sách.<br><br>**Cho `<ul>` (Unordered):**<br>`disc` (●), `circle` (○), `square` (■), `none` (ẩn marker)<br><br>**Cho `<ol>` (Ordered):**<br>`decimal` (1,2,3), `lower-alpha` (a,b,c), `upper-alpha` (A,B,C), `lower-roman` (i,ii,iii), `upper-roman` (I,II,III)<br><br>```css<br>ul { list-style-type: square; }<br>ol { list-style-type: upper-roman; }<br>ul.no-bullet { list-style-type: none; } /* Reset để dùng làm nav menu */<br>``` |
| **`list-style-image`**              | Dùng **hình ảnh tùy chỉnh** làm marker thay cho ký hiệu mặc định.<br>```ul {  list-style-image: url('star.png');}```<br>⚠️ Lưu ý: Khó kiểm soát kích thước ảnh — trong thực tế thường dùng `background-image` + `list-style: none` để linh hoạt hơn.                                                                                                                                                                                                                                            |
| **`list-style-position`**           | Xác định vị trí của marker so với nội dung `<li>`.<br>- `outside` (mặc định): Marker nằm **ngoài** khối text, text wrap không bao gồm vùng marker.<br>- `inside`: Marker nằm **trong** khối text, dòng đầu text sẽ thụt vào sau marker.<br>```ul { list-style-position: inside; }```                                                                                                                                                                                                            |
| **`list-style` (Shorthand)**        | Rút gọn 3 thuộc tính trong 1 dòng. Thứ tự: `type` `position` `image`.<br>```css/* type position image */                       ul { list-style: square inside url('bullet.png'); }   /* Nếu bỏ image, fallback về type khi ảnh lỗi */     ul { list-style: disc outside none; }```                                                                                                                                                                                                              |
| **Styling màu sắc `ol/ul` vs `li`** | Style đặt trên `<ol>/<ul>` → ảnh hưởng **cả danh sách** (kể cả marker).<br>Style đặt trên `<li>` → chỉ ảnh hưởng **từng phần tử**.<br>```ol { color: blue; }    /* Toàn bộ ol + marker đều xanh */        li { color: red; }/* Chỉ text từng li đỏ, marker vẫn theo ol */<br>```                                                                                                                                                                                                                |

> [!TIP]
> **⚡ Kỹ thuật thực tế: Tạo Navigation Menu Hiện đại từ `<ul>`**
> Phương pháp hiện đại kết hợp tính chất **Semantic HTML** (sử dụng `<ul>`/`<li>` cho SEO và Accessibility) và sức mạnh layout của **Flexbox** thay vì `display: inline-block` hay `float: left` truyền thống:
> ```css
> /* Bước 1: Reset list về zero */
> nav ul {
>   list-style: none;   /* Xóa bullet */
>   margin: 0;
>   padding: 0;
>   
>   /* Bước 2: Áp dụng Flexbox trên thẻ cha ul */
>   display: flex;      
>   gap: 1.5rem;        /* Khoảng cách trực tiếp giữa các item */
>   align-items: center;
> }
> /* Bước 3: Style link */
> nav ul li a {
>   display: block;
>   padding: 10px 20px;
>   text-decoration: none;
>   color: white;
>   background: #333;
>   transition: background 0.2s;
> }
> nav ul li a:hover { background: #555; }
> ```
> ⚠️ **Hạn chế & Lưu ý khi dùng Flexbox với List:**
> 1. **Mất dấu đầu dòng (Markers):** Nếu thiết lập `display: flex` trực tiếp trên thẻ `<li>`, phần tử sẽ chuyển từ định dạng `list-item` sang `flex-container` và làm mất hiệu lực của `list-style-type` (mất bullet point/marker).
>    * *Giải pháp:* Dùng giải pháp **Composition** (xem hint Java bên dưới).
> 2. **Lỗi Accessibility (WebKit/Safari Bug):** Thay đổi `display` của `<ul>`/`<li>` thành `flex` có thể khiến một số trình duyệt (như Safari) xóa bỏ ngữ cảnh danh sách (List Role) trong cây hỗ trợ tiếp cận (A11y).
>    * *Giải pháp:* Thêm thuộc tính `role="list"` vào thẻ `<ul>` và `role="listitem"` vào các thẻ `<li>` trong mã HTML.

> [!NOTE]
> **💡 Hint cho Java Developer:**
> - `list-style: none` + `padding: 0` là bước **khởi tạo / reset** — giống như khởi tạo một `ArrayList` rỗng trước khi thêm dữ liệu.
> - Style trên `<ul>/<ol>` ≈ **style trên class cha** (kế thừa xuống). Style trên `<li>` ≈ **override trên class con** — nguyên tắc Inheritance & Override quen thuộc trong Java OOP.
> - **Giải pháp Composition (Hợp thành) thay thế Inheritance (Kế thừa):** Khi muốn căn chỉnh layout bên trong item bằng Flexbox mà không làm mất marker tròn/số của `<li>` (do mất kiểu định dạng `list-item`), ta không biến `<li>` thành Flexbox trực tiếp. Thay vào đó, ta lồng một thẻ con `<div>` có `display: flex` bên trong `<li>`. Điều này phản ánh nguyên lý thiết kế phần mềm kinh điển: *"Favor Composition over Inheritance"* (Ưu tiên bố cục hơn kế thừa).

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| CSS Lists cung cấp 3 thuộc tính cốt lõi: `list-style-type` (kiểu marker), `list-style-image` (ảnh custom), `list-style-position` (vị trí marker). Rút gọn bằng `list-style` shorthand. **Pattern quan trọng nhất:** `list-style: none` + reset margin/padding để biến `<ul>` thành Navigation Menu — kỹ thuật nền tảng của mọi web layout. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[CSS_Basics]]
- [[CSS_Selectors]]
- [[HTML_Basics]]
