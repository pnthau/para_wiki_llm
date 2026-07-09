---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [Crawling, Web_Scraping, Jsoup, Java, Tool_Adoption, Dialectical_Thinking]
created: 2026-07-09
updated: 2026-07-09
nexus_version: 8.4
---

# Chiến Lược Web Crawling: Đũa Thần (Black-box) vs Nền Tảng (Fundamentals)

> **Mục tiêu:** Phân tích biện chứng việc lựa chọn công cụ để Crawl dữ liệu web, giúp kỹ sư định hướng học tập và tránh bẫy FOMO (Fear Of Missing Out) trước các repo mã nguồn mở siêu mạnh trên GitHub.

## 🧠 Cornell Notes

| Cue (Gợi nhớ) | Notes (Nội dung chính) |
|---|---|
| **Con đường A: Dùng Đũa Thần (Black-box Repos)** | - **Công cụ đại diện:** Crawl4AI, Firecrawl, Playwright/Puppeteer...<br>- **Ưu điểm:** Cào được mọi trang web (kể cả SPAs, chặn bot), ra kết quả tức thì.<br>- **Nhược điểm (Rủi ro):** Cài đặt cực kỳ cồng kềnh (Docker, Headless Browser), ngốn RAM. Quan trọng nhất: Đây là "hộp đen". Lập trình viên sẽ bị phụ thuộc vào tool mà không hiểu bản chất DOM Tree hay HTTP Request, dễ trượt phỏng vấn tại các công ty yêu cầu nền tảng kỹ sư vững chắc (đặc biệt ở Nhật). |
| **Con đường B: Xây móng bằng tay (Fundamentals)** | - **Công cụ đại diện:** Jsoup (Java), Cheerio, BeautifulSoup.<br>- **Ưu điểm:** Nhẹ gọn, tuân thủ nguyên lý Occam's Razor (Chọn cách đơn giản nhất). Giúp lập trình viên nắm bắt tận gốc lõi của mã nguồn HTML, phân tích cấu trúc DOM và CSS Selectors.<br>- **Nhược điểm:** Không tự động vượt qua được các trang bảo mật cao hoặc full JS ở giai đoạn đầu.<br>- **Lợi ích dài hạn (Đòn bẩy):** Khi đã hiểu "móng nhà" (DOM/HTTP), việc học cách dùng các repo "Đũa Thần" sau này chỉ mất 5 phút đọc tài liệu. |
| **Nguyên lý DiSSS & Lựa chọn công nghệ** | Theo phương pháp Tim Ferriss DiSSS (Nguyên lý Selection 80/20): Hãy ưu tiên 20% kiến thức nền tảng (HTTP/DOM/Jsoup) tạo ra 80% tư duy Kỹ sư thực thụ. Đừng trở thành "thợ gõ code" (script kiddie) chỉ biết tải tool về chạy. |

## 🔄 Tổng kết (Summary)

Sự hấp dẫn của các "siêu công cụ" mã nguồn mở thường làm lu mờ giá trị của việc học nền tảng. Là một Kỹ sư Java định hướng làm việc tại Nhật Bản, bạn phải chọn con đường chậm mà chắc lúc đầu (Tự xây crawler cơ bản bằng Jsoup) để có được cái "Gốc" vững chắc. Công cụ trên GitHub nay sống mai chết, nhưng bản chất giao thức HTTP và cấu trúc DOM thì trường tồn. Hiểu được Gốc, bạn sẽ điều khiển được mọi Công cụ!

## 🔗 Liên kết mở rộng
- [[MOC_IT_Knowledge]]
- [[Java_Learning_Log]]
