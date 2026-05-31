---
domain: "IT_Knowledge"
type: "atomic-note"
status: "active"
tags: [sql, mysql, function, udf, programming, calculation]
created: 2026-05-30
source: "Knowledge Synthesis"
nexus_version: 6.0
---

# 🧠 MYSQL FUNCTIONS: THE CALCULATOR ENGINE

> "Nếu Procedure là một 'Công việc' (Task), thì Function là một 'Công thức' (Formula)."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- Khai báo: `CREATE FUNCTION name() RETURNS datatype ...`.
- Sử dụng: Dùng trực tiếp trong câu lệnh `SELECT`, `WHERE` (ví dụ: `SELECT my_func(price) FROM ...`).
- Từ khóa bắt buộc: `DETERMINISTIC`, `NOT DETERMINISTIC`, `READS SQL DATA`.

### 2. Patterns (Mô thức)
- **Calculation Pattern**: Dùng để tính toán các công thức phức tạp (ví dụ: Tính tổng tiền sau thuế, tính số ngày chênh lệch).
- **Data Transformation Pattern**: Chuyển đổi dữ liệu (ví dụ: Chuyển tiếng Việt có dấu thành không dấu, định dạng lại chuỗi).
- **Embedded Logic Pattern**: Khác với Procedure phải gọi bằng `CALL`, Function có thể nằm "nhúng" ngay trong các câu lệnh SQL khác.

### 3. Structures (Cấu trúc hệ thống)
- **Mandatory Return**: Bắt buộc phải có một và chỉ một giá trị trả về (`RETURN value`).
- **Deterministic Nature**: MySQL yêu cầu bạn khai báo liệu Function có luôn trả về cùng một kết quả với cùng một đầu vào hay không (`DETERMINISTIC`). Điều này cực kỳ quan trọng cho việc tối ưu hóa bộ nhớ đệm.
- **Side-effect Free**: Function trong MySQL không được phép thay đổi trạng thái của Database (không được dùng `INSERT/UPDATE/DELETE` bên trong Function).

### 4. Mental Models (Tư duy cốt lõi)
- **"The Pure Formula"**: Coi Function là một hàm toán học thuần túy: $y = f(x)$. Nó chỉ nhận vào và nhả ra kết quả, không làm thay đổi thế giới xung quanh.
- **"Seamless Integration"**: Mục tiêu của Function là biến các logic phức tạp thành các từ khóa SQL tự nhiên.

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý Hàm thuần túy (Pure Function Principle)**: Đầu vào xác định đầu ra, không gây ra tác dụng phụ (Side effects).
- **Nguyên lý Tái sử dụng (Reusability)**: Viết một lần công thức tính lương, dùng ở mọi nơi trong các báo cáo SELECT.

---

## 🔗 NEURAL MAPPING
- **Vertical (Parent)**: [[Relational_Database_Fundamentals]].
- **Horizontal (Siblings)**: [[MySQL_Stored_Procedures]] (So sánh sự khác biệt), [[MySQL_Triggers]].
- **Cross-Domain (Nexus)**: 
    - **Java**: Tương đương với các **Methods có kiểu trả về** (non-void) và không thay đổi biến member (Immutable/Pure methods).
    - **Japanese**: Function (関数 - Kansū).

---

## 📝 CORNELL SUMMARY
| Key Points | Detailed Notes |
|------------|----------------|
| **Khai báo** | `CREATE FUNCTION name(p1 INT) RETURNS INT`<br>`DETERMINISTIC`<br>`BEGIN RETURN p1 * 2; END;` |
| **Sử dụng** | `SELECT name(10);` (Không dùng CALL). |
| **Hạn chế** | Không được dùng các lệnh thay đổi dữ liệu (DML). |
| **Khác biệt** | Function trả về 1 giá trị, dùng trong SELECT.<br>Procedure trả về 0 hoặc nhiều, dùng lệnh CALL. |

---
**Summary**: MySQL Function là công cụ tối ưu để đóng gói các công thức tính toán và biến đổi dữ liệu, cho phép nhúng trực tiếp logic vào các truy vấn SQL để tăng tính tái sử dụng và tinh gọn mã nguồn.

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
