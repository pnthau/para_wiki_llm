---
domain: IT_Knowledge
type: concept
status: active
tags: [database-design, primary-key, performance, scalability]
created: 2026-05-27
nexus_version: 6.0
---

# [[Surrogate_Key]] (Khóa thay thế)

## Tổng quan
**Surrogate Key** là một định danh duy nhất được hệ thống tự động tạo ra, không mang ý nghĩa về mặt kinh doanh (business meaning). Phổ biến nhất là các cột `id` kiểu số nguyên tự tăng (Auto-increment) hoặc `UUID`.

## Tại sao Surrogate Key là "Vua" trong Modern DB?
1. **Bất biến (Immutability)**: Vì không mang nghĩa kinh doanh, Surrogate Key không bao giờ thay đổi. Nếu một học viên đổi Email, `id` của họ vẫn giữ nguyên, không làm gãy các liên kết [[Foreign_Key]].
2. **Hiệu suất (Performance)**: So sánh và lập chỉ mục (Indexing) trên 1 cột số nguyên nhanh hơn rất nhiều so với [[Composite_Key]] hoặc chuỗi văn bản dài.
3. **Dễ triển khai Java/JPA**: ORM như Hibernate hoạt động ổn định nhất khi mỗi Entity có một ID đơn nhất.

## So sánh với Natural Key (Khóa tự nhiên)
- **Natural Key**: Dùng dữ liệu thực tế (Email, CMND) làm khóa. Rủi ro cao vì dữ liệu thực tế có thể thay đổi hoặc bị trùng lặp do sai sót nhập liệu.

## Related
- [[Composite_Key]]
- [[Primary_Key]]
- [[Relational_Data_Model]]
