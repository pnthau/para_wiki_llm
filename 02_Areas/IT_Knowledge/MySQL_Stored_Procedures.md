---
domain: "IT_Knowledge"
type: "atomic-note"
status: "active"
tags: [sql, mysql, stored-procedure, programming, automation]
created: 2026-05-30
source: "00_Raw/Tạo MySQL stored procedures.md"
nexus_version: 6.0
---

# 🧠 MYSQL STORED PROCEDURES: LOGIC ENCAPSULATION

> "Stored Procedure biến Database từ một kho chứa dữ liệu tĩnh thành một cỗ máy xử lý logic mạnh mẽ."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- Khai báo: `CREATE PROCEDURE name() BEGIN ... END`.
- Sử dụng: `CALL name()`.
- Biến: `IN` (tham số đầu vào), `OUT` (tham số đầu ra).
- Cú pháp đặc biệt: `DELIMITER` dùng để đổi ký tự kết thúc câu lệnh, tránh nhầm lẫn dấu `;` trong thân thủ tục.

### 2. Patterns (Mô thức)
- **Reusable Logic Pattern**: Đóng gói các truy vấn lặp đi lặp lại thành một "hàm" duy nhất.
- **Centralized Logic Pattern**: Đưa logic nghiệp vụ (Business Logic) từ App Java xuống thẳng Database để tối ưu hiệu suất xử lý dữ liệu lớn.
- **Abstraction Pattern**: Người dùng chỉ cần biết tên Procedure và tham số, không cần hiểu độ phức tạp của các câu lệnh JOIN/SUBQUERY bên trong.

### 3. Structures (Cấu trúc hệ thống)
- **Subroutine Structure**: Là một chương trình con (Sub-program) được biên dịch và lưu trữ trực tiếp trong CSDL (Database Catalog).
- **Execution Flow**: App -> Call Procedure -> DB Engine executes pre-compiled SQL -> Results back to App.
- **Security Layer**: Cấp quyền thực thi (EXECUTE) trên Procedure thay vì cấp quyền SELECT/UPDATE trên từng bảng.

### 4. Mental Models (Tư duy cốt lõi)
- **"Encapsulation" (Tính đóng gói)**: Giống như phương thức trong Java, Procedure che giấu sự phức tạp đằng sau một cái tên đơn giản.
- **"Proximity to Data"**: Tính toán tại nơi chứa dữ liệu luôn nhanh hơn việc kéo dữ liệu về App rồi mới tính.

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý Đóng gói (Encapsulation Principle)**: Nhóm các thao tác liên quan thành một đơn vị logic duy nhất để dễ quản lý và bảo mật.
- **Nguyên lý Giảm thiểu Network Traffic**: Chỉ gửi một lệnh `CALL` ngắn gọn qua mạng thay vì gửi hàng chục dòng SQL phức tạp.

---

## 🔗 NEURAL MAPPING
- **Horizontal (Siblings)**: [[SQL_Views]], [[MySQL_Index_Deep_Dive]].
- **Vertical (Foundations)**: [[Relational_Database_Fundamentals]].
- **Cross-Domain (Nexus)**: 
    - **Java**: Tương đương với các **Methods** (Phương thức) hoặc **Services** xử lý logic.
    - **Japanese**: Stored Procedure (ストアドプロシージャ - Sutoado puroshīja).

---

## 📝 CORNELL SUMMARY
| Key Points   | Detailed Notes                                                                         |
| ------------ | -------------------------------------------------------------------------------------- |
| **Khai báo** | `DELIMITER //`<br>`CREATE PROCEDURE name(IN p1 INT) BEGIN ... END //`<br>`DELIMITER ;` |
| **Thực thi** | `CALL name(123);`                                                                      |
| **Tham số**  | `IN`: Nhận dữ liệu vào.<br>`OUT`: Trả dữ liệu ra biến.<br>`INOUT`: Vừa nhận vừa trả.   |
| **Lợi ích**  | Tăng hiệu suất, bảo mật cao, tái sử dụng code, giảm băng thông mạng.                   |

---
**Summary**: Stored Procedure là các chương trình con được lưu trữ trong Database, giúp đóng gói logic xử lý SQL phức tạp, tăng hiệu suất và bảo mật cho hệ thống.

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
