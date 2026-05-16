---
domain: "IT"
type: "concept"
status: "active"
tags: [it, java, oop]
created: 2026-05-13
---

# ☕ Java Inheritance (Kế thừa)

| 💡 Từ khóa / Câu hỏi (Cue)          | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                       |
| :---------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Kế thừa là gì? Mục đích?**        | **Định nghĩa:** Cơ chế subclass thừa hưởng thuộc tính/phương thức từ superclass.<br>**Mục đích:**<br>1. Tái sử dụng code.<br>2. Mở rộng chức năng.<br>3. Cho phép ghi đè (Override).              |
| **Đặc điểm kế thừa trong Java?**    | **Các dạng hỗ trợ:**<br>- *Single:* 1 cha - 1 con.<br>- *Multilevel:* Ông -> Cha -> Con.<br>- *Hierarchical:* 1 cha - nhiều con.<br>❌ **Lưu ý:** Không hỗ trợ đa kế thừa qua class.               |
| **Vì sao không hỗ trợ đa kế thừa?** | **Diamond Problem:** Xung đột khi nhiều cha có cùng phương thức.<br>**Giải pháp:** Sử dụng **Interface** để thay thế đa kế thừa.                                                                  |
| **Từ khóa `super` & `final`?**      | **`super`:** Gọi constructor/method/attribute của lớp cha.<br>**`final`:**<br>- *Class:* Chặn kế thừa.<br>- *Method:* Chặn Override.<br>- *Variable:* Hằng số.                                    |
| **Class Object là gì?**             | Lớp tổ tiên của mọi class trong Java.<br>**Method chính:**<br>- `toString()`: Mô tả đối tượng.<br>- `equals()`: So sánh đối tượng.<br>- `hashCode()`: Mã băm.<br>- `getClass()`: Thông tin class. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Kế thừa (`extends`) là cột trụ của OOP giúp xây dựng hệ thống phân cấp class. Cần nắm vững `super` để kết nối với cha và `final` để bảo mật cấu trúc class. |
