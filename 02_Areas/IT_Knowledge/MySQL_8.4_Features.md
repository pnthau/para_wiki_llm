---
domain: IT_Knowledge
type: concept
status: active
tags: [mysql, database-updates, lts, security]
created: 2026-05-27
nexus_version: 6.0
---

# [[MySQL_8.4_Features]] (Các tính năng MySQL 8.4 LTS)

## Tổng quan
MySQL 8.4 là bản phát hành **LTS (Long-Term Support)** đầu tiên theo mô hình phát hành mới của Oracle (tháng 4/2024), tập trung vào sự ổn định và bảo mật.

## Các thay đổi quan trọng cho Java Developer
1. **Siết chặt Khóa ngoại ([[Foreign_Key]])**: 
    - Bắt buộc bảng cha phải có `UNIQUE` index trên cột được tham chiếu.
    - Ngăn chặn các thiết kế sai chuẩn ngay từ tầng DB.
2. **Bảo mật Kết nối**:
    - `mysql_native_password` bị vô hiệu hóa mặc định.
    - Phải sử dụng Driver JDBC tương thích với `caching_sha2_password`.
3. **Inclusive Terminology**:
    - Chuyển hoàn toàn sang `SOURCE/REPLICA` thay cho Master/Slave.
4. **Tối ưu hóa InnoDB**:
    - Vô hiệu hóa các bộ đệm không còn phù hợp với ổ SSD hiện đại để tăng tính ổn định.

## Related
- [[Relational_Database_Fundamentals]]
- [[Relational_Data_Model]]
- [[Source_Evaluation]]
