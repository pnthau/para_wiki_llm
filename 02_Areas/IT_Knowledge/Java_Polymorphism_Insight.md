---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, oop, polymorphism, dynamic-binding]
created: 2026-05-15
---

# Java Insight: Dynamic Binding

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Dynamic Binding là gì?** | (Liên kết động) Cơ chế Java xác định phương thức cần gọi tại thời điểm chạy (**Runtime**) dựa trên thực thể (Instance) thực tế. |
| **Cơ chế hoạt động** | Trình biên dịch chỉ kiểm tra kiểu dữ liệu của biến (Reference Type), nhưng JVM sẽ thực thi mã của đối tượng thực sự (Object Type) mà biến đang trỏ tới. |
| **Ví dụ Fizz vs Pantheon** | `champion.basicAttack()` sẽ gọi `Fizz.basicAttack()` nếu biến `champion` đang giữ instance của `Fizz`. |
| **IntelliJ Tip** | - `Ctrl + B`: Nhảy tới định nghĩa.<br>- `Ctrl + Alt + B`: Xem tất cả các class triển khai (Implementations). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Dynamic Binding là "phép thuật" đằng sau tính đa hình, cho phép mã nguồn xử lý các đối tượng một cách tổng quát nhưng vẫn giữ được hành vi đặc thù của từng đối tượng cụ thể tại Runtime. |
