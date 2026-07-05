---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [java, servlet, jsp, debugging, ui]
created: 2026-07-06
updated: 2026-07-06
nexus_version: 8.4
---
# JSP/Servlet: Data Loss During Exception Forwarding

## 1. Cues / Key Questions
- Tại sao khi Controller ném `RuntimeException` (lỗi nghiệp vụ), giao diện JSP lại bị sập hoặc biến mất dữ liệu mảng?
- Làm sao để giữ lại trạng thái giao diện nguyên vẹn khi hiển thị thông báo lỗi?

## 2. Notes
### 2.1. Hiện tượng (The Bug)
Trong một phương thức doPost update (ví dụ cập nhật trạng thái đơn hàng), nếu xảy ra sự cố (hết hàng) dẫn đến ném ra `RuntimeException`. 
Nếu Controller `catch` lỗi đó và thực hiện lệnh `forward` trở lại trang chi tiết `order_list.jsp` nhưng lại **chỉ nạp mỗi biến thông báo lỗi `error`** mà **bỏ quên các biến dữ liệu khác** (ví dụ danh sách sản phẩm `items`)... thì hậu quả là thẻ `<c:forEach items="${items}">` trên JSP sẽ lặp qua một mảng rỗng. Giao diện bảng danh sách sẽ biến mất hoàn toàn.

### 2.2. Giải pháp (The Fix)
Lệnh `forward` sẽ dùng một request trống (không có dữ liệu khởi tạo của hàm `doGet`). Do đó, trước khi gọi `forward`, ta **BẮT BUỘC** phải lấy lại (re-fetch) TOÀN BỘ dữ liệu thiết yếu của trang đó.

```java
} catch (RuntimeException e) {
    // 1. Phục hồi lại dữ liệu nền của giao diện
    Order order = orderService.findByID(id);
    List<OrderItem> items = orderService.findItemsByOrderID(id); // Dòng tối quan trọng thường bị quên
    
    // 2. Nạp vào request
    request.setAttribute("error", e.getMessage()); // Biến báo lỗi
    request.setAttribute("order", order);
    request.setAttribute("items", items); // Khôi phục mảng cho JSP
    
    // 3. Render lại
    request.getRequestDispatcher("/WEB-INF/views/admin/order_list.jsp").forward(request, response);
}
```

## 3. Summary
Lỗi mất cấu trúc giao diện khi báo lỗi Servlet thường xuất phát từ việc luồng `catch` quên tái tạo lại các biến request attributes (`setAttribute`). Tư duy đúng là: "Bất cứ khi nào gọi forward, hãy tự hỏi trang JSP đích cần bao nhiêu biến để hiển thị trọn vẹn?"
