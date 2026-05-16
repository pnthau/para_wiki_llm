---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, architecture, spring, dependency-injection]
created: 2026-05-16
---

# ☕ Dependency Injection (DI) & IoC Principles

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **IoC (Inversion of Control)** | Đảo ngược quyền điều khiển. Thay vì class tự tạo phụ thuộc, framework (Spring) sẽ quản lý và cung cấp chúng. |
| **DI (Dependency Injection)** | Một dạng của IoC, nơi các "phụ thuộc" (dependencies) được "tiêm" (inject) vào class thông qua Constructor, Setter hoặc Field. |
| **Lợi ích của DI** | - **Loose Coupling**: Giảm sự phụ thuộc cứng nhắc giữa các class.<br>- **Testability**: Dễ dàng thay thế Object thật bằng Mock Object khi unit test. |
| **3 Cách Inject trong Spring** | 1. **Constructor Injection** (Khuyên dùng - an toàn, immutable).<br>2. **Setter Injection** (Dùng cho phụ thuộc tùy chọn).<br>3. **Field Injection** (`@Autowired` - nhanh nhưng khó test). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| "Lập trình với Interface, không phải với Implementation" là tôn chỉ của DI. Hiểu rõ DI/IoC là chìa khóa để làm chủ Spring Framework và xây dựng hệ thống linh hoạt. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Abstract_Interface]]
- [[Java_Design_Principles]]
