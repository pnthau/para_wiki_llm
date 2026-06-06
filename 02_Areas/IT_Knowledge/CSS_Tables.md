---
domain: "IT"
type: "concept"
status: "active"
tags: [it, css, table, web-basics]
created: 2026-06-06
source: "00_Raw/Bảng trong CSS.md"
nexus_version: 8.2
---

# 📊 CSS Tables (Bảng trong CSS)

| 💡 Từ khóa / Câu hỏi (Cue)           | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                                                                                                                                                                                         |
| :----------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Đường viền & Lỗi viền đôi**        | - Mặc định, viết `table, th, td { border: 1px solid black; }` sẽ tạo ra **viền đôi** do mỗi cell và table đều vẽ viền độc lập.<br>- Sử dụng **`border-collapse: collapse;`** trên thẻ `<table>` để gộp các đường viền chồng chéo lại thành một đường viền đơn duy nhất.<br>```table {<br>  border-collapse: collapse;}```                                           |
| **Kích thước & Căn chỉnh**           | - **Kích thước:** Điều khiển qua `width` và `height`. Thông thường, `table` đặt `width: 100%;` để giãn theo thẻ cha.<br>- **Căn lề ngang (`text-align`):** Thiết lập cho `<th>` hoặc `<td>`. Mặc định `<th>` căn giữa, `<td>` căn trái.<br>- **Căn lề dọc (`vertical-align`):** Căn nội dung theo chiều cao cell (`top`, `bottom`, `middle`). Mặc định là `middle`. |
| **Độ giãn cách (Padding)**           | - Kiểm soát khoảng cách từ text tới viền cell bằng **`padding`** áp dụng cho `<th>` và `<td>` (không áp dụng cho `<tr>` hay `<table>`).<br>```css<br>th, td {<br>  padding: 12px 15px;<br>}<br>```                                                                                                                                                                  |
| **Màu sắc & Chia ranh giới dữ liệu** | - **`background-color`** và **`color`** thường được dùng để tô đậm hàng tiêu đề `<th>` nhằm tăng tính tương phản cho bảng dữ liệu.<br>```css<br>th {<br>  background-color: #04AA6D; /* Màu xanh lá nổi bật */<br>  color: white;<br>}<br>```                                                                                                                       |

> [!TIP]
> **⚡ Kỹ thuật thiết kế bảng dữ liệu chuyên nghiệp & Tương thích di động**
> 
> 1. **Zebra Striping (Kẻ sọc xen kẽ):** Giúp người đọc dễ theo dõi hàng ngang của bảng số liệu dài mà không bị lệch mắt.
>    ```css
>    /* Tô màu xám nhạt cho tất cả hàng chẵn */
>    tr:nth-child(even) {
>      background-color: #f2f2f2;
>    }
>    ```
> 
> 2. **Hoverable Table (Hiệu ứng di chuột):** Tăng trải nghiệm tương tác trực quan bằng cách đổi màu nền hàng khi người dùng rê chuột qua.
>    ```css
>    tr:hover {
>      background-color: #ddd;
>    }
>    ```
> 
> 3. **Responsive Table (Bảng cuộn ngang trên Mobile):** Bảng HTML có xu hướng bị tràn viền hoặc co bẹp chữ trên màn hình điện thoại nhỏ. Để khắc phục, bao bọc thẻ `<table>` bằng một thẻ `<div>` có thuộc tính `overflow-x: auto;`:
>    ```html
>    <div style="overflow-x: auto;">
>      <table>
>        <!-- Nội dung bảng -->
>      </table>
>    </div>
>    ```
> 
> 4. **`table-layout: fixed;`:** Theo mặc định (`auto`), trình duyệt phải đọc hết nội dung các cell để tính toán độ rộng cột cho phù hợp, gây chậm hiệu năng khi bảng quá lớn. Sử dụng `table-layout: fixed;` kết hợp với việc set cứng chiều rộng của cột sẽ tối ưu hiệu suất kết xuất (render) và ngăn chặn việc cột bị co giãn thất thường khi nội dung text bên trong quá dài.

> [!NOTE]
> **💡 Hint cho Java Developer:**
> * **`tr:nth-child(even)`** hoạt động như việc bạn duyệt qua một `List<Row>` và đổi màu nền các phần tử thỏa mãn điều kiện `index % 2 == 0`.
> * **`table-layout: fixed`** hoạt động tương tự cấu trúc mảng tĩnh trong Java (như `int[] arr = new int[10]`) — cấu trúc cứng kích thước ngay từ đầu giúp tối ưu bộ nhớ và thời gian xử lý so với mảng động tự co giãn.
> * **`overflow-x: auto`** bao ngoài bảng giống như cách bạn bọc một `JTable` hoặc `ListView` trong một thành phần cuộn `JScrollPane` trong lập trình ứng dụng Desktop (Swing/JavaFX) để ngăn giao diện tổng bị vỡ khi dữ liệu quá lớn.

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Để tạo lập một bảng CSS chuyên nghiệp, cần ghi nhớ 4 quy tắc cốt lõi: dùng `border-collapse: collapse` để xóa viền kép, thêm `padding` cho th/td để tạo khoảng thở dữ liệu, áp dụng `tr:nth-child(even)` tạo sọc xen kẽ (Zebra), và bọc bảng bằng một container `overflow-x: auto` để xử lý responsive trên thiết bị di động. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[HTML_Basics]]
- [[CSS_Basics]]
