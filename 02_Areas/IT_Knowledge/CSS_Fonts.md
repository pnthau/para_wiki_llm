---
domain: "IT"
type: "concept"
status: "active"
tags: [it, css, font, typography, web-basics]
created: 2026-06-06
source: "00_Raw/Phông chữ với CSS.md"
nexus_version: 8.2
---

# 🔤 CSS Fonts (Phông chữ trong CSS)

| 💡 Từ khóa / Câu hỏi (Cue)          | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| :---------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`font-family` & Hệ thống Fallback**| - Xác định phông chữ cho văn bản bằng **`font-family`**.<br>- **Quy tắc dự phòng (Fallback):** Đặt phông chữ mong muốn trước, kết thúc bằng một nhóm phông chung (*generic family* như `serif`, `sans-serif`, `monospace`) để trình duyệt tự chọn thay thế nếu phông trước đó không có sẵn.<br>- Tên phông chữ có nhiều hơn 1 từ bắt buộc đặt trong dấu nháy kép.<br>```css<br>p { font-family: "Times New Roman", Times, serif; }<br>```                                                           |
| **Kiểu phông (`font-style` / `weight`)**| - **`font-style`:** Đặt kiểu chữ nghiêng (`normal`, `italic`, hoặc `oblique` - chữ xiên xiết, ít dùng).<br>- **`font-weight`:** Độ đậm của chữ (`normal`, `bold`, hoặc các giá trị số từ `100` đến `900` tương ứng từ siêu mỏng đến siêu đậm).<br>- **`font-variant`:** Chuyển đổi chữ thường thành chữ hoa nhỏ (`small-caps`).                                                                                                                                                 |
| **Kích thước (`font-size`)**       | - Thiết lập kích thước chữ qua đơn vị tuyệt đối (`px`) hoặc tương đối (`em`, `%`).<br>- **Tuyệt đối (`px`):** Kiểm soát chính xác chiều cao hiển thị, nhưng kém tối ưu cho các trình duyệt thu phóng màn hình cũ.<br>- **Tương đối (`em`):** Tỉ lệ so với phông chữ của cha nó. Mặc định trình duyệt là `16px`, nên `1em = 16px`. Công thức tính: `px / 16 = em`.<br>- **Kỹ thuật phối hợp cổ điển:** Đặt `body { font-size: 100%; }` rồi dùng `em` trên các phần tử con để bảo đảm zoom tương thích tốt.  |
| **Cú pháp Rút gọn (`font` Shorthand)**| - Cho phép gộp nhiều thuộc tính phông trong một khai báo duy nhất.<br>- **Thứ tự bắt buộc:** `font-style` -> `font-variant` -> `font-weight` -> `font-size` / `line-height` -> `font-family`. (Ít nhất phải có `font-size` và `font-family`).<br>```css<br>/* style | weight | size/line-height | family */<br>p { font: italic bold 1.2rem/1.5 "Arial", sans-serif; }<br>```                                                                                   |

> [!TIP]
> **⚡ Kỹ thuật thiết kế Typography hiện đại: Khắc phục điểm yếu của `em` và nhúng Font ngoài**
> 
> 1. **Khắc phục lỗi cộng dồn kích thước: Sử dụng `rem` thay cho `em`:**
>    * *Vấn đề với `em`:* Do `em` tính theo phần tử cha, việc lồng nhiều thẻ con sẽ gây ra hiện tượng cộng dồn (ví dụ: `div (1.2em) > p (1.2em) = 1.44em` so với gốc).
>    * *Giải pháp với `rem` (Root Em):* `rem` luôn tham chiếu theo font-size của phần tử gốc `<html>` (mặc định là 16px). Điều này giúp kích thước font luôn nhất quán ở mọi cấp độ lồng nhau.
>    ```css
>    html { font-size: 16px; }
>    h1 { font-size: 2.5rem; } /* 2.5 * 16px = 40px */
>    p { font-size: 1rem; }    /* 1 * 16px = 16px */
>    ```
> 
> 2. **Nhúng phông chữ bên ngoài (Google Fonts):**
>    Trong thực tế, bạn không bị giới hạn trong các Web Safe Fonts (Arial, Times New Roman). Bạn có thể nhúng các phông hiện đại như *Inter*, *Roboto*, *Open Sans* từ Google Fonts bằng 2 cách:
>    * *Cách 1: Nhúng link vào HTML `<head>` (Khuyên dùng - tối ưu tốc độ tải):*
>      ```html
>      <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
>      ```
>    * *Cách 2: Nhúng trực tiếp vào file CSS bằng `@import`:*
>      ```css
>      @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap');
>      body { font-family: 'Inter', sans-serif; }
>      ```

> [!NOTE]
> **💡 Hint cho Java Developer:**
> * **Hệ thống Font Fallback** hoạt động tương tự như cấu trúc chuỗi **`try-catch`** lồng nhau hoặc hàm **`Optional.of(Arial).orElseGet(() -> Optional.of(Helvetica).orElse(sans-serif))`** trong Java: Trình duyệt sẽ cố lấy phông ưu tiên hàng đầu, nếu không tìm thấy (ném Exception ngầm) sẽ chuyển sang bắt phông thay thế và cuối cùng là trả về generic font mặc định.
> * **`em` (Cộng dồn) vs `rem` (Tham chiếu root):**
>   * `em` tương ứng với **biến cục bộ kế thừa phạm vi lồng nhau** (Dynamic Lexical Scope).
>   * `rem` tương ứng với một hằng số toàn cục **`public static final double ROOT_FONT_SIZE = 16.0;`** — mọi phép tính toán kích thước ở các Class con đều nhân trực tiếp với hằng số này chứ không phụ thuộc vào lớp cha trực tiếp.
> * **Google Fonts `@import`** hoạt động giống như việc khai báo một thư viện ngoài (Dependency) trong file **`pom.xml` (Maven)**: Bạn khai báo tọa độ tải font, hệ thống kéo tài nguyên về và class của bạn (CSS rules) có thể gọi ra sử dụng.

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| CSS Fonts cung cấp bộ công cụ để tùy biến hiển thị chữ bao gồm kiểu cách, độ đậm, kích thước và phông chữ thông qua cơ chế dự phòng Fallback. Để đảm bảo giao diện hiển thị nhất quán và tránh lỗi cộng dồn kích thước của `em`, lập trình viên hiện đại ưu tiên sử dụng đơn vị `rem` kết hợp với việc nhập các phông chữ ngoài (như Google Fonts) để gia tăng tính thẩm mỹ cho giao diện. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[HTML_Basics]]
- [[CSS_Basics]]
- [[CSS_Syntax]]
