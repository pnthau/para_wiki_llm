# Schema Markup là gì? (Góc nhìn dành cho Java Developer)

---

## 1. Khái niệm cơ bản
**Schema Markup** (hay Dữ liệu có cấu trúc - Structured Data) là một đoạn code được thêm vào website nhằm giúp các công cụ tìm kiếm (Google, Bing) và các mô hình AI (Gemini, ChatGPT) hiểu chính xác nội dung và ngữ nghĩa của trang web, thay vì phải tự "đoán mò" từ văn bản HTML thông thường.

---

## 2. Phép tương tự trực quan (Java Analogy)

Hãy tưởng tượng bạn đang viết một chương trình Java để quản lý các cửa hàng:

### Cách Google đọc trang web thông thường (Không có Schema):
Google bot giống như một thuật toán parse chuỗi văn bản tự do (String parsing). Nó phải tự tách từ (split), phân tích cú pháp để đoán xem đâu là tên cửa hàng, đâu là địa chỉ:
```java
String webContent = "Chào mừng đến với Cửa Cuốn Đắk Nông. Chúng tôi ở địa chỉ 123 đường 23/3, Gia Nghĩa. Số điện thoại liên hệ là 0912345678.";
// Google bot phải dùng Regex hoặc AI để đoán:
// Tên cửa hàng = "Cửa Cuốn Đắk Nông"?
// Địa chỉ = "123 đường 23/3, Gia Nghĩa"?
```
-> Cách này rất dễ sai sót hoặc không chính xác 100%.

### Cách Google đọc trang web có Schema Markup:
Schema Markup giống như việc bạn truyền một đối tượng **JSON** được map trực tiếp từ một Class được chuẩn hóa toàn cầu (do schema.org định nghĩa):

```java
// Định nghĩa thực thể doanh nghiệp địa phương
class LocalBusiness {
    String name = "Cửa Cuốn Đắk Nông";
    String address = "123 đường 23/3, Nghĩa Trung, Gia Nghĩa, Đắk Nông";
    String telephone = "0912345678";
    GeoCoordinates geo = new GeoCoordinates(12.0012, 107.6845); // Tọa độ GPS chính xác
}
```

Khi bạn cài đặt Schema, bạn nhúng đoạn code JSON-LD (JSON for Linking Data) này vào trong mã nguồn HTML của trang web. Google và AI chỉ việc Parse đoạn JSON này ra Object và sử dụng ngay lập tức mà không sợ nhầm lẫn.

---

## 3. Đoạn mã Schema mẫu thực tế (JSON-LD)

Dưới đây là đoạn mã Schema thực tế dành cho dịch vụ cửa cuốn tại Đắk Nông. Đoạn mã này được đặt trong thẻ `<script type="application/ld+json">` ở phần `<head>` của trang web:

```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Cửa Cuốn Đắk Nông - [Tên Thương Hiệu]",
  "image": "https://website-cua-cuon.com/images/showroom.jpg",
  "telephone": "0912345678",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "123 Đường 23/3, Nghĩa Trung",
    "addressLocality": "Gia Nghĩa",
    "addressRegion": "Đắk Nông",
    "addressCountry": "VN"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": 12.001243,
    "longitude": 107.684521
  },
  "url": "https://website-cua-cuon.com",
  "priceRange": "$$",
  "openingHoursSpecification": {
    "@type": "OpeningHoursSpecification",
    "dayOfWeek": [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ],
    "opens": "07:00",
    "closes": "21:00"
  }
}
```

---

## 4. Tại sao Schema Markup giúp bạn lên Top Google & AI?

1.  **Hiển thị kết quả giàu tính năng (Rich Snippets)**: Giúp trang web của bạn hiển thị thêm số điện thoại, đánh giá sao, bảng giá ngay trên kết quả tìm kiếm Google, làm tăng tỷ lệ người dùng click vào web (CTR).
2.  **Định vị Local SEO cực mạnh**: Bằng cách khai báo tọa độ GPS (`geo`), Google Maps sẽ dễ dàng xác nhận thực thể doanh nghiệp của bạn đang ở khu vực Đắk Nông.
3.  **Thức ăn chất lượng cao cho AI**: Các công cụ tìm kiếm AI (Gemini, ChatGPT) sử dụng dữ liệu có cấu trúc để trả lời nhanh cho người dùng. Trang web nào có Schema chuẩn sẽ được AI ưu tiên quét dữ liệu và trích xuất thông tin để đề xuất.
