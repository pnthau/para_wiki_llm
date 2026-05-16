---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, architecture, web, 3-layer]
created: 2026-05-16
keywords: []
---

# 🏛️ 3-Layer Architecture (Kiến trúc 3 lớp)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **3-Layer là gì?** | Mô hình chia ứng dụng thành 3 tầng riêng biệt để quản lý code dễ dàng và tăng tính bảo trì. |
| **1. Presentation Layer** | (Controller) Tiếp nhận request từ user, validate sơ bộ và trả về response. |
| **2. Business Logic Layer** | (Service) Nơi xử lý các nghiệp vụ chính của ứng dụng. Cầu nối giữa Controller và Data Access. |
| **3. Data Access Layer** | (Repository/DAO) Tương tác trực tiếp với cơ sở dữ liệu (Database). |
| **Luồng dữ liệu** | User -> **Controller** -> **Service** -> **Repository** -> DB. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Việc chia lớp giúp tuân thủ nguyên tắc Single Responsibility. Nếu cần thay đổi Database, bạn chỉ cần sửa lớp Repository mà không ảnh hưởng đến Logic hay Giao diện. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_DI_IoC_Principles]]
- [[Java_Design_Principles]]
