---
domain: "IT"
type: "concept"
status: "active"
tags: [it, css, color, layout, web-basics]
created: 2026-06-06
source: "00_Raw/Sử dụng màu sắc trong trang web.md"
nexus_version: 8.2
---

# 🎨 CSS Colors (Sử dụng màu sắc trong CSS)

| 💡 Từ khóa / Câu hỏi (Cue)          | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| :---------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Tên màu (Color Names)**           | - Gọi màu trực tiếp bằng tên tiếng Anh (ví dụ: `red`, `green`, `blue`, `orange`, `yellow`, `cyan`, `black`).<br>- Trình duyệt hỗ trợ **140 tên màu tiêu chuẩn**.<br>⚠️ Hạn chế: Khó tùy biến sắc thái hoặc độ sáng tối của màu.                                                                                                                                                                                                                                                                  |
| **Hệ màu RGB & RGBA**               | - **`rgb(R, G, B)`:** Trộn 3 màu cơ bản: Đỏ (Red), Lục (Green), Lam (Blue). Giá trị chạy từ `0` đến `255`. (Ví dụ: Đỏ thuần là `rgb(255, 0, 0)`).<br>- **`rgba(R, G, B, A)`:** Thêm kênh Alpha (độ mờ) từ `0.0` (trong suốt hoàn toàn) đến `1.0` (đục hoàn toàn). (Ví dụ: `rgba(255, 0, 0, 0.5)`).                                                                                                                                                                                                  |
| **Mã HEX (Thập lục phân)**          | - Biểu diễn RGB dưới dạng 6 ký tự cơ số 16 (`#RRGGBB`). Ký tự chạy từ `00` đến `FF` (tương đương 0 - 255).<br>- Ví dụ: Đỏ thuần là `#FF0000`, đen là `#000000`, trắng là `#FFFFFF`.<br>- **Mã HEX viết tắt:** Nếu các cặp ký tự lặp lại (như `#FFAA00`), có thể viết rút gọn thành 3 ký tự (`#FA0`).                                                                                                                                                                                                 |
| **Hệ màu HSL & HSLA (Hiện đại)**    | Cấu trúc trực quan dựa trên cách con người cảm nhận màu sắc:<br>- **`hsl(H, S, L)`**:<br>  * **Hue (Tông màu):** Góc trên vòng tròn màu (0 - 360). 0 = Đỏ, 120 = Xanh lá, 240 = Xanh lam.<br>  * **Saturation (Độ bão hòa):** Tỷ lệ phần trăm (0% = xám xịt, 100% = màu sắc rực rỡ nhất).<br>  * **Lightness (Độ sáng):** Tỷ lệ phần trăm (0% = đen tuyền, 50% = màu chuẩn, 100% = trắng tinh).<br>- **`hsla(H, S, L, A)`**: Hỗ trợ thêm kênh alpha. |

> [!TIP]
> **⚡ Kỹ thuật quản lý và phối màu hiện đại: Phối màu thông minh với HSL & CSS Variables**
> 
> 1. **Phối màu thông minh bằng HSL:**
>    Khi thiết kế giao diện, ta thường cần tạo màu tương phản nhẹ (ví dụ: nút bấm màu gốc, nút bấm khi di chuột qua sẽ tối hơn một chút). Với HEX hay RGB, bạn phải tra mã màu mới. Nhưng với HSL, bạn chỉ việc thay đổi thông số **Lightness (L)**:
>    ```css
>    .button { background-color: hsl(200, 100%, 50%); }      /* Màu xanh lam chuẩn */
>    .button:hover { background-color: hsl(200, 100%, 40%); }/* Tối hơn 10% khi hover */
>    .button:active { background-color: hsl(200, 100%, 30%); }/* Tối hơn 20% khi click */
>    ```
> 
> 2. **Theme Management bằng CSS Variables (Biến CSS):**
>    Trong các dự án lớn, không nên viết cứng mã màu ở mọi nơi. Hãy gom màu sắc vào biến trung tâm tại phần tử `:root` (đại diện cho toàn bộ trang web). Điều này giúp đổi giao diện (Light/Dark mode) trong 1 giây:
>    ```css
>    :root {
>      --primary-color: #3498db;
>      --text-color: #2c3e50;
>      --bg-color: #ffffff;
>    }
>    
>    /* Sử dụng biến màu */
>    body {
>      background-color: var(--bg-color);
>      color: var(--text-color);
>    }
>    h1 {
>      color: var(--primary-color);
>    }
>    ```

> [!NOTE]
> **💡 Hint cho Java Developer:**
> * **Tên màu** tương đương với các hằng số màu được định nghĩa sẵn trong Java AWT: **`Color.RED`**, **`Color.GREEN`**, **`Color.BLUE`**.
> * **Hệ màu RGB/RGBA** giống hệt cách khởi tạo đối tượng màu trong Java: **`new Color(r, g, b)`** hoặc **`new Color(r, g, b, alpha)`** (Lưu ý: kênh alpha của Java chạy từ `0 - 255` thay vì `0.0 - 1.0` như CSS).
> * **Mã màu HEX** được giải mã trong Java bằng phương thức: **`Color.decode("#FF0000")`**.
> * **Hệ màu HSL** tương đương với việc chuyển đổi không gian màu RGB sang HSB/HSV (Hue, Saturation, Brightness) trong Java qua phương thức tĩnh: **`Color.RGBtoHSB(r, g, b, hsbArray)`**.
> * **CSS Variables (`--primary-color`)** tương ứng với việc khai báo biến hằng số tĩnh trong Java để quản lý màu tập trung:
>   `public static final Color PRIMARY_COLOR = new Color(52, 152, 219);`
>   Khi cần thay đổi giao diện, bạn chỉ việc đổi giá trị của hằng số này tại một nơi, toàn bộ UI sử dụng hằng số sẽ tự động cập nhật theo.

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| CSS hỗ trợ nhiều hệ biểu diễn màu sắc bao gồm tên màu, mã HEX và RGB. Đối với thiết kế chuyên nghiệp, hệ màu HSL được ưu tiên sử dụng để dễ dàng tinh chỉnh độ sáng tối của màu sắc. Trong khi đó, việc tổ chức màu sắc thông qua biến CSS (CSS Variables) là giải pháp thiết yếu để quản lý chủ đề (theme) nhất quán và linh hoạt cho toàn bộ hệ thống web. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[HTML_Basics]]
- [[CSS_Basics]]
- [[CSS_Syntax]]
