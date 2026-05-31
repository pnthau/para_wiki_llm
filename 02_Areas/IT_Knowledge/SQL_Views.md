---
domain: "IT_Knowledge"
type: "atomic-note"
status: "active"
tags: [sql, database, view, security, virtualization]
created: 2026-05-30
source: "00_Raw/SQL Using views.md"
nexus_version: 6.0
---

# 🧠 SQL VIEWS: THE VIRTUAL LAYER

> "A View is not a table, but a window into one or more tables."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- Cú pháp: `CREATE VIEW view_name AS SELECT...`.
- Thao tác: Truy vấn `SELECT` từ View giống như bảng thật.
- Khả năng: `INSERT`, `UPDATE`, `DELETE` thông qua View (có điều kiện).

### 2. Patterns (Mô thức)
- **Virtualization Pattern**: Tách biệt dữ liệu vật lý (Physical Tables) và dữ liệu logic (Views).
- **Security Pattern**: Hạn chế cột/dòng nhạy cảm (ví dụ: giấu cột `SALARY`) bằng cách chỉ cấp quyền truy cập vào View.
- **Simplification Pattern**: Gom các câu lệnh `JOIN` phức tạp vào một View để người dùng sau chỉ cần `SELECT * FROM view`.

### 3. Structures (Cấu trúc hệ thống)
- **Dependency**: View không chứa dữ liệu riêng, nó phụ thuộc hoàn toàn vào bảng cơ sở (Base Tables).
- **Constraints Integrity**: `WITH CHECK OPTION` đảm bảo dữ liệu mới nhập qua View phải thỏa mãn điều kiện lọc của chính View đó.
- **Updatability Rules**: Các quy tắc khắt khe (không `DISTINCT`, không `GROUP BY`, không nhiều bảng...) nhằm đảm bảo DB có thể ánh xạ ngược (Map) thay đổi từ View về đúng vị trí trong Base Table.

### 4. Mental Models (Tư duy cốt lõi)
- **"Abstraction"**: Ẩn đi sự phức tạp của cấu trúc bên dưới.
- **"Encapsulation"**: Đóng gói logic truy vấn thành một thực thể có tên gọi.

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý 1: Ánh xạ (Mapping)**: View thực chất là một câu lệnh SELECT được đặt tên và lưu trữ. Khi gọi View, DB thực thi SELECT đó.
- **Nguyên lý 2: Tính nhất quán (Consistency)**: Thay đổi qua View phản ánh ngay vào bảng gốc và ngược lại.

---

## 🔗 NEURAL MAPPING
- **Horizontal (Siblings)**: [[SQL_Join_Fundamentals]], [[Database_Indexing_Fundamentals]].
- **Vertical (Foundations)**: [[Relational_Database_Fundamentals]].
- **Cross-Domain (Nexus)**: 
    - **Java**: Tương tự như **DTO (Data Transfer Object)** - chỉ lấy những gì cần thiết từ Entity.
    - **Japanese**: View (ビュー - Byū), Virtual Table (仮想テーブル - Kasō tēburu).

---

## 📝 CORNELL SUMMARY
| Key Points             | Detailed Notes                                                                                                     |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------ |
| **Cú pháp**            | `CREATE VIEW name AS SELECT...`<br>`DROP VIEW name;`                                                               |
| **Lợi ích**            | 1. Bảo mật (giấu dữ liệu nhạy cảm).<br>2. Đơn giản hóa (ẩn JOIN phức tạp).<br>3. Tính nhất quán (tóm tắt báo cáo). |
| **WITH CHECK OPTION**  | Ngăn chặn INSERT/UPDATE làm "biến mất" dữ liệu khỏi View (do không thỏa mãn WHERE).                                |
| **Điều kiện cập nhật** | View phải đơn giản: 1 bảng, không hàm gộp, không GROUP BY/DISTINCT.                                                |

---
**Summary**: SQL View là một bảng ảo giúp bảo mật và đơn giản hóa truy cập dữ liệu bằng cách đóng gói các câu lệnh SELECT phức tạp thành một cửa sổ logic duy nhất.

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
