---
domain: "IT_Knowledge"
type: "framework"
status: "active"
tags: [sql, thinking-framework, gfrb, problem-solving]
created: 2026-05-31
nexus_version: 8.2
---

# 🧠 THE G.F.R.B SQL THINKING FRAMEWORK

*Bí kíp tư duy giải quyết mọi bài toán nghiệp vụ SQL (Từ mức cơ bản đến Architect).*
*Sử dụng 4 câu hỏi này TRƯỚC KHI gõ bất kỳ chữ `SELECT` nào.*

---

## 1. [G] GRANULARITY (Hạt Dữ Liệu)
> **Hỏi:** "1 dòng kết quả cuối cùng đại diện cho cái gì?"

| Nhận diện Yêu cầu | Công cụ sử dụng |
| :--- | :--- |
| Muốn in ra chi tiết từng đối tượng (Tên, Tuổi, ID). | Cứ `SELECT` bình thường. |
| Có chữ **"Mỗi"**, **"Từng"** (VD: Mỗi phòng ban, Từng tháng). Muốn gom nhỏ lại. | **`GROUP BY`** |
| Muốn in chi tiết, nhưng vẫn muốn tính Tổng/Trung bình bên cạnh để so sánh. | **`WINDOW FUNCTION`** (`OVER()`) |

---

## 2. [F] FILTER (Cái Phễu)
> **Hỏi:** "Phải đuổi bớt dữ liệu đi ở giai đoạn nào?"

| Nhận diện Yêu cầu | Công cụ sử dụng |
| :--- | :--- |
| Lọc bản chất từng cá thể **(Trước khi đếm/tính tổng)**. VD: KH Nam, Lương > 5000. | **`WHERE`** |
| Lọc dựa trên kết quả tính toán **(Sau khi gom nhóm)**. VD: Đếm ra > 10 người. | **`HAVING`** |

---

## 3. [R] RELATIONSHIP (Mối Quan Hệ)
> **Hỏi:** "Dữ liệu tôi cần hiển thị nằm ở 1 bảng hay nhiều bảng?"

| Nhận diện Yêu cầu | Công cụ sử dụng |
| :--- | :--- |
| Cần hiển thị cột dữ liệu từ **Bảng A** và **Bảng B** cùng lúc. | **`JOIN`** |
| Chỉ lấy cột ở **Bảng A**, nhưng mượn **Bảng B** để làm điều kiện lọc/tồn tại. | **`IN`** hoặc **`EXISTS`** |

---

## 4. [B] BENCHMARK (Tiêu chuẩn so sánh)
> **Hỏi:** "Tôi đang so sánh với một số cố định hay một số chưa biết?"

| Nhận diện Yêu cầu | Công cụ sử dụng |
| :--- | :--- |
| So với số/chữ cố định (VD: Lớn hơn 50, Tên là 'John'). | Gõ thẳng vào điều kiện. |
| So với giá trị "phải tính mới ra" (VD: Lớn hơn mức lương *Trung bình* của Cty). | Bắt buộc dùng **`SUBQUERY`** để tính giá trị đó trước. |

---
**Tóm tắt phản xạ:**
1. Nghĩ xem trả ra mấy dòng (**G**).
2. Lọc cá nhân hay lọc tập thể (**F**).
3. Lấy đồ mấy nhà (**R**).
4. So sánh với ai (**B**).
