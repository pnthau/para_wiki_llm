---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, spring, spring-mvc, architecture, web]
created: 2026-07-28
keywords: [DispatcherServlet, Front Controller, HandlerMapping, ViewResolver, Request Lifecycle]
---

# 🚀 Request Lifecycle & DispatcherServlet trong Spring MVC

| Khái niệm (Cue) | Nội dung chi tiết (Notes) |
| :--- | :--- |
| **DispatcherServlet**<br>*(Front Controller)* | Đóng vai trò "Trạm trung chuyển" (Front Controller). Mọi Request từ người dùng (ví dụ: `GET /users`) đều phải đi qua nó đầu tiên để phân luồng. |
| **HandlerMapping** | Là "Bản đồ chỉ đường" của DispatcherServlet. Nhiệm vụ: Nhìn vào URL của Request để chỉ ra Controller nào (và hàm nào) sẽ chịu trách nhiệm xử lý. |
| **Controller** | Nơi tiếp nhận Request, điều phối gọi Service xử lý Logic, sau đó đóng gói Dữ liệu (`Model`) và ném trả Tên Giao Diện (thường là một chuỗi `String` như "home") về cho Front Controller. |
| **Model** | Đối tượng chuyên dùng để mang vác dữ liệu từ Controller ném sang cho View (thông qua hàm `addAttribute("key", value)`). |
| **ViewResolver** | Dịch vụ phân giải tên. Nhận "Tên giao diện" (ví dụ: "home") từ DispatcherServlet và cộng thêm tiền tố/hậu tố để tìm ra đường dẫn file giao diện vật lý (ví dụ: `/WEB-INF/views/home.jsp`). |
| **Data Binding**<br>*(View ➔ Controller)* | Khi View gửi dữ liệu lên (Form submit):<br>- Dùng `@RequestParam` để hứng từng param lẻ tẻ.<br>- Dùng `@ModelAttribute` để hứng nguyên 1 object (ví dụ `User`). |

<br>

| ⭐ LỘ TRÌNH 1 REQUEST HOÀN CHỈNH |
| :--- |
| **Client** ➔ **DispatcherServlet** ➔ (Hỏi `HandlerMapping`) ➔ **Controller** ➔ **Service** ➔ **DB**.<br>Sau đó lật ngược lại:<br>**Controller** gói Data vào `Model` ➔ Gửi tên file cho **DispatcherServlet** ➔ Nhờ `ViewResolver` tìm file HTML/JSP vật lý ➔ Nhồi Data vào View ➔ Trả Response (HTML) về cho **Client**. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Web_Review_FrontController_Redirect_Forward]]
- [[Java_3_Layer_Architecture]]
- [[Spring_MVC_Fundamentals]]
