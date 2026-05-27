---
domain: IT_Knowledge
type: concept
status: active
tags: [database-design, relationships, cardinality, normalization]
created: 2026-05-27
nexus_version: 6.0
---

# [[One_To_Many_Relationship]] (Quan hệ 1 - Nhiều)

## Tổng quan
Quan hệ **1 - n (One-to-Many)** là loại quan hệ phổ biến nhất trong thiết kế CSDL quan hệ. Trong đó, một bản ghi ở bảng A có thể liên kết với nhiều bản ghi ở bảng B, nhưng một bản ghi ở bảng B chỉ liên kết với duy nhất một bản ghi ở bảng A.

## Nguyên tắc Thiết kế Vàng
**Khóa ngoại ([[Foreign_Key]]) luôn nằm ở phía "Nhiều" (Many).**

## Ví dụ Thực tế
- Một **Lớp học** (1) có nhiều **Học viên** (n).
    - Khóa ngoại `class_id` nằm ở bảng `Students`.
- Một **Khách hàng** (1) có nhiều **Đơn hàng** (n).
    - Khóa ngoại `customer_id` nằm ở bảng `Orders`.

## Tại sao phải làm vậy?
Nếu đặt khóa ngoại ở phía "1", bạn sẽ gặp giới hạn về dữ liệu (chỉ lưu được 1 thực thể liên kết) hoặc gây ra sự trùng lặp dữ liệu nghiêm trọng nếu cố gắng lưu nhiều dòng.

## Related
- [[Relational_Data_Model]]
- [[Foreign_Key]]
- [[SQL_Join_Fundamentals]]
