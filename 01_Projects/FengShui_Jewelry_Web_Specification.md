# 📝 ĐẶC TẢ YÊU CẦU DỰ ÁN (SPECIFICATION)
## WEB BÁN TRANG SỨC PHONG THỦY CHO NGƯỜI TRUNG NIÊN & LỚN TUỔI

---

### 1. Thông tin chung
- **Dòng sản phẩm chủ đạo:** Trang sức đeo trên người (vòng tay, dây chuyền, nhẫn, bông tai) làm từ **đá tự nhiên** và **vàng non**.
- **Khách hàng mục tiêu:** Người trung niên và người lớn tuổi (ưu tiên trải nghiệm đơn giản, chữ to rõ ràng, hình ảnh thực tế, dễ thao tác).

---

### 2. Các trang chức năng chính (Site Map)
1. **Trang chủ:** Banner tối giản sang trọng, giới thiệu sản phẩm nổi bật, cam kết chất lượng (đá thật, vàng thật) và nút liên hệ Hotline/Zalo nổi bật.
2. **Trang danh mục sản phẩm:** Phân loại sản phẩm theo loại trang sức hoặc theo Mệnh phong thủy.
3. **Trang chi tiết sản phẩm:** Hình ảnh lớn phóng to được, mô tả chất liệu, ý nghĩa phong thủy, video thực tế sản phẩm và Form mua nhanh.
4. **Trang chia sẻ kiến thức (Blog):** Các bài viết tư vấn phong thủy, hướng dẫn bảo quản trang sức.

---

### 3. Các tính năng đặc thù (Key Features)
- **Tối ưu hóa UI cho người lớn tuổi:** Thiết kế trực quan, font chữ lớn, bố cục thoáng đãng, hạn chế các hiệu ứng chuyển động phức tạp.
- **Form đặt hàng siêu tốc (Mua nhanh):** Khách hàng chỉ cần nhập **[Họ tên]** và **[Số điện thoại]** để nhân viên gọi lại tư vấn trực tiếp, bỏ qua luồng giỏ hàng thanh toán rườm rà.
- **Tìm kiếm bằng giọng nói (Voice Search):** Tích hợp nút Micro trên thanh tìm kiếm sử dụng công nghệ Web Speech API có sẵn của trình duyệt.
- **Lọc sản phẩm theo Cung Mệnh:** Phân loại sản phẩm trực quan theo Kim, Mộc, Thủy, Hỏa, Thổ.
- **Công cụ tra cứu mệnh theo Năm sinh:** Cho phép nhập năm sinh dương lịch để tự động tính ra mệnh phong thủy và chuyển hướng đến danh mục sản phẩm tương ứng.
- **Nhúng video YouTube:** Hỗ trợ nhúng video quay cận cảnh sản phẩm hoặc video hướng dẫn vào bài viết và trang chi tiết sản phẩm.

---

### 4. Đặc tả kỹ thuật lưu trữ (Technical Specification)
- **Quản lý Giỏ hàng:** Lưu trữ hoàn toàn ở phía client (trình duyệt của khách hàng) bằng `localStorage` để tương thích tốt trên mọi thiết bị di động (Mobile) và máy tính, giúp cơ sở dữ liệu tinh giản tối đa.
- **Lưu trữ hình ảnh sản phẩm:** Sử dụng dịch vụ đám mây **Cloudinary hoặc Firebase Storage**.
  - Khi Admin thêm mới/sửa sản phẩm và tải ảnh lên, hệ thống sẽ upload ảnh trực tiếp lên Cloud.
  - Database chỉ lưu trữ đường link tuyệt đối (URL HTTPS, ví dụ: `https://res.cloudinary.com/...`) do Cloud cung cấp.
  - *Lợi ích:* Tránh phình to dung lượng Database, giảm tải đọc ghi file cho Tomcat Server, và không lo mất ảnh khi redeploy dự án trên máy local.

