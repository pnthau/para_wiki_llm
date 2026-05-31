---
domain: "IT_Knowledge"
type: "concept"
status: "active"
tags: [mysql, innodb, performance, hash-index]
created: 2026-05-30
nexus_version: 6.0
---

# 🧠 ADAPTIVE HASH INDEX (INNODB)

> "Khi MySQL thấy bạn tìm một thứ lặp đi lặp lại, nó tự động tạo ra một 'đường tắt' bằng Hash Index trên RAM."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- Engine InnoDB không cho phép người dùng tự tạo Hash Index bằng lệnh `CREATE INDEX... USING HASH`.
- Tuy nhiên, nhiều truy vấn bằng toán tử `=` vẫn có tốc độ thần tốc ngang ngửa Hash.

### 2. Patterns (Mô thức)
- **Caching Pattern**: Lưu trữ các điểm truy cập nóng nhất (Hot data) trực tiếp lên bộ nhớ RAM.
- **Adaptive Pattern**: Tính năng này hoàn toàn tự động (Adaptive). Lập trình viên không cần can thiệp.

### 3. Structures (Cấu trúc hệ thống)
- Khi InnoDB nhận thấy một B-Tree Index đang được truy vấn rất nhiều lần bằng một giá trị cụ thể (Ví dụ: tìm kiếm user_id = 5 liên tục), nó sẽ tự động xây dựng một Hash Index trong bộ đệm (Buffer Pool) trỏ trực tiếp đến trang dữ liệu đó.
- Lần tìm kiếm tiếp theo cho `user_id = 5`, InnoDB không duyệt cây B-Tree nữa mà dùng Hash Index để trỏ thẳng tới đích (độ phức tạp $O(1)$).

### 4. Mental Models (Tư duy cốt lõi)
- **"Automation over Manual Control"**: Thay vì bắt lập trình viên phải lựa chọn (B-Tree hay Hash), InnoDB chọn cách "Bao thầu" cả hai: Bề mặt dùng B-Tree để đa năng, bên dưới tự động dùng Hash để tăng tốc cục bộ.

---
*Back to [[MySQL_Index_Deep_Dive]]*
