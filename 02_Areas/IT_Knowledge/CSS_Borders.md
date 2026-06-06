---
domain: "IT"
type: "concept"
status: "active"
tags: [it, css, border, layout, web-basics]
created: 2026-06-06
source: "00_Raw/Đường viền trong CSS.md"
nexus_version: 8.2
---

# 🔲 CSS Borders (Đường viền trong CSS)

| 💡 Từ khóa / Câu hỏi (Cue)          | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| :---------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Kiểu đường viền (`border-style`)**| - Xác định loại viền hiển thị (bắt buộc phải có để viền xuất hiện).<br>- **Các giá trị phổ biến:** `solid` (nét liền), `dashed` (nét đứt), `dotted` (chấm tròn), `double` (nét đôi).<br>- **Hiệu ứng 3D (ít dùng hơn):** `groove` (xẻ rãnh), `ridge` (nổi), `inset` (chìm), `outset` (nổi lên).<br>- **Reset:** `none` hoặc `hidden` (ẩn viền).                                                                                                                                                    |
| **Chiều rộng & Màu sắc**            | - **`border-width`:** Chiều rộng viền. Giá trị cụ thể (`px`, `em`, `rem`) hoặc định sẵn (`thin`, `medium`, `thick`).<br>- **`border-color`:** Màu sắc viền. Định dạng bằng tên màu, mã Hex, RGB, hoặc `transparent` (trong suốt). Nếu bỏ qua, màu viền sẽ mặc định theo màu chữ của phần tử đó (*color inheritance*).                                                                                                                                                                           |
| **Quy tắc TRBL (Chiều kim đồng hồ)**| Áp dụng khi truyền từ 1 đến 4 giá trị cho thuộc tính viền:<br>- **4 giá trị:** `Top` `Right` `Bottom` `Left` (Ví dụ: `10px 5px 15px 20px`).<br>- **3 giá trị:** `Top` `[Right/Left]` `Bottom` (Ví dụ: `10px 5px 15px`).<br>- **2 giá trị:** `[Top/Bottom]` `[Right/Left]` (Ví dụ: `10px 5px`).<br>- **1 giá trị:** Áp dụng cho cả 4 cạnh (Ví dụ: `10px`).                                                                                                                                                   |
| **Khai báo rút gọn (`border`)**     | - Cho phép viết nhanh 3 thuộc tính trên cùng 1 dòng.<br>- **Cú pháp:** `border: [width] [style] [color];`<br>- Cần thiết lập riêng biệt từng cạnh bằng thuộc tính con như: `border-top`, `border-bottom`, `border-left`, `border-right`.<br>```css<br>p { border-bottom: 2px dashed red; } /* Tạo đường gạch chân nét đứt */<br>```                                                                                                                                                               |

> [!TIP]
> **⚡ Kỹ thuật thiết kế Border hiện đại: Bo góc, Outline & Shadow**
> 
> 1. **Bo góc với `border-radius` (Cực kỳ quan trọng):**
>    Giúp giao diện trông mềm mại, hiện đại hơn thay vì các hình chữ nhật vuông vức.
>    * *Bo góc nhẹ:* `border-radius: 8px;` (phổ biến cho card, button).
>    * *Tạo hình tròn:* Thiết lập trên phần tử hình vuông với `border-radius: 50%;` (phổ biến cho ảnh đại diện).
>    * *Tạo nút dạng kẹo nhộng (Pill-shape button):* Đặt `border-radius` lớn hơn hẳn chiều cao của nút (ví dụ: `border-radius: 9999px;`).
> 
> 2. **Phân biệt `border` và `outline`:**
>    * **Border (Đường viền):** Chiếm diện tích thực tế trong mô hình hộp (Box Model). Đổi border lớn hơn sẽ làm dịch chuyển các phần tử xung quanh.
>    * **Outline (Đường viền ngoài):** Được vẽ **phía ngoài** border, không chiếm diện tích trong layout. Đổi outline lớn cỡ nào cũng không ảnh hưởng vị trí các phần tử khác. Thường dùng để làm nổi bật trạng thái `:focus` cho người dùng điều hướng bằng bàn phím.
> 
> 3. **Đổ bóng kết hợp `box-shadow`:**
>    Kết hợp viền mờ màu sắc nhẹ nhàng và đổ bóng tạo cảm giác chiều sâu (Material Design):
>    ```css
>    .card {
>      border: 1px solid #e0e0e0;
>      border-radius: 8px;
>      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
>    }
>    ```

> [!NOTE]
> **💡 Hint cho Java Developer:**
> * **Quy tắc TRBL (Chiều kim đồng hồ)** giống hệt thứ tự tham số khởi tạo cấu trúc lề **`Insets`** hoặc **`EmptyBorder`** trong Java Swing: 
>   `new Insets(top, left, bottom, right)` hoặc `BorderFactory.createEmptyBorder(top, left, bottom, right)`.
> * **`border-radius: 50%`** tương ứng với việc bạn dùng Graphics2D để vẽ hình bầu dục/tròn khép kín bằng phương thức **`g.fillOval(x, y, width, height)`** thay vì `g.fillRect()`.
> * **Outline vs Border:** 
>   * `border` giống như **kích thước biên của Component** (ảnh hưởng trực tiếp đến Layout Manager như `GridBagLayout` tính toán lại lưới).
>   * `outline` giống như một **Decorator tự vẽ thêm** bằng Graphics (`g.drawRect(...)` thủ công đè lên ngoài biên của component) — vẽ cho đẹp chứ Layout Manager hoàn toàn không biết đến sự tồn tại của nó, do đó không gây dịch chuyển vị trí các nút khác.
> * **`border: none;`** tương đương lệnh tắt viền component trong Java Swing: **`button.setBorder(null);`**.

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| CSS Borders cho phép định hình đường bao quanh các phần tử qua kích thước, màu sắc và kiểu dáng bằng cú pháp viết gọn `border`. Để tối ưu hóa thiết kế giao diện hiện đại, lập trình viên thường phối hợp thêm `border-radius` để bo tròn góc, dùng `outline` cho các trạng thái focus mà không làm vỡ bố cục grid, và dùng `box-shadow` để tăng chiều sâu cho ứng dụng. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[HTML_Basics]]
- [[CSS_Basics]]
- [[CSS_Syntax]]
