---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [java, jdbc, database, architecture, stored-procedure, interview-prep]
created: 2026-06-20
updated: 2026-06-20
---

# Java JDBC: CallableStatement & Bản chất Stored Procedure

Bản ghi nhớ về kỹ thuật tối ưu hóa Database bằng Stored Procedure và cách triệu gọi từ Java.

## 1. Stored Procedure là gì?
- **Bản chất:** Là các đoạn mã SQL (chứa cả logic IF-ELSE, Vòng lặp) được viết và **biên dịch sẵn (Pre-compiled)** lưu trực tiếp dưới ổ cứng của Database.
- **Vai trò:** Hoạt động như một "Món ăn nấu sẵn". Khi Java gọi đến, Database không cần tốn thời gian biên dịch (Compile) lại câu lệnh SQL, giúp **tốc độ truy vấn tăng lên mức cực hạn**.

### Phân biệt Function và Procedure (Câu hỏi phỏng vấn)
| Đặc điểm | Function (Hàm) | Procedure (Thủ tục) |
| :--- | :--- | :--- |
| **Mục đích** | Dùng để tính toán toán học/chuỗi. | Dùng để thực thi một quy trình logic nghiệp vụ. |
| **Giá trị trả về** | **Bắt buộc** trả về đúng 1 giá trị. | **Không bắt buộc**. Có thể trả về 0, 1 hoặc nhiều giá trị. |
| **Tham số** | Chỉ hỗ trợ tham số đầu vào (IN). | Hỗ trợ cả IN (Đầu vào), OUT (Đầu ra), INOUT. |

## 2. CallableStatement là gì?
Là một Interface đặc biệt trong JDBC **chỉ chuyên dùng để kích hoạt Stored Procedure**. Cú pháp bắt buộc phải nằm trong cặp ngoặc nhọn `{}`:
`String sql = "{call ten_procedure(?, ?)}";`

## 3. Quy trình 5 bước thao tác với Tham số (IN & OUT)
Điểm "ăn tiền" nhất của `CallableStatement` là khả năng sử dụng tham số `OUT` để móc chiến lợi phẩm từ Database ra Java.

```java
// Bước 1: Chuẩn bị lệnh gọi
String sql = "{call getTenSV (?, ?)}"; 
CallableStatement stmt = conn.prepareCall(sql);

// Bước 2: Nạp đạn cho tham số IN (Dấu ? thứ nhất)
stmt.setInt(1, 2); 

// Bước 3: Đăng ký kiểu dữ liệu cho tham số OUT (Dấu ? thứ hai) - BẮT BUỘC
stmt.registerOutParameter(2, java.sql.Types.VARCHAR);

// Bước 4: Thực thi Procedure
stmt.execute();

// Bước 5: Lấy kết quả từ hố OUT
String tenSV = stmt.getString(2);
```

### 🚨 Tại sao BẮT BUỘC phải có `registerOutParameter`?
Java là ngôn ngữ **Strongly Typed** (Định kiểu tĩnh nghiêm ngặt), không bao giờ tự đoán mò dữ liệu. 
Lệnh `registerOutParameter` giúp xin cấp phát trước một vùng dung lượng RAM trống vừa khít với kiểu dữ liệu trả về (VD: 4 Bytes cho INT, hoặc 255 Bytes cho VARCHAR). Bỏ qua bước này sẽ lập tức gây ra lỗi `SQLException: Parameter X is not registered as an output parameter`.
