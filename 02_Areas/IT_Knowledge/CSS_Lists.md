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
> **⚡ Kỹ thuật thực tế: Tạo Navigation Menu từ `<ul>`**
> Một trong những ứng dụng phổ biến nhất của danh sách trong CSS là thiết lập thanh menu điều hướng (Navigation Menu). Bằng cách kết hợp cấu trúc danh sách thuần với Flexbox layout, ta có thể xây dựng các menu hiện đại, chuẩn SEO và tối ưu trải nghiệm.
> 
> Xem chi tiết bài viết hướng dẫn thiết kế, các hạn chế kỹ thuật (A11y WebKit bug, mất markers) và giải pháp khắc phục bằng nguyên lý Composition tại:
> 👉 **[[CSS_Modern_Nav_Menu]] (Thiết kế Menu Hiện đại)**

> [!NOTE]
> **💡 Hint cho Java Developer:**
> - `list-style: none` + `padding: 0` là bước **khởi tạo / reset** — giống như khởi tạo một `ArrayList` rỗng trước khi thêm dữ liệu.
> - Style trên `<ul>/<ol>` ≈ **style trên class cha** (kế thừa xuống). Style trên `<li>` ≈ **override trên class con** — nguyên tắc Inheritance & Override quen thuộc trong Java OOP.

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| CSS Lists cung cấp 3 thuộc tính cốt lõi: `list-style-type` (kiểu marker), `list-style-image` (ảnh custom), `list-style-position` (vị trí marker). Rút gọn bằng `list-style` shorthand. **Pattern quan trọng nhất:** `list-style: none` + reset margin/padding để biến `<ul>` thành Navigation Menu — kỹ thuật nền tảng của mọi web layout. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[CSS_Modern_Nav_Menu]]
- [[CSS_Basics]]
- [[CSS_Selectors]]
- [[HTML_Basics]]
