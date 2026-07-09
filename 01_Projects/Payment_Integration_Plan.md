---
domain: Java_Web
type: project-plan
status: active
tags: [payment, vnpay, ecommerce, plan]
created: 2026-07-06
updated: 2026-07-06
nexus_version: 8.4
---

# Kế hoạch Tích hợp Thanh toán VNPay cho FengShui Jewelry

## 1. Cues (Manh mối & Mục tiêu)
- **Hiện trạng:** Hệ thống hiện tại chỉ lưu trạng thái giao hàng (`status`), mặc định là thanh toán tiền mặt khi nhận hàng (COD). Hoàn toàn không có chức năng thanh toán online và theo dõi dòng tiền.
- **Mục tiêu:** Bổ sung thanh toán VNPay và COD, cho phép người dùng chọn lựa ở màn hình Checkout, đồng thời nâng cấp Database để lưu trạng thái thanh toán riêng biệt.

## 2. Notes (Nội dung chi tiết)

### Giai đoạn 1: Mở rộng Database & Entity
1. **Database (`orders` table)**:
   - Thêm cột `payment_method` (Kiểu Enum: `CASH`, `TRANSFER`, `VNPAY`).
   - Thêm cột `payment_status` (Kiểu Enum: `UNPAID`, `PAID`, `REFUNDED`).
2. **Entity (`Order.java`)**:
   - Khai báo thêm 2 thuộc tính `paymentMethod` và `paymentStatus` ánh xạ với DB.
   - Bắt buộc tạo 2 file Enum Java (Anti-typo) để đảm bảo toàn vẹn dữ liệu.

### Giai đoạn 2: Nâng cấp Giao diện Checkout
1. **`checkout.jsp` / `quick_order.jsp`**:
   - Thêm lựa chọn Phương thức thanh toán (COD hoặc VNPay).
2. **`OrderController` / `QuickOrderController`**:
   - Đón tham số `paymentMethod`. Nếu là `COD`, lưu `paymentStatus = UNPAID` và chuyển sang trang cảm ơn.
   - Nếu là `VNPAY`, lưu `paymentStatus = UNPAID` và chuẩn bị gọi Giai đoạn 3.

### Giai đoạn 3: Tích hợp Cổng thanh toán VNPay (Sandbox)
1. **Tạo URL Thanh toán (Payment Controller)**:
   - Viết hàm băm thông tin đơn hàng (Tổng tiền, Mã ĐH) bằng Secret Key của VNPay Sandbox.
   - Chuyển hướng người dùng (Redirect) sang trang quét mã QR của VNPay.
2. **Đón kết quả (Return/IPN URL)**:
   - Viết API `/vnpay/return` để nhận thông báo từ VNPay sau khi khách trả tiền xong.
   - Xác thực chữ ký (Hash) từ VNPay. Nếu hợp lệ, tự động `update payment_status = PAID`.

## 3. Summary (Tổng hợp & Đúc kết)
- Thay vì tự xây dựng luồng giao dịch thẻ rủi ro cao, dự án sử dụng nguyên lý Occam's Razor: Đẩy việc thanh toán cho Cổng bên thứ 3 (VNPay).
- Triển khai theo chiến thuật Micro-Raids, bắt đầu bằng việc chuẩn hóa DB và Entity để lưu trữ các trạng thái, sau đó mới tiến hành kết nối API.
