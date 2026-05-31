---
domain: "IT_Knowledge"
type: "atomic-note"
status: "active"
tags: [sql, mysql, indexing, performance, explain]
created: 2026-05-30
source: "00_Raw/Cách sử dụng chỉ mục để cải thiện hiệu năng truy vấn của MySQL.md"
nexus_version: 6.0
---

# 🧠 MYSQL INDEXING & TỐI ƯU HÓA TRUY VẤN (EXPLAIN)

> "Không có Index, Database phải lật từng trang sách để tìm thông tin. Có Index, Database chỉ cần nhìn vào Mục lục."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- **Triệu chứng hệ thống**: App chậm, tải trang mãi không xong, query bị treo (backed up).
- **Giải pháp bề mặt**: Thêm Index vào các cột hay được dùng trong mệnh đề `WHERE` để tăng tốc độ lấy dữ liệu.
- **Công cụ kiểm tra**: Sử dụng lệnh `EXPLAIN SELECT...` để xem MySQL thực thi câu lệnh như thế nào.

### 2. Patterns (Mô thức)
- **Full Table Scan (ALL)**: Nếu `key: NULL` và `type: ALL`, MySQL đang phải đọc *toàn bộ* số dòng trong bảng (`rows: 142/142`). Đây là mô thức "thảm họa" về hiệu năng khi bảng lớn lên.
- **Index Seek (range/ref)**: Nếu `key: index_name`, MySQL chỉ cần đọc một lượng nhỏ số dòng (`rows: 17/142`) để trả về kết quả. Đây là mô thức lý tưởng.

### 3. Structures (Cấu trúc hệ thống)
- **EXPLAIN Output Structure**:
    - `possible_keys`: Những Index mà MySQL *có thể* dùng.
    - `key`: Index mà MySQL *chính thức* quyết định dùng.
    - `rows`: Số lượng dòng dự kiến MySQL phải duyệt qua (Càng nhỏ càng tốt).
    - `Extra`: Thông tin bổ sung (`Using index` nghĩa là nó đã dùng chỉ mục).

### 4. Mental Models (Tư duy cốt lõi)
- **"Index = Table of Contents"**: Chỉ mục hoạt động y hệt trang mục lục của một cuốn sách. Thay vì đọc từ trang 1 đến trang 1000, bạn mở mục lục, tìm chữ 'T', và mục lục chỉ bạn lật thẳng đến trang 450.
- **The Architect's Trade-off (Sự đánh đổi)**: Đọc bài thô chỉ nói về tốc độ đọc nhanh hơn, nhưng Mental Model của Kiến trúc sư phải hiểu: Thêm Index sẽ làm **Tốc độ đọc (SELECT)** nhanh lên, nhưng làm **Tốc độ ghi (INSERT/UPDATE/DELETE)** chậm đi. Vì mỗi lần ghi dữ liệu mới, DB phải cập nhật lại "Cuốn mục lục".

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý Đánh đổi (Space-Time Trade-off)**: Đánh đổi không gian lưu trữ (phải tốn thêm ổ cứng để lưu cuốn "Mục lục") để lấy thời gian xử lý (trực tiếp trỏ đến dữ liệu thay vì rà soát tuyến tính).

---

## 🔗 NEURAL MAPPING
- **Horizontal (Siblings)**: [[Database_Indexing_Fundamentals]], [[SQL_Views]].
- **Vertical (Foundations)**: [[Relational_Database_Fundamentals]].
- **Cross-Domain (Nexus)**: 
    - **Java**: Tương tự như dùng `HashMap` ($O(1)$) thay vì duyệt qua một cái `ArrayList` ($O(n)$) để tìm kiếm phần tử.

---

## 📝 CORNELL SUMMARY
| Key Points | Detailed Notes |
|------------|----------------|
| Vấn đề | Bảng lớn không có Index sẽ gây chậm hệ thống do Full Table Scan. |
| Lệnh `EXPLAIN` | Đặt trước câu `SELECT` để phân tích Execution Plan (kế hoạch thực thi) của MySQL. |
| Phân tích `EXPLAIN` | Chú ý cột `key` (index nào được dùng) và cột `rows` (số dòng phải duyệt). Nếu `rows` giảm mạnh so với tổng số dòng, Index đang hoạt động hiệu quả. |

---
**Summary**: Index (chỉ mục) là công cụ quan trọng nhất để tối ưu hóa hiệu năng truy vấn trong CSDL quan hệ. Lệnh `EXPLAIN` giúp lập trình viên "nhìn xuyên thấu" cách MySQL tìm kiếm dữ liệu để có quyết định đánh Index chính xác.

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
