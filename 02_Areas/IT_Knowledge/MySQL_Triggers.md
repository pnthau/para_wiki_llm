---
domain: "IT_Knowledge"
type: "atomic-note"
status: "active"
tags: [sql, mysql, trigger, automation, performance, security]
created: 2026-05-30
source: "Knowledge Synthesis"
nexus_version: 6.0
---

# 🧠 MYSQL TRIGGERS: THE AUTOMATIC REFLEX

> "Trigger là phản xạ tự nhiên của Database, giúp bảo vệ tính toàn vẹn dữ liệu một cách thầm lặng."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- `BEFORE/AFTER` + `INSERT/UPDATE/DELETE`.
- Từ khóa `NEW` (giá trị mới) và `OLD` (giá trị cũ).
- Thân Trigger nằm trong `BEGIN...END`.

### 2. Patterns (Mô thức)
- **Data Cleansing Pattern**: Dùng `BEFORE INSERT` để chuẩn hóa dữ liệu (Trim, Lowercase...).
- **Audit Logging Pattern**: Dùng `AFTER UPDATE` để ghi lại lịch sử thay đổi vào bảng Log.
- **Business Rule Enforcement**: Dùng `SIGNAL` để ngăn chặn các hành động vi phạm quy tắc (ví dụ: tuổi < 18).

### 3. Structures (Cấu trúc hệ thống)
- **Row-level activation**: Mỗi dòng bị tác động sẽ kích hoạt Trigger một lần (`FOR EACH ROW`).
- **Transactional Integrity**: Trigger chạy trong cùng một Transaction với câu lệnh gốc. Nếu Trigger lỗi, toàn bộ lệnh gốc sẽ bị Rollback (Hủy bỏ).
- **Execution Order**: `BEFORE Triggers` -> `Constraints (Unique/FK)` -> `Data Write` -> `AFTER Triggers`.

### 4. Mental Models (Tư duy cốt lõi)
- **"The Silent Guard"**: Hoạt động ngầm, không cần App gọi. Cực kỳ mạnh mẽ nhưng khó kiểm soát (Debug khó hơn Code Java).
- **"Side Effect Awareness"**: Mỗi Trigger là một chi phí bổ sung cho hiệu năng. Xóa 1 triệu dòng mà có Trigger `AFTER DELETE` sẽ chậm hơn rất nhiều.

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý Phản xạ (Reflex Principle)**: Tự động phản ứng với kích thích (sự thay đổi dữ liệu) để duy trì trạng thái ổn định của hệ thống.
- **Nguyên lý Nguyên tử (Atomicity)**: Trigger và lệnh gốc là một khối thống nhất (Cùng sống hoặc cùng chết).

---

## 🔗 NEURAL MAPPING
- **Vertical (Parent)**: [[Relational_Database_Fundamentals]].
- **Horizontal (Siblings)**: [[MySQL_Stored_Procedures]], [[ACID_Properties]].
- **Cross-Domain (Nexus)**: 
    - **Java**: Tương tự như **Event Listeners** hoặc **AOP (Aspect-Oriented Programming)** - tự động chèn logic vào trước/sau một method.

---

## 📝 CORNELL SUMMARY
| Key Points | Detailed Notes |
|------------|----------------|
| **BEFORE** | Kiểm tra/Sửa đổi dữ liệu TRƯỚC khi lưu. |
| **AFTER** | Thực hiện các tác vụ phụ trợ SAU khi lưu thành công. |
| **OLD & NEW** | `INSERT`: chỉ có NEW.<br>`DELETE`: chỉ có OLD.<br>`UPDATE`: có cả hai. |
| **SIGNAL** | Cách để bắn lỗi và dừng lệnh SQL (`SIGNAL SQLSTATE '45000'`). |

---
**Summary**: MySQL Triggers cung cấp khả năng tự động hóa logic ngay tại tầng dữ liệu, đảm bảo tính toàn vẹn và thực thi các quy tắc nghiệp vụ một cách minh bạch với ứng dụng bên ngoài.

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
