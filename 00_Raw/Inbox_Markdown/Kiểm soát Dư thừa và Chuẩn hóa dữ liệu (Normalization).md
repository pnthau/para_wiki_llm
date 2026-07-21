# Kiểm soát Dư thừa và Chuẩn hóa dữ liệu (Normalization)

## Khái niệm
Lưu trữ dư thừa (Redundancy) dữ liệu ở nhiều nơi trong hệ thống sẽ lãng phí ổ cứng, nhưng nguy hiểm nhất là dẫn đến **Bất đồng bộ dữ liệu (Inconsistency / Update Anomaly)**. 
- *Ví dụ:* Nếu lưu `TenKhach` ở cả bảng `KhachHang` và bảng `HopDong`, khi khách đổi tên, nếu code lỡ quên cập nhật ở 1 trong 2 bảng thì hệ thống sẽ sai lệch.

## Giải pháp: Chuẩn hóa (Normalization)
Cơ sở dữ liệu quan hệ giải quyết vấn đề này bằng cách:
- Chỉ lưu thông tin chính tại đúng 1 nơi (Bảng `KhachHang`).
- Ở bảng khác (như `HopDong`), chỉ lưu **Khóa ngoại (ID)** của khách hàng (VD: `KH-001`). 
- Khi cần thông tin, Database sẽ dùng kỹ thuật **JOIN** để móc nối dữ liệu lại với nhau một cách an toàn.
