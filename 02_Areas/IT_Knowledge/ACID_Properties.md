---
domain: IT_Knowledge
type: concept
status: active
tags: [database, transactions, acid, reliability]
created: 2026-05-27
nexus_version: 6.0
---

# [[ACID_Properties]] (Tính chất ACID)

## Tổng quan
Để đảm bảo độ tin cậy của dữ liệu trong các hệ thống [[RDBMS]], các giao dịch (Transactions) phải tuân thủ 4 tính chất ACID.

## 4 Trụ cột ACID
1. **Atomicity (Tính nguyên tử)**: "Tất cả hoặc không có gì". Một giao dịch phải được thực hiện hoàn toàn hoặc không thực hiện chút nào.
2. **Consistency (Tính nhất quán)**: Đảm bảo dữ liệu chuyển từ trạng thái hợp lệ này sang trạng thái hợp lệ khác, không vi phạm các ràng buộc (Constraints).
3. **Isolation (Tính cô lập)**: Các giao dịch thực hiện đồng thời không được ảnh hưởng đến nhau.
4. **Durability (Tính bền vững)**: Một khi giao dịch đã thành công (Commit), dữ liệu sẽ được lưu vĩnh viễn ngay cả khi hệ thống gặp sự cố.

## Vai trò trong Java Phát triển
Khi lập trình Java Spring Boot, bạn sẽ sử dụng `@Transactional` để đảm bảo các thao tác với Database tuân thủ chuẩn ACID này.

## Related
- [[Relational_Database_Fundamentals]]
- [[Relational_Data_Model]]
