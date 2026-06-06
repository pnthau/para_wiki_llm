---
domain: "IT"
type: "concept"
status: "active"
tags: [it, css, layout, navigation, flexbox, web-basics]
created: 2026-06-06
source: "02_Areas/IT_Knowledge/CSS_Lists.md"
nexus_version: 8.2
---

# 🌐 CSS Modern Navigation Menu (Thiết kế Menu Hiện đại)

| 💡 Từ khóa / Câu hỏi (Cue)          | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                                                                                                                                                                                                                            |
| :---------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Vai trò Semantic HTML**           | - `<ul>` và `<li>` **vẫn bắt buộc sử dụng** cho cấu trúc menu.<br>- Giúp **SEO** hiểu phân cấp trang và **Accessibility (A11y)** cho phép Screen Reader đọc đúng số lượng liên kết trong menu.<br>- Tránh dùng các thẻ `<div>` vô nghĩa để làm thanh điều hướng chính.                                                                                                                                 |
| **CSS Layout: Cũ vs Hiện đại**      | - **Cũ (`display: inline-block` / `float`):** Dễ bị lỗi khoảng trắng thừa (Whitespace Gap Bug) do ký tự xuống dòng trong HTML.<br>- **Hiện đại (`display: flex`):** Thiết lập trên thẻ `<ul>`. Giải quyết triệt để lỗi khoảng trắng, cho phép căn chỉnh trục đứng/ngang dễ dàng và điều chỉnh khoảng cách qua thuộc tính `gap`.                                                                        |
| **Cú pháp Flexbox Menu tiêu chuẩn** | ```nav ul {  list-style: none; /* Reset: Xóa markers mặc định */  margin: 0;  padding: 0;  display: flex; /* Bật Flexbox */  <br>gap: 1.5rem; /* Khoảng cách giữa các item */ <br>align-items: center; /* Căn giữa theo chiều dọc */} <br>nav ul li a {display: block;  padding: 8px 16px;  text-decoration: none; transition: background 0.2s;}```                                                    |
| **Hạn chế 1: Mất Marker tự động**   | - Nếu đặt `display: flex` trực tiếp trên `<li>`, định dạng gốc của nó bị chuyển từ `list-item` sang `flex-container`. Điều này làm thuộc tính `list-style-type` (bullet/số thứ tự) mất tác dụng.<br>- *Giải pháp:* Sử dụng giải pháp **Composition** (xem hint Java).                                                                                                                                  |
| **Hạn chế 2: Lỗi A11y trên Safari** | - Thay đổi display của danh sách sang `flex` hoặc `grid` có thể khiến WebKit/Safari xóa bỏ "List Role" trong cây hỗ trợ tiếp cận (A11y), khiến Screen Reader xem nó như `<div>` thông thường.<br>- *Giải pháp:* Thêm rõ ràng `role="list"` vào `<ul>` và `role="listitem"` vào `<li>` trong HTML.<br>```<ul role="list" style="display: flex;">  <li role="listitem"><a href="#">Home</a></li></ul>``` |

> [!NOTE]
> **💡 Hint cho Java Developer: Ưu tiên Composition (Hợp thành) hơn Inheritance (Kế thừa)**
> * **Vấn đề:** Khi bạn muốn căn chỉnh icon và text nằm ngang đẹp mắt bên trong một dòng danh sách `<li>`, bạn có xu hướng đổi `<li>` thành `display: flex`. Điều này giống như lập trình hướng đối tượng (OOP) ép kiểu kế thừa sai bản chất: `class Li extends FlexContainer` -> làm mất đi các phương thức marker mặc định của `list-item`.
> * **Giải pháp (Composition):** Thay vì thay đổi bản chất của `<li>`, hãy giữ nó là `list-item` (để có bullet/số mặc định nếu muốn), và lồng một thẻ con `<div>` làm flex-container bên trong.
>   ```html
>   <li> <!-- Giữ nguyên display: list-item -->
>     <!-- Khai báo Composition bên trong -->
>     <div style="display: inline-flex; align-items: center; gap: 8px;">
>       <img src="icon.png" alt="icon" width="16">
>       <span>Mục lục chính</span>
>     </div>
>   </li>
>   ```

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Thiết kế Navigation Menu hiện đại tối ưu là sự kết hợp giữa **Semantic HTML** (`<ul>`/`<li>` với các `role` A11y thích hợp) và **Flexbox Layout** trên thẻ cha để phân chia không gian. Khi muốn tùy biến sâu layout bên trong từng dòng danh sách mà vẫn muốn giữ marker tự động, hãy áp dụng nguyên tắc **Composition** bằng cách lồng thẻ `flex-container` con thay vì biến `<li>` thành Flexbox trực tiếp. |

---
**Related:**
- [[CSS_Lists]]
- [[CSS_Basics]]
- [[HTML_Basics]]
- [[MOC_IT_Knowledge]]
