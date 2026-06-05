---
domain: "IT_Knowledge"
type: "deep-raid"
status: "active"
tags: [sql, remediation, count-sum, execution-order]
created: 2026-05-31
nexus_version: 8.2
---

# 🏹 SQL DEEP RAID: PHÁ TAN 3 HỐ ĐEN TƯ DUY

Chào John, đây là bản "huấn lệnh" đặc biệt để giải quyết dứt điểm các lỗi logic anh vừa gặp. Đừng để SQL đánh lừa, hãy dùng tư duy hệ thống!

---

## ⚡ TRẬN TẬP KÍCH 1: COUNT vs SUM (Hành động vs Khối lượng)

**Lỗi của anh:** Nhầm lẫn giữa "Số lần làm" và "Tổng số lượng".

| Hàm | Ý nghĩa thực tế | Ví dụ Furama |
| :--- | :--- | :--- |
| **`COUNT(id)`** | Đếm **số dòng** (Số lần xuất hiện). | Đếm xem khách đã đặt Karaoke bao nhiêu **lần**. |
| **`SUM(quantity)`** | Cộng **giá trị** bên trong cột. | Tính xem tổng cộng khách đã hát bao nhiêu **giờ**. |

> **💡 Quy tắc:** Muốn biết "bao nhiêu người", "bao nhiêu lần" -> Dùng **COUNT**. Muốn biết "tổng tiền", "tổng số lít/giờ" -> Dùng **SUM**.

---

## ⚡ TRẬN TẬP KÍCH 2: THỨ TỰ THỰC THI (Vòng đời của Alias)

**Tại sao `WHERE tien_phong > 1000` lại báo lỗi?** Vì SQL chạy theo thứ tự:
1. `FROM` (Lấy bảng)
2. `WHERE` (Lọc dòng) 👈 **Lúc này cái tên `tien_phong` chưa tồn tại!**
3. `GROUP BY`
4. `HAVING`
5. `SELECT` 👈 **Đến đây anh mới đặt tên `AS tien_phong`.**

> **💡 Quy tắc:** Tuyệt đối không dùng tên thay thế (Alias) trong `WHERE` và `HAVING`. Hãy dùng công thức gốc.

---

## ⚡ TRẬN TẬP KÍCH 3: SUBQUERY SCOPE (Mượn râu ông nọ)

**Lỗi:** So sánh nhầm cột của bảng ngoài thay vì bảng trong.
```sql
WHERE EXISTS (SELECT 1 FROM table_B WHERE id = id) -- SAI: id = id luôn đúng!
WHERE EXISTS (SELECT 1 FROM table_B b WHERE b.id = a.id) -- ĐÚNG: Phải chỉ rõ bảng nào.
```

---

## ⚡ TRẬN TẬP KÍCH 4: CASCADING DELETE & HORIZONTAL EXPANSION (The Architect Awakening)

**Bài toán:** Xóa dữ liệu dây chuyền từ Bảng Gốc (Ông) xuống đến Bảng Chi tiết (Cháu) (Ví dụ: Bài 27 Furama Database).

**Lỗ hổng Tư duy:**
1. Không biết chọn ID nào để lưu vào Bảng Tạm.
2. Không hình dung được luồng đi của Subquery trong lệnh xóa các bảng phụ.

**Khắc phục (Mental Models):**
1. **Mô hình Cây gia phả (The Root & Branch):** Khi thực hiện Hard Delete qua nhiều bảng, **LUÔN LƯU TRỮ ID CỦA BẢNG GỐC (RỄ)** vào Temp Table. Nếu lưu ID bảng con (cành), khi xóa con xong sẽ đứt liên kết, không truy ngược lên để xóa rễ được. Thứ tự xóa: Cháu -> Con -> Cha -> Ông.
2. **Mô hình Mở rộng ngang (Horizontal Expansion):** Bản chất của `JOIN` là ghép nối các bảng theo chiều ngang (Cartesian Product + Filter). Nhờ dải dữ liệu mở rộng này, bảng Cháu (dù chỉ có khóa ngoại của Con) vẫn có thể "nhìn thấy" khóa chính của Ông (đang nằm trong danh sách đen/Temp Table) để tự đưa mình vào diện bị xóa. Subquery chính là hành trình dò tìm ngược từ Danh sách đen xuống qua các lớp `JOIN`.

---

# 🛡️ BÀI TẬP BẮT LỖI (SPOT THE BUG)

**Anh hãy sửa lại 3 câu SQL "tội lỗi" sau đây:**

1. **Câu 1:** Tính tổng số tiền lương công ty phải trả cho nhân viên.
   `SELECT COUNT(salary) FROM employees;`
   👉 **Sửa lại:** __________________________

2. **Câu 2:** Lọc các dịch vụ có giá trên 500.
   `SELECT service_name, price AS gia_tien FROM other_services WHERE gia_tien > 500;`
   👉 **Sửa lại:** __________________________

3. **Câu 3:** Tìm khách hàng chưa từng làm hợp đồng.
   `SELECT customer_name FROM customers c WHERE customer_id NOT IN (SELECT customer_id FROM contracts);`
   *(Gợi ý: Câu này chạy được nhưng anh hãy thử viết bằng **LEFT JOIN** để tối ưu hơn)*.
