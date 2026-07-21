# Lịch sử tiến hóa của Database (Từ Cổ đại đến Big Data)

Nhìn lại lịch sử phát triển để hiểu tại sao chúng ta lại dùng SQL và NoSQL ngày nay.

## 1. Thời kỳ đồ đá (Thập niên 1960s - 1970s): Hierarchical & Network Systems
- **Cách hoạt động:** Dữ liệu được lưu theo dạng cây (phân cấp) hoặc mạng lưới chằng chịt trên các siêu máy tính (Mainframe).
- **Nhược điểm chí mạng:** Dữ liệu bị trói chặt vào ổ cứng vật lý (Thiếu Data Abstraction). Nghĩa là nếu bạn muốn thay đổi cách lưu trữ, bạn phải đập bỏ viết lại toàn bộ ứng dụng. Cực kỳ tốn kém và tốn thời gian.

## 2. Kỷ nguyên Hoàng kim (Thập niên 1980s - Nay): Relational Databases (SQL)
- **Cuộc cách mạng:** Đưa ra mô hình "Quan hệ" (Relational) bằng các Bảng (Table).
- **Ưu điểm tuyệt đối:** Tách biệt hoàn toàn việc lưu trữ vật lý với ứng dụng (Program-Data Independence). Ứng dụng chỉ cần gửi câu lệnh SQL (Ngôn ngữ truy vấn cấp cao), phần còn lại Database tự lo. 
- **Kết quả:** Trở thành bá chủ thế giới, ứng dụng trong 90% các hệ thống ngân hàng, doanh nghiệp hiện nay (MySQL, PostgreSQL, Oracle).

## 3. Các nhánh phụ (Niche markets)
- **Object-Oriented DB (OODB - Thập niên 80s):** Cố gắng lưu trữ dữ liệu dưới dạng "Object" (Đối tượng) giống Java/C++. Nhưng quá phức tạp và thiếu chuẩn chung nên không phổ biến, hiện chỉ dùng trong vài ngành kỹ thuật đặc thù.
- **Mở rộng (Thập niên 90s - nay):** Database được độ chế thêm để lưu trữ hình ảnh/video, bản đồ (Spatial DB), khai phá dữ liệu (Data mining), và xuất dữ liệu ra định dạng XML cho thương mại điện tử.

## 4. Kỷ nguyên Big Data (Thập niên 2000s - Nay): NOSQL Databases
- **Bối cảnh:** Sự bùng nổ của Mạng xã hội (Facebook, Twitter) và Cloud sinh ra một lượng dữ liệu KHỔNG LỒ (Big Data) và phi cấu trúc (như bài đăng, tweet, comment).
- **Vấn đề:** RDBMS (SQL) truyền thống không chịu nổi lượng tải dữ liệu khổng lồ và lộn xộn này.
- **Giải pháp:** Ra đời **NoSQL (Not Only SQL)**. Chấp nhận hi sinh một vài quy tắc khắt khe của SQL để đổi lấy tốc độ và khả năng lưu trữ vô hạn. 
- **Thực tế:** Các công ty lớn dùng song song cả 2 (SQL cho tiền bạc, NoSQL cho mạng xã hội).
