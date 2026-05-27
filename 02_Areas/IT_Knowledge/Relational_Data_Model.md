---
domain: IT_Knowledge
type: concept
status: active
tags: [database-theory, relational-model, codd, normalization]
created: 2026-05-27
nexus_version: 6.0
---

# [[Relational_Data_Model]] (Mô hình Dữ liệu Quan hệ)

## Tổng quan
Mô hình quan hệ được **E.F. Codd** đề xuất vào năm 1970 tại IBM. Đây là nền tảng toán học dựa trên lý thuyết tập hợp cho hầu hết các hệ thống CSDL hiện đại.

## Các khái niệm cốt lõi
1. **Relation (Quan hệ)**: Tương ứng với một **Bảng (Table)**.
2. **Tuple (Bộ)**: Tương ứng với một **Hàng (Row/Record)**.
3. **Attribute (Thuộc tính)**: Tương ứng với một **Cột (Column/Field)**.
4. **[[Primary_Key]] (Khóa chính)**: Định danh duy nhất cho mỗi Tuple.
5. **[[Foreign_Key]] (Khóa ngoại)**: Tạo mối liên kết giữa các Relation.

## 12 Quy tắc của Codd (Codd's 12 Rules)
Hệ thống muốn được coi là "CSDL Quan hệ hoàn toàn" phải tuân thủ các quy tắc về xử lý Null, truy cập dữ liệu qua ngôn ngữ SQL, và tính độc lập vật lý/logic của dữ liệu.

## Chuẩn hóa (Normalization)
Quá trình tổ chức dữ liệu để giảm thiểu trùng lặp (Redundancy) và đảm bảo tính phụ thuộc dữ liệu hợp lý (1NF, 2NF, 3NF, BCNF).

## Related
- [[Relational_Database_Fundamentals]]
- [[MySQL_8.4_Features]]
- [[Data_Integrity]]
