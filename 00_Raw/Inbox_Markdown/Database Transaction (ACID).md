# Database Transaction (Giao dịch)

| Khái niệm | Định nghĩa thực tế (Bản chất) |
|---|---|
| **Transaction (Giao dịch)** | Tập hợp các thao tác. Có tính **Atomicity (Nguyên tử)**: "Thành công tất cả hoặc không có gì". |
| **ROLLBACK (Hoàn tác)** | Cơ chế tự động đảo ngược dữ liệu về trạng thái cũ nếu Transaction đang chạy thì gặp lỗi (sập nguồn). |
| **COMMIT (Chốt)** | Ghi nhận dữ liệu vĩnh viễn (bền vững) xuống ổ cứng sau khi Transaction chạy thành công 100%. |
