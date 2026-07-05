---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [java, enum, best-practices, clean-code]
created: 2026-07-06
updated: 2026-07-06
nexus_version: 8.4
---
# Java Enum Fundamentals & Best Practices

## 1. Cues / Key Questions
- Tại sao dùng Enum thay vì String Hardcode?
- Làm sao để gán giá trị (ví dụ chữ tiếng Việt) vào Enum?
- Hàm `fromString` hoạt động như thế nào để map dữ liệu an toàn?

## 2. Notes
### 2.1. Bản chất của Enum
- Enum là "Danh sách các sự lựa chọn chốt cứng". 
- **Lợi ích 80/20**: Triệt tiêu lỗi gõ sai chính tả (Type Safety). Khi báo lỗi, Java báo ngay lúc compile thay vì lúc runtime. Khắc phục dứt điểm tình trạng gửi dữ liệu lộn xộn từ Client.

### 2.2. Enum Constructor (Nhét giá trị hiển thị)
Để một mã code tiếng Anh chứa dữ liệu hiển thị (ví dụ tiếng Việt), ta thiết lập Constructor:
```java
public enum OrderStatus {
    CANCELLED("Đã hủy"); // Nhét giá trị vào túi
    
    private final String value; // Khai báo túi chứa
    
    OrderStatus(String value) { // Khóa kéo để nhét dữ liệu lúc khởi tạo
        this.value = value;
    }

    public String getValue() { return value; } // Hàm lấy dữ liệu
}
```

### 2.3. Hàm `fromString` (Người gác cổng)
Bảo vệ hệ thống khỏi các chuỗi lạ từ Frontend hoặc Database ném vào.
```java
public static OrderStatus fromString(String text) {
    if (text == null) return null;
    for (OrderStatus status : OrderStatus.values()) {
        // Cửa 1: Khớp mã tiếng Anh (CANCELLED) || Cửa 2: Khớp tiếng Việt (Đã hủy)
        if (status.name().equalsIgnoreCase(text.trim()) || status.value.equalsIgnoreCase(text.trim())) {
            return status;
        }
    }
    return null; // Trả về null nếu cố tình truyền mã không hợp lệ
}
```

## 3. Summary
Thay thế String bằng Enum là cốt lõi của Kiến trúc Java (Clean Code). Cơ chế `fromString` kết hợp toán tử `||` (hoặc) cho phép hệ thống vừa bảo mật dữ liệu đầu vào, vừa tương thích ngược với Database cũ, giúp chuyển đổi hệ thống mà không vỡ logic.
