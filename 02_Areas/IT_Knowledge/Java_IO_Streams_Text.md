---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, io, serialization]
created: 2026-05-13
keywords: []
---

# Java Binary IO & Serialization

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Serialization là gì?** | Quá trình chuyển đổi đối tượng Java thành luồng byte (nhị phân) để lưu trữ hoặc truyền qua mạng. |
| **Deserialization là gì?** | Quá trình khôi phục đối tượng Java từ luồng byte đã được serialize. |
| **Transient dùng làm gì?** | Đánh dấu các biến **không được serialize**. Khi khôi phục, các biến này sẽ có giá trị mặc định. Thường dùng cho mật khẩu hoặc dữ liệu tạm thời. |
| **Lưu ý triển khai** | - Class phải `implements Serializable`.<br>- Nên khai báo `serialVersionUID`.<br>- Không serialize tài nguyên hệ thống (Thread, Socket). |
| **Các lớp IO chính** | - Ghi: `FileOutputStream` kết hợp `ObjectOutputStream`.<br>- Đọc: `FileInputStream` kết hợp `ObjectInputStream`. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Serialization là cơ chế quan trọng để duy trì trạng thái đối tượng. Cần lưu ý bảo mật (dùng `transient`) và tính tương thích phiên bản (`serialVersionUID`) khi triển khai. |
