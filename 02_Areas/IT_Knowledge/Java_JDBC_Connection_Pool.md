---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [java, jdbc, database, architecture, interview-prep]
created: 2026-06-20
updated: 2026-06-20
---

# Java JDBC: Cạm bẫy Singleton & Cơ chế Connection Pool (Bến xe Grab)

Bản ghi nhớ từ buổi học System Design Database Connection chuẩn bị cho quá trình làm việc tại Nhật Bản.

## 1. Cạm bẫy dùng Singleton cho DB Connection
- **Môi trường học tập:** Thường được dạy tạo 1 `Connection` tĩnh dùng chung bằng Design Pattern Singleton để tiết kiệm bộ nhớ.
- **Môi trường thực tế (Doanh nghiệp):** Đây là **RED FLAG (Lỗi chí mạng)**. 
- **Hậu quả (Race Condition & Data Corruption):** Mọi request của User đều lao vào giật 1 `Connection` duy nhất (giống như 100 nhân viên xài chung 1 cây bút). Giao dịch của User A chưa xong đã bị User B chốt (`commit()`), gây ra chồng chéo và hỏng dữ liệu.

## 2. Giải pháp thực tế: Connection Pool (Hồ chứa kết nối)
- **Cơ chế hoạt động (Minh họa "Bến xe Grab"):**
  - Hệ thống tạo sẵn một số lượng kết nối nhất định (vd: 10 kết nối) nằm chờ sẵn trong RAM ngay từ khi khởi động server.
  - Khi có Request tới, lập tức bốc 1 kết nối ra dùng (không tốn thời gian khởi tạo).
  - Dùng xong, kết nối đó KHÔNG bị ngắt, mà được trả lại vào Pool để phục vụ Request tiếp theo.
- **Xử lý quá tải (Cơ chế Hàng đợi - Queue):**
  - Nếu Pool có sức chứa 10, nhưng có 12 Request tới cùng lúc.
  - 10 Request đầu lấy xe chạy ngay. 2 Request dư ra sẽ bị đưa vào **Phòng chờ (Queue/Block)**.
  - Ngay khi 1 trong 10 xe kia về bến, hệ thống nhét Request thứ 11 lên xe đi tiếp.
  - Hệ thống không bao giờ sập hay hỏng dữ liệu, trừ phi phải đợi quá lâu vượt mức Timeout (văng `Timeout Exception`).
- **Thư viện phổ biến:** HikariCP, c3p0, Tomcat JDBC Pool.
