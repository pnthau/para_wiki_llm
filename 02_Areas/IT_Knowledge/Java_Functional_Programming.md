---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, functional-programming, lambda, stream]
created: 2026-05-16
keywords: []
---

# ☕ Java Functional Programming (Lambda & Stream)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Lambda Expression** | Cú pháp rút gọn để triển khai Functional Interface. Dạng: `(parameters) -> expression`. Giúp code ngắn gọn, dễ đọc. |
| **Functional Interface** | Interface chỉ có **duy nhất một** abstract method (ví dụ: `Runnable`, `Comparator`). Đánh dấu bằng `@FunctionalInterface`. |
| **Stream API là gì?** | Một pipeline xử lý các tập hợp dữ liệu theo phong cách declarative (khai báo). Không thay đổi dữ liệu gốc. |
| **Các thao tác Stream** | 1. **Intermediate** (trả về Stream): `filter()`, `map()`, `sorted()`.<br>2. **Terminal** (kết thúc Stream): `collect()`, `forEach()`, `count()`. |
| **Method Reference** | Cách viết cực ngắn cho Lambda khi chỉ gọi một phương thức có sẵn. Dạng: `ClassName::methodName` (ví dụ: `System.out::println`). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Chuyển từ tư duy Imperative (Làm như thế nào - for loop) sang Functional (Làm cái gì - stream) giúp giảm thiểu lỗi và tối ưu hóa việc xử lý dữ liệu lớn. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Collections_Framework]]
- [[Java_Learning_Log]]
