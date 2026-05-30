---
nexus_version: 6.0
domain: "Database"
type: "concept"
status: "active"
tags: [sql, furama, systems-thinking, iceberg-model]
created: 2026-05-30
---

# 🧠 HỆ THỐNG CƠ SỞ DỮ LIỆU FURAMA RESORT

> "Dữ liệu không đơn thuần là các bảng, nó là huyết mạch phản ánh quy trình vận hành của một doanh nghiệp."

---

## 🏗️ THE ICEBERG ANALYSIS

### 1. Events (Phần nổi)
- Các bảng: `customers`, `employees`, `contracts`, `residences`.
- Các câu lệnh SQL: `CREATE TABLE`, `FOREIGN KEY`, `CHECK constraints`.
- Kết quả: Một database rỗng có cấu trúc sẵn sàng để lưu trữ dữ liệu resort.

### 2. Patterns (Mô thức lặp lại)
- **Mô thức liên kết (Linking Tables)**: Sử dụng các bảng trung gian như `residence_renttype_link` và `other_service_service_unit_link`. Đây là mô thức giải quyết quan hệ Many-to-Many hoặc tách biệt thuộc tính biến động (giá theo loại thuê).
- **Mô thức chuẩn hóa**: Tách biệt `customer_types`, `education_levels`, `roles` ra khỏi bảng chính để tránh dư thừa dữ liệu.

### 3. Structures (Cấu trúc hệ thống)
- **Ràng buộc toàn vẹn (Integrity)**: Sử dụng `RESTRICT` và `CASCADE` trong Foreign Keys để bảo vệ dữ liệu (ví dụ: không thể xóa khách hàng nếu họ đang có hợp đồng).
- **Business Logic trong DB**: Sử dụng `CHECK constraints` (ví dụ: `deposit > 0`, `end_date > start_date`). Điều này cho thấy tư duy: "Bảo vệ dữ liệu ngay từ tầng thấp nhất (Database) thay vì chỉ dựa vào App logic".

### 4. Mental Models (Tư duy cốt lõi)
- **"Single Source of Truth"**: Mỗi thông tin chỉ nằm ở một nơi duy nhất.
- **"Context-Driven Design"**: Thiết kế bảng dựa trên thực tế vận hành resort (thuê theo ngày/tháng/năm, dịch vụ đi kèm theo đơn vị tính).

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý 1: Định danh duy nhất (Entity Integrity)**: Mọi bảng đều có `id` AUTO_INCREMENT.
- **Nguyên lý 2: Mối quan hệ (Referential Integrity)**: Mối quan hệ giữa Con người (Customer/Employee) và Dịch vụ (Residence) thông qua Hợp đồng (Contract).

---

## 🔗 NEURAL MAPPING
- **Horizontal (Siblings)**: [[ACID_Properties]], [[Relational_Data_Model]].
- **Vertical (Foundations)**: [[Database_Fundamentals_Ch1]].
- **Cross-Domain (Nexus)**: 
    - **Japanese**: `contracts` (契約 - Keiyaku), `customers` (顧客 - Kokyaku).
    - **Java**: Tương ứng với các Entity classes trong mô hình 3 lớp.

---

## 📝 CORNELL SUMMARY
| Key Points | Detailed Notes |
|------------|----------------|
| Ràng buộc (Constraints) | Đảm bảo tính đúng đắn của dữ liệu ngay tại nguồn (Check, Unique, Not Null). |
| Bảng trung gian | Giải quyết sự phức tạp của việc thay đổi giá và dịch vụ đi kèm. |

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
