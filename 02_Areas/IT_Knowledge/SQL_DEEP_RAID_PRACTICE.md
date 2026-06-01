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
