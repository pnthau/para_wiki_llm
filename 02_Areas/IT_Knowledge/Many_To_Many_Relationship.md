---
domain: IT_Knowledge
type: concept
status: active
tags: [database-design, relationships, junction-table, many-to-many]
created: 2026-05-27
nexus_version: 6.0
---

# [[Many_To_Many_Relationship]] (Quan hệ Nhiều - Nhiều)

## Tổng quan
Quan hệ **n - n (Many-to-Many)** xảy ra khi nhiều bản ghi ở bảng A có thể liên kết với nhiều bản ghi ở bảng B. 
*Ví dụ: Một Học viên có thể học nhiều Lớp, và một Lớp có nhiều Học viên.*

## Giải pháp: Bảng Trung gian (Junction Table)
RDBMS không thể biểu diễn trực tiếp quan hệ n-n. Ta phải tách nó thành hai quan hệ 1-n thông qua một **Bảng trung gian**.

### Cấu trúc Bảng trung gian
Bảng này thường chứa ít nhất 2 cột:
1. `table_a_id` (Khóa ngoại trỏ về bảng A).
2. `table_b_id` (Khóa ngoại trỏ về bảng B).
*Hai cột này thường kết hợp lại thành một [[Composite_Key]] (Khóa chính hỗn hợp).*

## Tại sao phải dùng bảng trung gian?
- Tránh trùng lặp dữ liệu cực lớn.
- Đảm bảo tính linh hoạt (có thể thêm/xóa liên kết mà không ảnh hưởng đến dữ liệu gốc của A hoặc B).

## Related
- [[One_To_Many_Relationship]]
- [[Relational_Data_Model]]
- [[Composite_Key]]
