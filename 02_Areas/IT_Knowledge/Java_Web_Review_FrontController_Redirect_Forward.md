---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [java, servlet, design-pattern, code-review, interview-prep]
created: 2026-06-20
updated: 2026-06-20
---

# Java Web: Front Controller, Switch vs Yoda Condition, & Điều hướng (Forward vs Redirect)

Bản ghi nhớ từ buổi Code Review để chuẩn bị cho quá trình làm việc và phỏng vấn tại Nhật Bản.

## 1. Front Controller Pattern (Mô hình Cô Lễ Tân)
- **Định nghĩa:** Thay vì mỗi chức năng tạo 1 Servlet (quá nhiều file rác), sử dụng 1 Servlet duy nhất làm "Cô Lễ Tân" để nhận toàn bộ request của 1 module (vd: `/admin/orders`).
- **Cách hoạt động:** Nhận tham số (vd: `?action=...`) -> Đọc tham số -> Dùng `switch-case` để phân luồng (Routing) đến đúng Service hoặc method cần xử lý.
- **Ưu điểm:** Quản lý tập trung, dễ kiểm soát phân quyền (Auth), là nền tảng cốt lõi của `DispatcherServlet` trong Spring Boot.
- **Lưu ý kiến trúc:** Controller KHÔNG ĐƯỢC gọi trực tiếp Repository. Phải gọi thông qua Service.

## 2. GET vs POST trong thao tác dữ liệu
- Tuyệt đối **KHÔNG** dùng HTTP GET để thực hiện các thao tác thay đổi dữ liệu (Update, Delete, Create). 
- **Lý do:** Dễ bị dính lỗi bảo mật CSRF, rủi ro tự động click (do Google Bot, trình duyệt pre-fetch). Cần thay đổi dữ liệu phải dùng POST.

## 3. Switch-case vs Yoda Condition trong xử lý chuỗi
- Java 7+ hoàn toàn dùng được `switch-case` cho String.
- Lỗi chết người của `switch(String)`: Nếu String đó bị `null`, hệ thống văng `NullPointerException` (HTTP 500). Cần check `if (str == null)` trước khi ném vào `switch`.
- **Yoda Condition:** `if ("chuỗi_cứng".equals(action))`. Đây là cách viết an toàn với `null` (Null-safe), vì nếu `action` bị null thì hàm `.equals()` chỉ đơn giản trả về `false`. Mặc dù vậy, nên ưu tiên dùng `switch-case` cho sạch sẽ và đồng bộ sau khi đã chặn rủi ro null.

## 4. Chuyển tiếp nội bộ (Forward) vs Chuyển hướng (SendRedirect)

| Tiêu chí | `request.getRequestDispatcher().forward()` | `response.sendRedirect()` |
| :--- | :--- | :--- |
| **Bản chất** | Chuyển tiếp ngầm bên trong Server. | Server ép Trình duyệt tự tải trang mới. |
| **Số lượng Request** | 1 (Duy trì request hiện tại). | 2 (Tạo ra request hoàn toàn mới). |
| **URL trình duyệt** | KHÔNG thay đổi. | BỊ THAY ĐỔI sang URL mới. |
| **Dữ liệu (Data)** | Giữ được dữ liệu (Lấy ra bằng `request.getAttribute()`). | **Mất sạch dữ liệu.** (Phải lưu tạm bằng Session nếu cần). |
| **Khi nào dùng?** | Lấy dữ liệu xong đẩy sang giao diện (JSP/HTML) hiển thị, hoặc báo lỗi validation trên form. | Dùng SAU KHI submit Form (POST) để lưu/xóa/sửa dữ liệu nhằm ngăn người dùng bấm F5 gây trùng lặp data (PRG Pattern). |
