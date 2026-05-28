# 🛠️ Hướng dẫn Bật tính năng Tự khởi động máy (Hardware Level)

Để hệ thống Nexus có thể tự bật máy từ trạng thái **Tắt hoàn toàn (Shut down)**, John cần thực hiện cài đặt trong BIOS/UEFI của máy tính.

### 📍 Các bước thực hiện:

1. **Vào BIOS**: Khởi động lại máy và nhấn liên tục phím `F2`, `Del`, hoặc `F10` (tùy dòng máy) khi màn hình vừa hiện logo.
2. **Tìm mục Power Management**: 
   - Di chuyển đến tab **Advanced** hoặc **Power**.
   - Tìm dòng có tên: **"Resume by RTC Alarm"**, **"Power On By RTC"**, hoặc **"Wake up on Alarm"**.
3. **Cài đặt thời gian**:
   - Chuyển trạng thái sang **[Enabled]**.
   - **RTC Alarm Date**: Chọn `Everyday` (Hàng ngày).
   - **RTC Alarm Time**: Cài đặt là **11:55:00** (Trước giờ Nexus chạy 5 phút).
4. **Lưu và Thoát**: Nhấn `F10` -> `Yes`.

---

### 🛡️ Cơ chế Bảo vệ của Nexus:
Script của tôi đã được nâng cấp. Nếu máy tự bật nhưng **không cắm sạc** (đang trong balo/túi xách), tôi sẽ:
1. Nhận diện trạng thái Pin.
2. Tự động dừng mọi hoạt động.
3. Tắt máy ngay lập tức để bảo vệ phần cứng.

**Hệ thống chỉ tiến hóa khi có nguồn điện ổn định.**
