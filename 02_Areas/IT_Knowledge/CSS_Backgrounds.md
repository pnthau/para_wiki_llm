---
domain: "IT"
type: "concept"
status: "active"
tags: [it, css, background, layout, web-basics]
created: 2026-06-06
source: "00_Raw/Điều chỉnh màu nền và ảnh nền.md"
nexus_version: 8.2
---

# 🖼️ CSS Backgrounds (Màu nền & Ảnh nền)

| 💡 Từ khóa / Câu hỏi (Cue)          | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| :---------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Màu nền (`background-color`)**    | Thiết lập màu nền cho phần tử qua:<br>- Tên màu tiếng Anh (ví dụ: `red`, `blue`).<br>- Hệ màu HEX (ví dụ: `#ff0000`).<br>- Hệ màu RGB/RGBA (ví dụ: `rgba(255, 0, 0, 0.5)` — tham số thứ 4 quy định độ trong suốt từ `0.0` đến `1.0`).                                                                                                                                                                                                                                                               |
| **Ảnh nền & Lặp lại (`image` / `repeat`)**| - **`background-image`:** Sử dụng đường dẫn ảnh `url('đường_dẫn_ảnh')`. Mặc định ảnh tự lặp theo cả 2 chiều dọc và ngang.<br>- **`background-repeat`:** Tùy chỉnh việc lặp ảnh.<br>  * `repeat` (mặc định): Lặp cả 2 chiều.<br>  * `repeat-x`: Chỉ lặp chiều ngang.<br>  * `repeat-y`: Chỉ lặp chiều dọc.<br>  * `no-repeat`: Không lặp lại (ảnh xuất hiện đúng 1 lần).                                                                                                                           |
| **Định vị & Cuộn (`position` / `attachment`)**| - **`background-position`:** Vị trí đặt ảnh nền. Định dạng bằng từ khóa (`top`, `bottom`, `left`, `right`, `center` - ví dụ: `right top` đặt góc trên bên phải) hoặc tọa độ (`px`, `%`).<br>- **`background-attachment`:** Trải nghiệm cuộn trang.<br>  * `scroll` (mặc định): Ảnh nền di chuyển cuộn đi cùng trang.<br>  * `fixed`: Ảnh nền cố định tại Viewport (khung nhìn trình duyệt), không di chuyển khi cuộn trang (hiệu ứng Parallax).                                                   |
| **Cú pháp rút gọn (`background`)**  | - Viết gọn các thuộc tính nền trên 1 dòng duy nhất.<br>- **Thứ tự chuẩn:** `color` -> `image` -> `repeat` -> `attachment` -> `position`. Có thể lược bỏ một số giá trị nhưng phải tuân thủ đúng thứ tự này.<br>```css<br>body {<br>  background: #ffffff url('bg.png') no-repeat fixed right top;<br>}<br>```                                                                                                                                                                                   |

> [!TIP]
> **⚡ Kỹ thuật thiết kế hình nền hiện đại: Co giãn ảnh, Opacity vs RGBA, và CSS Gradients**
> 
> 1. **Co giãn ảnh tương thích mọi màn hình (`background-size` - Cực kỳ quan trọng):**
>    Mặc định ảnh nền giữ nguyên kích thước gốc. Để ảnh nền lấp đầy màn hình responsive, dùng `background-size`:
>    * `background-size: cover;` (Khuyên dùng): Co giãn ảnh tối đa để lấp đầy khung hiển thị (có thể cắt bớt phần thừa nhưng không bị biến dạng).
>    * `background-size: contain;` Co giãn ảnh sao cho hiển thị đầy đủ toàn bộ tấm ảnh (có thể để lại khoảng trắng nếu tỉ lệ khung khác nhau).
>    * `background-size: 100% 100%;` Ép ảnh co giãn khít theo tỉ lệ khung (ảnh dễ bị méo).
> 
> 2. **Độ mờ nền: `opacity` vs `rgba()` (Tránh lỗi làm mờ chữ con):**
>    * *Tránh dùng `opacity`:* Nếu dùng `opacity: 0.5;` trên class `.card`, **cả màu nền và toàn bộ text con bên trong** đều sẽ bị mờ đi 50%.
>    * *Nên dùng `rgba()`:* Thiết lập màu nền trong suốt bằng `background-color: rgba(255, 255, 255, 0.5);`. Lúc này, chỉ có màu nền bị mờ đi, còn chữ con bên trong vẫn hiển thị rõ ràng, sắc nét.
> 
> 3. **Tận dụng CSS Gradients (Dải màu chuyển sắc):**
>    Thay vì tải các file ảnh nặng nề làm chậm trang web, hãy dùng CSS Gradients làm ảnh nền:
>    ```css
>    /* Dải màu chuyển tuyến tính từ trái qua phải */
>    .gradient-bg {
>      background-image: linear-gradient(to right, #ff7e5f, #feb47b);
>    }
>    ```

> [!NOTE]
> **💡 Hint cho Java Developer:**
> * **`background-repeat`** tương ứng với việc bạn sử dụng lớp **`TexturePaint`** trong Java2D để vẽ lặp đi lặp lại một ảnh kết cấu (Pattern) lên Panel.
> * **`background-attachment: fixed`** hoạt động tương tự như việc bạn vẽ ảnh nền trực tiếp trên tọa độ tuyệt đối của cửa sổ ứng dụng (Viewport space) thay vì tính toán tọa độ tương đối theo thanh cuộn của `JScrollPane` (Scroll space).
> * **`rgba()` vs `opacity`:**
>   * `rgba()` tương tự như việc bạn gán màu vẽ có tham số alpha: **`new Color(r, g, b, alpha)`** — chỉ ảnh hưởng tới màu vẽ của cọ đó.
>   * `opacity` tương tự như việc bạn can thiệp vào bộ xử lý đồ họa toàn cục: **`g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, alpha))`** — tất cả nét vẽ sau đó (kể cả Text chữ viết) đều sẽ bị ép đè độ mờ alpha đó lên.
> * **`background-size: cover`** tương đương với các thuật toán vẽ ảnh co giãn bảo toàn tỉ lệ khít khung (Aspect Fill) thường thấy khi lập trình giao diện App di động hoặc Desktop.

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| CSS Backgrounds cung cấp các công cụ cấu hình hiệu ứng nền đa dạng. Để thiết kế giao diện hiện đại, lập trình viên cần sử dụng `background-size: cover` để ảnh nền hiển thị hoàn hảo trên mọi kích thước màn hình di động, dùng hệ màu `rgba` để tạo hiệu ứng mờ nền mà không làm giảm độ rõ nét của văn bản con, và áp dụng dải màu CSS Gradients thay cho ảnh tĩnh nhằm tăng hiệu năng tải trang. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[HTML_Basics]]
- [[CSS_Basics]]
- [[CSS_Syntax]]
