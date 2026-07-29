---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, spring, architecture, ioc]
created: 2026-07-28
keywords: [Spring Container, ApplicationContext, Bean, IoC, DI]
---

# 📦 Spring Container & Bean Lifecycle

| Khái niệm (Cue) | Nội dung chi tiết (Notes) |
| :--- | :--- |
| **Spring Container** | Khung sườn quản lý vòng đời của các đối tượng (Bean). Đại diện tiêu biểu là `ApplicationContext`. |
| **4 Nhiệm vụ chính** | 1. **Khởi tạo:** Sinh ra đối tượng.<br>2. **Chứa đựng:** Lưu trữ đối tượng vào bộ nhớ của Container.<br>3. **Tiêm phụ thuộc (DI):** Tự động liên kết (Inject) các đối tượng có phụ thuộc vào nhau.<br>4. **Quản lý vòng đời:** Dọn dẹp đối tượng khi không còn dùng. |
| **Bean** | Là những đối tượng được sinh ra và quản lý hoàn toàn bởi Spring Container. *(Lưu ý: Nếu bạn tự dùng từ khóa `new` để tạo Object, nó sẽ **không** phải là Bean).* |
| **Cách định nghĩa Bean** | **1. Annotation trên Class:** Gắn `@Component`, `@Service`, `@Repository`, `@Controller`. (Thường dùng cho code mình tự viết).<br>**2. Annotation trên Method:** Gắn `@Bean` bên trong class có `@Configuration`. (Thường dùng khi muốn khởi tạo thư viện/object của bên thứ 3). |

<br>

| ⭐ SUMMARY |
| :--- |
| Trái tim của Spring chính là **Container** (`ApplicationContext`). Nó áp dụng **IoC** để tước đoạt quyền tự khởi tạo (`new`) của lập trình viên, biến các object thành **Bean** và dùng **DI** để lắp ráp chúng lại với nhau một cách lỏng lẻo (loose-coupling). |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_DI_IoC_Principles]]
- [[Spring_MVC_Fundamentals]]
