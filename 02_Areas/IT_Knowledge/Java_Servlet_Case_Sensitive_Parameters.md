---
domain: IT_Knowledge
type: concept
status: active
tags: [java, servlet, request-parameter, case-sensitive]
created: 2026-07-05
nexus_version: 8.4
---

# 🔠 Tính Phân Biệt Chữ Hoa/Thường Của Tham Số Servlet

| 💡 Từ khóa / Cue | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Phân biệt chữ hoa/thường (Case-Sensitive)** | - Phương thức `request.getParameter(name)` trong Servlet API phân biệt chính xác chữ hoa và chữ thường đối với tên tham số được gửi từ Client.<br>- Nếu form HTML/JSP gửi đi một thẻ input có `name="imageUrl"` (chữ `rl` thường) nhưng Controller gọi `request.getParameter("imageURL")` (chữ `URL` hoa), Servlet sẽ trả về `null` vì không tìm thấy khóa khớp 100%. |
| **Đồng bộ hóa thuộc tính Entity và Form Input** | - Trong Java, các thuộc tính Entity thường được viết theo quy chuẩn CamelCase (ví dụ: `imageURL`). Khi hiển thị hoặc lấy dữ liệu qua EL trong JSP, ta gọi `${product.imageURL}`.<br>- Để tránh nhầm lẫn khi truyền dữ liệu qua lại, thuộc tính `name` của thẻ `<input>` trên form JSP nên được đặt trùng khớp 100% với tên thuộc tính của Entity (ví dụ: `name="imageURL"`), và Controller cũng sẽ gọi đúng tên này (`request.getParameter("imageURL")`). |
| **Lưu ý với Multipart Request** | - Khi form có cấu hình `enctype="multipart/form-data"` để gửi file, Servlet bắt buộc phải được đánh dấu bằng annotation `@MultipartConfig` thì phương thức `request.getParameter()` mới hoạt động bình thường đối với các trường văn bản. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Tên tham số HTTP được truyền từ JSP lên Servlet phân biệt chữ hoa thường. Để tránh lỗi nhận giá trị `null` âm thầm trong Controller, cần đảm bảo tính đồng bộ tuyệt đối về mặt ký tự giữa thuộc tính `name` trên form JSP và chuỗi khóa được gọi trong phương thức `request.getParameter()`. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Cloudinary_Java_InputStream_Upload_Error]]
- [[IntelliJ_Tomcat_Artifact_Resolution]]
