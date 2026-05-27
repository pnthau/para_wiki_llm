---
domain: IT_Knowledge
type: concept
status: active
tags: [database-design, junction-table, many-to-many, metadata]
created: 2026-05-27
nexus_version: 6.0
---

# [[Junction_Table]] (Bảng trung gian)

## Tổng quan
**Junction Table** (hay Associative Table) là giải pháp kỹ thuật để thực thi quan hệ **Nhiều - Nhiều (n-n)** trong CSDL quan hệ.

## Thành phần cấu tạo
1. **Khóa ngoại A**: Trỏ về bảng thứ nhất.
2. **Khóa ngoại B**: Trỏ về bảng thứ hai.
3. **[[Composite_Key]]**: Thường dùng sự kết hợp của 2 khóa ngoại trên làm khóa chính.
4. **Metadata (Thông tin bổ sung)**: Các thuộc tính phát sinh từ mối quan hệ (Ví dụ: Ngày đăng ký, Trạng thái, Điểm số).

## Ví dụ: `student_regiested_course`
Dựa trên thiết kế của John:
- `student_id` (FK)
- `course_id` (FK)
- `start_course`, `end_course` (Metadata)
- `status` (Metadata)

## Related
- [[Many_To_Many_Relationship]]
- [[One_To_Many_Relationship]]
- [[Composite_Key]]
