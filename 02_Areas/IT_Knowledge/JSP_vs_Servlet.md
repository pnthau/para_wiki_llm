---
domain: IT_Knowledge
type: concept
status: active
tags: [java, servlet, jsp, mvc, web-basics]
created: 2026-06-15
nexus_version: 8.2
---

# ☕ JSP vs Servlet — Sự Khác Biệt Và Phối Hợp Trong Mô Hình MVC

| 💡 Từ khóa / Câu hỏi (Cue)       | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                                                                                                                                                                                                                                         |
| :------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Bản chất Cốt lõi**             | - **Servlet** là một lớp Java (`.java`) kế thừa từ `HttpServlet`. Nó cho phép code Java tạo ra nội dung HTML động bằng cách in ra luồng xuất (`PrintWriter.println()`).<br>- **JSP (JavaServer Pages)** là một tệp giao diện (`.jsp`) chứa mã HTML làm chủ đạo, xen kẽ các thẻ đặc biệt của Java (`<% %>`, `${ }`) để nhúng dữ liệu động. |
| **Mối quan hệ Dưới nắp máy**      | - **JSP thực chất là Servlet**!<br>- Khi chạy lần đầu tiên, Web Container (như Tomcat) sẽ tự động dịch file `.jsp` thành một file mã nguồn Java `.java` (là một Servlet thực sự) và biên dịch nó thành file `.class` để thực thi.<br>- Do đó, hiệu năng thực thi của cả hai sau lần biên dịch đầu tiên là tương đương nhau. |
| **Vai trò trong Mô hình MVC**    | - **Servlet = Controller**: Đóng vai trò tiếp nhận HTTP Request từ Client, lọc và kiểm tra tham số, giao tiếp với CSDL (qua DAO) để lấy dữ liệu, sau đó điều hướng (forward) request sang JSP.<br>- **JSP = View**: Chỉ tập trung nhận dữ liệu (thông qua request/session attributes) và kết xuất (render) thành giao diện HTML trả về trình duyệt. |
| **Cách viết & Cú pháp**          | - **Servlet**: Viết code logic điều hướng bằng Java thuần. Rất khó chịu khi viết HTML: <br>```java<br>out.println("<html><body><h1>Hello</h1></body></html>");<br>```<br>- **JSP**: Viết HTML tự nhiên. Đọc dữ liệu từ Controller chuyển sang bằng Expression Language (EL) hoặc thẻ JSTL:<br>```html<br><h1>Chào mừng, ${user.name}!</h1><br>``` |
| **Quy tắc thiết kế tốt nhất**     | - **Tuyệt đối tránh** viết scriptlet `<% ... %>` (nhúng code Java thô trực tiếp) trong JSP vì sẽ phá vỡ nguyên lý *Separation of Concerns* (Phân tách mối quan tâm), khiến file JSP trở nên rối loạn và khó bảo trì.<br>- Hãy luôn dùng Servlet để làm Controller xử lý logic, và JSP để hiển thị dùng EL (`${}`) / JSTL (`<c:forEach>`). |

> [!TIP]
> **💡 Hint cho Java Developer:** Hãy tưởng tượng **Servlet** giống như một **Service/Controller Class** thô cứng chuyên giải quyết luồng nghiệp vụ và xử lý dữ liệu phức tạp. Còn **JSP** giống như **CSS/HTML template** để trình diễn sản phẩm. 
> Việc viết HTML trực tiếp trong Servlet bằng `out.println()` hay viết code JDBC/Logic kết nối database thô trong JSP bằng `<% %>` đều giống như việc hardcode dữ liệu hoặc vi phạm nghiêm trọng tính bao đóng (Encapsulation) trong OOP.

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| **Servlet** là mã Java chứa HTML (dùng để xử lý request và điều hướng logic - **Controller**). **JSP** là mã HTML chứa mã Java (dùng để hiển thị giao diện - **View**). JSP bản chất sẽ được Container dịch thành Servlet. Trong mô hình MVC, Servlet xử lý nghiệp vụ trước, sau đó lưu dữ liệu vào `request.setAttribute()` và `forward` sang JSP để hiển thị giao diện sạch đẹp. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Learning_Log]]
- [[Servlet_JSP_Project_Structure]]
