# Backup và Recovery (Phòng thủ thảm họa hệ thống)

Trong các dự án thực tế lớn, kỹ sư luôn "mặc định" là server sẽ sập, và họ dùng 4 kỹ thuật phòng thủ:

## 1. Mức độ Vật lý: RAID
Nhân bản ổ cứng. Chạy song song nhiều ổ cứng (VD: RAID 1). Nếu ổ cứng A cháy, hệ thống tự động đọc từ ổ B mà ứng dụng không hề hay biết, không có thời gian chết (Downtime).

## 2. Mức độ Máy chủ: Replication (Master-Slave)
Có 2 máy chủ ở 2 khu vực địa lý khác nhau (VD: 1 ở Tokyo, 1 ở Osaka). Dữ liệu được ghi vào Master sẽ lập tức sao chép qua mạng sang Slave. Nếu Master nổ tung, tự động chuyển hướng (Failover) sang Slave chạy tiếp.

## 3. Mức độ Dữ liệu: Cỗ máy thời gian (PITR)
- **Point-in-Time Recovery (PITR):** Khi bị xóa nhầm dữ liệu. Hệ thống sẽ lấy bản **Backup** cũ, sau đó cho chạy **File Log (Nhật ký giao dịch)** để lặp lại (Redo/Roll-forward) toàn bộ các thao tác đến đúng khoảnh khắc trước khi sự cố xảy ra.
- *Lưu ý:* File Backup và File Log thường được đặt ở 2 ổ cứng vật lý hoàn toàn khác nhau để tránh rủi ro cháy chung.

## 4. Mức độ Trung tâm dữ liệu: Cloud Backup
Toàn bộ Backup và Log mỗi đêm được đẩy lên Đám mây (AWS, Google Cloud) ở quốc gia khác để phòng ngừa động đất/thiên tai phá hủy toàn bộ trung tâm dữ liệu cục bộ.
