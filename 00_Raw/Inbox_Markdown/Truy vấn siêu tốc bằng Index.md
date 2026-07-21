# Truy vấn siêu tốc bằng Index (Chỉ mục)

## Vấn đề nếu không có Index
Khi cần tìm kiếm một bản ghi trong hàng triệu bản ghi, nếu không có Index, Database buộc phải đọc tuần tự từ đầu đến cuối (gọi là **Full Table Scan**). Quá trình này mất thời gian tỷ lệ thuận với lượng dữ liệu **O(n)**.

## Sức mạnh của Index
- Index hoạt động giống như **Mục lục chữ cái** ở cuối cuốn từ điển.
- Trong các RDBMS, Index thường được cấu trúc dưới dạng cây **B-Tree**, giúp tốc độ tìm kiếm đạt **O(log n)**.
- Một số loại cấu trúc khác như Hash Index có thể đạt đến tốc độ **O(1)**.
- Nhờ Index, Database có thể tìm ra dữ liệu trong nháy mắt thay vì làm đứng hình cả hệ thống.
