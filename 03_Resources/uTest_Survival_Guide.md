---
tags: [utest, testing, QA, survival-guide]
created: 2026-07-31
---
# uTest Survival Guide (Bí kíp Thực chiến 80/20)

Tài liệu này tổng hợp những quy tắc "sống còn" để sống sót, kiếm tiền và tránh bị khóa tài khoản trên uTest. 

## 1. Luật Lệ & Bảo Mật (Cực Kỳ Quan Trọng)
Nếu vi phạm các điều này, tài khoản sẽ bị khóa vĩnh viễn:
- **KHÔNG dùng VPN / Proxy / Máy ảo (Emulator) / Máy Jailbreak/Root:** Phải test bằng mạng thật, thiết bị thật (trừ khi có yêu cầu đặc biệt từ dự án).
- **KHÔNG để lọt thông tin cá nhân (GDPR):** 
  - Khi quay màn hình (Screen Record): **Bật chế độ "Không làm phiền" (Do Not Disturb)** để chặn mọi tin nhắn (Zalo, Messenger) nhảy lên màn hình.
  - Tắt Autofill (Điền tự động) trên trình duyệt để không lộ Địa chỉ/Tên thật.
  - Cẩn thận khi gõ Mật khẩu (Nên che mờ bàn phím nếu dự án không bắt buộc quay).
- **KHÔNG làm lộ thông tin dự án:** Tuyệt đối không chia sẻ tên ứng dụng, lỗi hoặc tiền thưởng của dự án ra bên ngoài.
- **Dùng Tiếng Anh 100%:** Trong mọi báo cáo và giao tiếp.

## 2. Bí Kíp Nhận Nhiều Dự Án (Nhiều Việc)
- **Profile:** Khai báo 100% sự thật về thiết bị, nơi ở, dịch vụ đang dùng. Cập nhật ngay khi có máy mới.
- **SRS (Khảo sát yêu cầu đặc biệt):** Check email thường xuyên. Thấy email mời làm Khảo sát (SRS) thì làm ngay và trả lời trung thực. Đây là vé vào cửa của các dự án xịn.
- **Projects Board:** Chủ động lên Bảng dự án để Apply nếu thấy phù hợp.

## 3. Hệ Thống Xếp Hạng & Tiền Thưởng (Rating System)
Rank càng cao, càng được mời nhiều dự án và được cộng thêm % tiền thưởng cho mỗi Bug.
- **Bronze (Top 25%):** +2.5% thưởng
- **Silver (Top 15%):** +5% thưởng
- **Gold (Top 7%):** +10% thưởng
- **"Favorite Tester":** Nếu được Khách hàng "cưng" đánh dấu, bạn được nhận thêm **5%** tiền thưởng vĩnh viễn ở dự án của họ.

**Làm sao để lên Rank? (Chất lượng > Số lượng)**
- Nộp Bug chất lượng cao (Đúng form, mô tả rõ ràng, video/ảnh rõ nét).
- Lỗi bị Reject (Từ chối) sẽ bị trừ điểm. (Ngoại trừ lỗi bị báo là **WAD - Working As Designed** thì không bị trừ).
- Nếu không làm được dự án đã nhận, hãy bấm **Decline** (Từ chối) sớm để nhường chỗ, hệ thống sẽ cộng điểm cho bạn. Đừng nhận rồi bỏ đó.

## 4. Thanh Toán (Payments)
- **Chu kỳ trả lương:** 2 lần/tháng (Ngày 15 và Ngày cuối cùng của tháng). Nếu rơi vào ngày lễ/cuối tuần thì lùi lại ngày làm việc tiếp theo.
- **Cách rút tiền:**
  1. **Direct To Bank (Wise):** Rút thẳng về Ngân hàng Việt Nam (Cần đúng Tên, Số Tài khoản và Mã SWIFT của ngân hàng).
  2. **Payoneer / PayPal:** Liên kết tài khoản bên ngoài vào.
- **Thuế:** uTest không đóng thuế hộ. Bạn tự quản lý việc khai báo thu nhập.

## 5. Từ Vựng Thường Gặp Khi Báo Lỗi
- **WAD (Working As Designed):** Lỗi bị từ chối vì đó là tính năng, app được thiết kế cố tình như vậy.
- **OOS (Out Of Scope):** Lỗi bị từ chối vì bạn test ở khu vực mà Khách hàng không yêu cầu. (Đọc kỹ Scope trước khi test!).
- **DUP (Duplicate):** Lỗi trùng lặp. Đã có người báo trước bạn, hoặc đã nằm trong danh sách Known Issues.
- **Placeholder:** Tuyệt đối cấm tạo Bug nháp (chỉ điền tiêu đề để "xí chỗ" rồi sau đó mới cập nhật video/ảnh). Sẽ bị phạt nặng.
