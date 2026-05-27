---
domain: IT_Knowledge
type: reference
status: active
tags: [database, relational-database, rdbms, mysql, sql]
created: 2026-05-27
source: "00_Raw/Cơ sở dữ liệu quan hệ.md"
nexus_version: 6.0
---

# [[Relational_Database_Fundamentals]] (Cornell Notes)

| Cue                       | Notes                                                                                                                                                                                                                       |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Tiến hóa Lưu trữ**      | - **File System**: Triển khai nhanh, trực quan nhưng dễ trùng lặp, không nhất quán, chia sẻ kém.<br>- **[[Relational_Database]] (CSDL Quan hệ)**: Lưu trữ có cấu trúc, thỏa mãn truy cập đồng thời từ nhiều người/ứng dụng. |
| **Lợi ích CSDL**          | - Giảm trùng lặp tối đa.<br>- Đảm bảo tính nhất quán và [[Data_Integrity]] (toàn vẹn dữ liệu).<br>- Truy xuất linh hoạt, khả năng chia sẻ cao (hỗ trợ phân tán).                                                            |
| **Thách thức Quản trị**   | - Đảm bảo chủ quyền và bảo mật dữ liệu.<br>- Giải quyết tranh chấp dữ liệu (concurrency).<br>- An toàn và phục hồi dữ liệu khi có sự cố.                                                                                    |
| **[[RDBMS]] & [[MySQL]]** | - **Hệ quản trị CSDL**: Phần mềm điều phối CSDL (MySQL, SQL Server, Oracle).<br>- **MySQL**: Phổ biến cho Web, tốc độ cao, tương thích tốt, sử dụng ngôn ngữ [[SQL]].                                                       |
| **Cập nhật MySQL 8.4**    | - Siết chặt [[Foreign_Key]] (yêu cầu Unique Index ở bảng cha).<br>- Loại bỏ `mysql_native_password` (dùng `caching_sha2_password`).<br>- Tối ưu hóa InnoDB cho phần cứng hiện đại.                                          |

## Summary
[[Relational_Database_Fundamentals]] đánh dấu bước chuyển từ lưu trữ tệp tin rời rạc sang hệ thống tri thức có cấu trúc. Việc sử dụng [[RDBMS]] như [[MySQL]] (đặc biệt là bản 8.4 LTS) giúp đảm bảo tính toàn vẹn dữ liệu và hiệu suất cao cho các ứng dụng Java quy mô lớn.

## Related
- [[MOC_IT_Knowledge]]
- [[Relational_Data_Model]]
- [[ACID_Properties]]
- [[MySQL_8.4_Features]]
- [[SQL_Basics_Lesson_1]]
