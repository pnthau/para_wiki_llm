# Khi nào KHÔNG nên dùng Hệ quản trị CSDL (DBMS)?

Mặc dù DBMS rất mạnh mẽ, nhưng nó giống như một con "dao mổ trâu". Không phải lúc nào vác dao mổ trâu đi giết gà cũng tốt, vì DBMS mang theo những **chi phí chìm (Overhead costs)** rất lớn:
1. Chi phí bản quyền, phần cứng và đào tạo đắt đỏ.
2. Phải gánh thêm các chức năng dư thừa (Bảo mật, Backup, Concurrency) làm giảm tốc độ xử lý cơ bản.

## Các trường hợp "Nói KHÔNG" với DBMS
1. **Ứng dụng quá đơn giản, tĩnh và không có nhu cầu mở rộng.** (Dùng file `.txt` hoặc `.json` là đủ).
2. **Hệ thống nhúng (Embedded systems) có dung lượng cực thấp.** (Ví dụ: Đồng hồ thông minh, máy giặt - cài một cái MySQL nặng hàng GB vào đó là điều không tưởng).
3. **Yêu cầu Real-time (Thời gian thực) cực kỳ khắt khe.** Các hệ thống định tuyến mạng viễn thông hoặc phần mềm vẽ đồ họa 3D (CAD) thường tự viết công cụ lưu trữ riêng của họ để có tốc độ phản hồi tính bằng micro-giây, vì thông qua DBMS sẽ bị trễ.
4. **Ứng dụng chỉ có ĐÚNG 1 USER (Single-user).** Không có tranh chấp dữ liệu thì không cần DBMS đứng ra phân xử.
