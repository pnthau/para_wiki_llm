# Ràng buộc Toàn vẹn (Integrity Constraints)

## Định nghĩa
Database không chỉ là nơi chứa dữ liệu vô tri, mà còn là một **"người gác cổng"** khó tính. Nó bắt buộc dữ liệu khi ghi vào ổ cứng phải thỏa mãn các quy tắc logic thực tế (Business Rules).

## Các loại Ràng buộc phổ biến
1. **CHECK Constraint:** Kiểm tra điều kiện (Ví dụ: Tuổi phải lớn hơn 0).
2. **Foreign Key (Khóa ngoại):** Bắt buộc dữ liệu phải có liên kết thật (Ví dụ: Lập hợp đồng cho một Khách hàng thì ID khách hàng đó phải TỒN TẠI trong hệ thống).
3. **Unique Constraint:** Đảm bảo không trùng lặp (Ví dụ: Mỗi người chỉ có 1 CCCD).

## Lợi ích
Nếu ứng dụng (Java, Mobile) vô tình đẩy dữ liệu sai xuống, Database sẽ là **bức tường lửa cuối cùng**, chặn lại và ném lỗi (Exception) ngược về cho ứng dụng để bảo vệ tính toàn vẹn của hệ thống.
