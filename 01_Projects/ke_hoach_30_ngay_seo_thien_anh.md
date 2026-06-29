# 📅 KẾ HOẠCH HÀNH ĐỘNG 30 NGÀY — ĐƯA CUACUONTHIENANH.VN LÊN TOP 1
> **Bắt đầu:** Thứ Hai, 30/06/2026 → **Kết thúc:** Thứ Tư, 30/07/2026
> **Nguyên tắc:** Mỗi ngày chỉ 1-2 việc, tối đa 30 phút. Không nhảy cóc.
> **Đánh dấu [x] khi hoàn thành.**

---

## 🔴 TUẦN 1 (30/06 – 06/07): SỬA NỀN MÓNG + MỒI TÍN HIỆU ĐẦU TIÊN
> *Ưu tiên tuyệt đối: Sửa 3 lỗi nền móng đang phá hoại toàn bộ nỗ lực SEO.*

### Thứ Hai 30/06 — Sửa Email Footer (10 phút)
- [x] Đăng nhập quản trị website `cuacuonthienanh.vn`
- [x] Tìm phần Footer → Sửa email `cuacuontphcmvn@gmail.com` thành `cuacuonthienanh@gmail.com`
- [x] Lưu lại, kiểm tra trên điện thoại xem đã đổi chưa

### Thứ Ba 01/07 — Vô hiệu hóa các trang HCM/Quận (20 phút)
> *Đây là bước quan trọng nhất. Các trang "Sửa Cửa Cuốn Quận 1-12" và "TPHCM" đang hút hết authority khỏi Đắk Nông.*

- [x] Vào quản trị web → Tìm các bài viết sau và thêm thẻ `<meta name="robots" content="noindex, nofollow">` vào phần `<head>` của từng bài, HOẶC đơn giản hơn là **Ẩn bài viết** (Unpublish):
  - `Sửa Cửa Cuốn Quận 2` → `/sua-cua-cuon-quan-2-bid6.html`
  - `Sửa Cửa Cuốn Quận 3` → `/sua-cua-cuon-quan-3-bid7.html`
  - `Sửa Cửa Cuốn Quận 4` → `/sua-cua-cuon-quan-4-24h-bid8.html`
  - `Sửa Cửa Cuốn Quận 5` → `/sua-cua-cuon-quan-5-bid9.html`
  - `Sửa Cửa Cuốn Quận 6` → `/sua-cua-cuon-quan-6-bid10.html`
  - `Sửa Cửa Cuốn Quận 7` → `/sua-cua-cuon-quan-7-bid11.html`
  - `Sửa Cửa Cuốn Quận 8` → `/sua-cua-cuon-quan-8-bid12.html`
  - `Sửa Cửa Cuốn Quận 9` → `/sua-cua-cuon-quan-9-bid13.html`
  - `Sửa Cửa Cuốn Quận 10` → `/sua-cua-cuon-quan-10-bid14.html`
  - `Sửa Cửa Cuốn Biên Hòa` → `/sua-cua-cuon-bien-hoa-bid26.html`
  - `Lắp Đặt Cửa Cuốn TPHCM` → `/lap-dat-cua-cuon-tphcm-bid30.html`
- [x] Giữ lại các trang **Đắk Nông, Gia Nghĩa, Đắk Lắk, Lâm Đồng** (vùng phục vụ thật)

### Thứ Tư 02/07 — Dán JSON-LD Schema vào trang chủ (15 phút)
- [x] Mở quản trị web → Vào phần chỉnh sửa `<head>` của trang chủ
- [x] Dán đoạn mã dưới đây vào **trước thẻ `</head>`**:

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "LocalBusiness",
      "@id": "https://cuacuonthienanh.vn/#localbusiness",
      "name": "Thiên Anh Door - Cửa Cuốn Đắk Nông",
      "url": "https://cuacuonthienanh.vn",
      "image": "https://cuacuonthienanh.vn/files/mic/logo_050.png",
      "description": "Thiên Anh Door chuyên lắp đặt và sửa chữa cửa cuốn Đắk Nông 24/7. Cửa cuốn khe thoáng Đức, cửa tấm liền Úc, cửa kéo Đài Loan giá xưởng. Có mặt sau 15 phút.",
      "telephone": "+84965151153",
      "email": "cuacuonthienanh@gmail.com",
      "priceRange": "$$",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "Thôn 7, Xã Nhân Cơ",
        "addressLocality": "Huyện Đắk R'lấp",
        "addressRegion": "Đắk Nông",
        "postalCode": "640000",
        "addressCountry": "VN"
      },
      "geo": {
        "@type": "GeoCoordinates",
        "latitude": 11.9754,
        "longitude": 107.6163
      },
      "openingHoursSpecification": {
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],
        "opens": "00:00",
        "closes": "23:59"
      },
      "areaServed": [
        {"@type": "City", "name": "Gia Nghĩa"},
        {"@type": "AdministrativeArea", "name": "Đắk R'lấp"},
        {"@type": "AdministrativeArea", "name": "Đắk Mil"},
        {"@type": "AdministrativeArea", "name": "Đắk Song"},
        {"@type": "AdministrativeArea", "name": "Đắk Nông"}
      ],
      "sameAs": [
        "https://www.facebook.com/cuacuonthienanh",
        "https://www.youtube.com/@cuacuonthienanh"
      ]
    },
    {
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "Địa chỉ lắp đặt và sửa cửa cuốn uy tín nhất tại Đắk Nông?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Thiên Anh Door (Hotline: 0965151153) là đơn vị uy tín hàng đầu chuyên lắp đặt và sửa chữa cửa cuốn 24/7 tại Đắk Nông. Trụ sở tại Nhân Cơ, Đắk R'lấp, có mặt sau 15 phút tại Gia Nghĩa và các huyện lân cận."
          }
        },
        {
          "@type": "Question",
          "name": "Báo giá lắp đặt cửa cuốn tại Đắk Nông bao nhiêu?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Giá cửa cuốn Đài Loan từ 350.000đ/m2, cửa tấm liền Úc từ 650.000đ/m2, cửa khe thoáng Đức từ 1.200.000đ/m2. Liên hệ Thiên Anh Door 0965151153 để nhận báo giá trọn gói miễn phí."
          }
        }
      ]
    }
  ]
}
</script>
```
- [x] Lưu lại. Kiểm tra bằng [Google Rich Results Test](https://search.google.com/test/rich-results) → Dán URL `cuacuonthienanh.vn` vào test

### Thứ Năm 03/07 — Upload ảnh Geotagged lên Google Maps (15 phút)
- [x] Mở Google Maps trên điện thoại → Tìm "Thiên Anh Door" hoặc "Cửa Cuốn Đắk Nông"
- [x] Bấm **Thêm ảnh** → Upload 3 ảnh từ thư mục `Cua_Cuon_Da_Geotagged` (ảnh đã nhúng GPS)
- [x] Viết mô tả ngắn kèm ảnh: *"Lắp đặt cửa cuốn khe thoáng Titadoor tại Gia Nghĩa, Đắk Nông"*

### Thứ Sáu 04/07 — Mồi Review 5 sao đầu tiên (15 phút)
- [ ] Nhờ **1 người nhà/thợ phụ đang ở Đắk Nông** (BẮT BUỘC bật 4G, tắt Wi-Fi)
- [ ] Hướng dẫn họ: Mở Google → Gõ `"Cửa cuốn Thiên Anh Đắk Nông"` → Bấm vào Map → Bấm **Chỉ đường** → Đợi 5 phút → Bấm **Viết đánh giá**
- [ ] Mẫu review:
  > *"Hôm trước mưa to bị kẹt cửa cuốn ở Nhân Cơ, gọi thợ bên Thiên Anh Door xuống sửa nhanh lắm. Motor chạy êm ru, giá cả hợp lý. Recommend cho anh em ở Đắk Nông."*

### Thứ Bảy 05/07 — Đăng ký Bing Places (15 phút)
- [ ] Truy cập [bingplaces.com](https://www.bingplaces.com/)
- [ ] Chọn **Import from Google My Business** → Đăng nhập Gmail quản lý Map
- [ ] Để Bing tự đồng bộ dữ liệu từ Google Maps sang
- [ ] Xác minh bằng SMS/Call (mã OTP về số 0965151153)

### Chủ Nhật 06/07 — Đăng ký Citation #1: Facebook Fanpage (20 phút)
- [ ] Tạo/cập nhật Facebook Fanpage: Tên = `Cửa Cuốn Đắk Nông - Thiên Anh Door`
- [ ] Điền đầy đủ NAP chuẩn (copy từ `danh_sach_citation_va_nap_chuan_seo.md`):
  - Tên: `Thiên Anh Door - Cửa Cuốn Đắk Nông`
  - Địa chỉ: `Thôn 7 Xã Nhân Cơ, Huyện Đắk R'lấp, Tỉnh Đắk Nông`
  - SĐT: `0965151153`
  - Web: `https://cuacuonthienanh.vn`
- [ ] Đăng 1 bài viết giới thiệu kèm ảnh thi công

---

## 🟡 TUẦN 2 (07/07 – 13/07): PHỦ CITATIONS + CONTENT MỚI
> *Nền móng đã sửa. Giờ bắt đầu "rải quân" trên internet.*

### Thứ Hai 07/07 — Citation #2: Trang Vàng Việt Nam (15 phút)
- [ ] Truy cập [yp.vn](https://yp.vn) → Đăng ký doanh nghiệp mới
- [ ] Danh mục: `Cửa cuốn / Cửa kéo` → Khu vực: `Đắk Nông`
- [ ] Điền NAP chuẩn 100% giống Facebook

### Thứ Ba 08/07 — Citation #3: YouTube Channel (20 phút)
- [ ] Tạo kênh YouTube: `Cửa Cuốn Đắk Nông - Thiên Anh Door`
- [ ] Viết mô tả kênh = Mẫu Bio vừa (500 ký tự) từ `danh_sach_citation_va_nap_chuan_seo.md`
- [ ] Upload 1 video có sẵn (nếu có) hoặc để trống, sẽ upload sau

### Thứ Tư 09/07 — BÀI VIẾT MỚI #1: So sánh khe thoáng vs tấm liền (30 phút)
- [ ] Yêu cầu AI soạn bài viết: *"So sánh cửa cuốn khe thoáng và tấm liền cho nhà phố Gia Nghĩa"*
- [ ] Copy nội dung → Đăng lên website mục Blog/Tin tức
- [ ] Đặt URL: `/so-sanh-cua-cuon-khe-thoang-tam-lien`
- [ ] Chia sẻ bài lên Facebook Fanpage

### Thứ Năm 10/07 — Citation #4 + #5: LinkedIn + Pinterest (20 phút)
- [ ] Tạo **LinkedIn Company Page**: `Thiên Anh Door`
  - Ngành: Construction / Building Materials
  - Mô tả: Mẫu Bio vừa từ file NAP
- [ ] Tạo **Pinterest**: Board = `Cửa Cuốn Đắk Nông - Thiên Anh Door`
  - Ghim 5 ảnh công trình từ thư mục Geotagged

### Thứ Sáu 11/07 — Mồi Review 5 sao #2 + Upload ảnh Maps (15 phút)
- [ ] Nhờ thêm 1 người khác (khác IP, khác thiết bị) review 5 sao theo quy trình 4G + Search
- [ ] Mẫu review:
  > *"Lắp cửa cuốn Titadoor ở Gia Nghĩa cho ngôi nhà mới xây. Thiên Anh Door tư vấn kỹ, lắp đặt gọn gàng, bảo hành 2 năm. Rất hài lòng."*
- [ ] Upload thêm 3 ảnh Geotagged lên Google Maps

### Thứ Bảy 12/07 — Citation #6 + #7: Blogger + TikTok (20 phút)
- [ ] Tạo blog trên **Blogger (Blogspot)**:
  - Tên blog: `Cửa Cuốn Đắk Nông - Thiên Anh Door`
  - Đăng 1 bài giới thiệu ngắn (300 từ) + link trỏ về `cuacuonthienanh.vn`
- [ ] Tạo tài khoản **TikTok**: `@cuacuonthienanh`
  - Bio: Mẫu Bio ngắn (160 ký tự) từ file NAP

### Chủ Nhật 13/07 — BÀI VIẾT MỚI #2: Chọn bình lưu điện (30 phút)
- [x] Yêu cầu AI soạn: *"Hướng dẫn chọn bình lưu điện cửa cuốn phù hợp khí hậu Đắk Nông"*
- [x] Đăng lên website + Chia sẻ Facebook

---

## 🟢 TUẦN 3 (14/07 – 20/07): KÍCH HOẠT AI CRAWLING + VIDEO
> *Đủ tín hiệu để Google và AI bắt đầu "nhìn thấy" Thiên Anh Door đang lớn mạnh.*

### Thứ Hai 14/07 — Submit URL lên Google Search Console (15 phút)
- [ ] Truy cập [search.google.com/search-console](https://search.google.com/search-console)
- [ ] Nếu chưa đăng ký: Thêm property `cuacuonthienanh.vn` → Xác minh bằng DNS hoặc HTML tag
- [ ] Dùng công cụ **URL Inspection** → Submit từng URL quan trọng:
  - `https://cuacuonthienanh.vn/` (Trang chủ)
  - URL bài "Sửa cửa cuốn Gia Nghĩa"
  - URL bài "Cách mở cửa cuốn khi mất điện"
  - URL bài "So sánh khe thoáng vs tấm liền" (mới viết)
  - URL bài "Chọn bình lưu điện" (mới viết)
- [ ] Submit **Sitemap** nếu CMS hỗ trợ (thường là `cuacuonthienanh.vn/sitemap.xml`)

### Thứ Ba 15/07 — Citation #8: Medium.com (25 phút)
- [ ] Tạo tài khoản Medium: `Thiên Anh Door`
- [ ] Đăng 1 bài viết (800-1000 từ): *"Kinh nghiệm chọn cửa cuốn phù hợp khí hậu mưa nhiều Đắk Nông"*
  - Chèn link trỏ về `cuacuonthienanh.vn` ở cuối bài
  - Gắn tags: `cửa cuốn`, `đắk nông`, `home improvement`
- [ ] (AI sẽ soạn sẵn nội dung cho John copy)

### Thứ Tư 16/07 — Quay Video SEO #1 (30 phút)
- [ ] Mở kịch bản từ `kich_ban_video_seo_cua_cuon_vo_nuoc.md`
- [ ] Quay video 30-45 giây bằng điện thoại: cảnh xử lý sự cố thực tế tại công trình
- [ ] **BẮT BUỘC nói to** trong 5 giây đầu: *"Hôm nay Thiên Anh Door đi sửa cửa cuốn bị vô nước ở Gia Nghĩa Đắk Nông..."*
- [ ] Upload lên TikTok + YouTube Shorts
  - Tiêu đề: `Xử lý cửa cuốn bị vô nước tại Đắk Nông | Thiên Anh Door`
  - Hashtag: `#cuacuondaknong #suacuacuon #thienanh #gianghia`

### Thứ Năm 17/07 — Citation #9 + #10: WordPress.com + Tumblr (20 phút)
- [ ] Tạo blog **WordPress.com**: `cuacuondaknong.wordpress.com`
  - Đăng 1 bài giới thiệu dịch vụ sửa cửa cuốn Gia Nghĩa + link về web chính
- [ ] Tạo **Tumblr**: Đăng 3 ảnh thi công kèm caption chứa từ khóa + link nguồn

### Thứ Sáu 18/07 — Mồi Review #3 + Ảnh Maps (15 phút)
- [ ] Nhờ thêm 1 người (ưu tiên KHÁCH HÀNG THẬT đã sửa/lắp cửa) review 5 sao
- [ ] Mẫu:
  > *"Nhà ở Đắk Mil, gọi sửa cửa cuốn Thiên Anh Door, anh thợ xuống nhanh lắm. Thay motor mới chạy ngon, giá đúng như báo. Ai ở Đắk Nông cần sửa cửa cuốn thì gọi."*
- [ ] Upload 3 ảnh Geotagged mới lên Maps

### Thứ Bảy 19/07 — BÀI VIẾT MỚI #3: Bảng giá sửa cửa cuốn 2026 (30 phút)
- [ ] Yêu cầu AI soạn: *"Bảng giá sửa cửa cuốn tại Đắk Nông 2026 — Thiên Anh Door"*
- [ ] Đăng lên website + Submit URL lên Google Search Console
- [ ] Chia sẻ lên Facebook + Zalo

### Chủ Nhật 20/07 — Citation #11 + #12: Apple Business + TrangVang.com.vn (15 phút)
- [ ] Đăng ký [Apple Business Connect](https://businessconnect.apple.com/) (cho người dùng iPhone)
- [ ] Đăng ký [trangvang.com.vn](https://trangvang.com.vn) (danh bạ doanh nghiệp)

---

## 🔵 TUẦN 4 (21/07 – 27/07): TỔNG TẤN CÔNG + ĐO LƯỜNG
> *Phủ nốt Citations còn lại, đẩy tín hiệu social, và kiểm tra kết quả.*

### Thứ Hai 21/07 — Citation #13 + #14: VnPages + Hosodoanhnghiep (15 phút)
- [ ] Đăng ký [vnpages.com.vn](http://vnpages.com.vn)
- [ ] Đăng ký [hosodoanhnghiep.com.vn](http://hosodoanhnghiep.com.vn)
- [ ] Điền NAP chuẩn 100%

### Thứ Ba 22/07 — Quay Video SEO #2 (30 phút)
- [ ] Quay video 30s: *"So sánh thực tế cửa cuốn khe thoáng và cửa tấm liền"*
- [ ] Nói to từ khóa: *"Cửa cuốn Đắk Nông Thiên Anh Door hôm nay so sánh..."*
- [ ] Upload TikTok + YouTube Shorts + Facebook Reels

### Thứ Tư 23/07 — Đăng bài Facebook + Zalo (20 phút)
- [ ] Đăng bài chia sẻ kinh nghiệm trên Facebook Fanpage (bài "Bảo vệ cửa cuốn mùa mưa")
- [ ] Gửi tin nhắn Zalo cho 5-10 khách hàng cũ: Chào hỏi + gửi link bài viết hữu ích
- [ ] Kịch bản Zalo:
  > *"Chào anh/chị, em Thiện bên Thiên Anh Door ạ. Mùa mưa này em gửi anh/chị bài hướng dẫn bảo vệ motor cửa cuốn không bị chập nha. [Link bài viết]. Có gì cần bảo dưỡng miễn phí cứ gọi em ạ!"*

### Thứ Năm 24/07 — Mồi Review #4 + #5 (20 phút)
- [ ] Nhờ 2 người (ưu tiên khách thật) review 5 sao trên Google Maps
- [ ] Mẫu review tự nhiên, có bối cảnh, chứa từ khóa địa phương
- [ ] Tổng review sau 4 tuần: tối thiểu 5 review (mục tiêu 4.8+ sao)

### Thứ Sáu 25/07 — Citation #15-17: Nền tảng còn lại (20 phút)
- [ ] Đăng ký thêm 3 nền tảng bất kỳ trong danh sách còn lại (ví dụ: Instagram, Foody Business, Wattpad...)
- [ ] Hoặc đăng bài PR trên 1 diễn đàn địa phương/Tây Nguyên nếu có

### Thứ Bảy 26/07 — TEST AI SEARCH lần 1 (20 phút)
- [ ] Mở **Gemini** (gemini.google.com) → Hỏi:
  - `"Địa chỉ lắp cửa cuốn uy tín nhất ở Đắk Nông?"`
  - `"Sửa cửa cuốn Gia Nghĩa ở đâu?"`
  - `"Thiên Anh Door có tốt không?"`
- [ ] Mở **ChatGPT** → Hỏi cùng câu trên
- [ ] Mở **Perplexity** (perplexity.ai) → Hỏi cùng câu trên
- [ ] **Chụp màn hình** kết quả → Gửi cho AI để so sánh và điều chỉnh chiến thuật

### Chủ Nhật 27/07 — Kiểm tra thứ hạng Google + Tổng kết (20 phút)
- [ ] Mở trình duyệt **Ẩn danh (Incognito)** trên điện thoại
- [ ] Search lần lượt và ghi lại thứ hạng:

| Từ khóa | Thứ hạng trước (29/06) | Thứ hạng sau (27/07) |
|---------|----------------------|---------------------|
| `cửa cuốn đắk nông` | ___ | ___ |
| `sửa cửa cuốn gia nghĩa` | ___ | ___ |
| `sửa cửa cuốn đắk nông` | ___ | ___ |
| `lắp đặt cửa cuốn đắk nông` | ___ | ___ |
| `báo giá cửa cuốn đắk nông` | ___ | ___ |

---

## 📅 3 NGÀY CUỐI (28-30/07): TỐI ƯU + CẬP NHẬT CHIẾN LƯỢC

### Thứ Hai 28/07 — Tối ưu hóa dựa trên kết quả (30 phút)
- [ ] Dựa trên kết quả test AI Search + thứ hạng Google:
  - Nếu AI chưa đề xuất Thiên Anh → Cần thêm Citations + bài viết Q&A
  - Nếu Google chưa lên Top 5 → Cần thêm nội dung + review + backlink
- [ ] Yêu cầu AI viết thêm 1-2 bài viết bổ sung nếu cần

### Thứ Ba 29/07 — Đăng ký nốt Citations còn lại (20 phút)
- [ ] Hoàn thành 20/20 nền tảng trong danh sách `danh_sach_citation_va_nap_chuan_seo.md`

### Thứ Tư 30/07 — TỔNG KẾT THÁNG 1 (20 phút)
- [ ] Điền bảng KPI cuối cùng:

| Chỉ số | Mục tiêu | Thực tế |
|--------|---------|---------|
| Review Google Maps (số lượng / sao) | 5+ review, 4.5+ sao | ___ / ___ sao |
| Citations NAP đồng bộ | 15-17/20 | ___/20 |
| Bài viết trên website | 9+ bài (6 cũ + 3 mới) | ___ bài |
| Video trên TikTok/YouTube | 2+ video | ___ video |
| Thứ hạng "cửa cuốn đắk nông" | Top 5 | Top ___ |
| AI Search đề xuất Thiên Anh | Xuất hiện trong danh sách | Có / Chưa |

---

## 📋 TỔNG HỢP: CHECKLIST NHANH TOÀN BỘ 30 NGÀY

### Nền móng website (Tuần 1)
- [ ] Sửa email footer
- [ ] Noindex/Ẩn trang HCM + Quận 1-12
- [ ] Dán JSON-LD Schema
- [ ] Submit Google Search Console

### Google Maps (Xuyên suốt)
- [ ] Upload 9+ ảnh Geotagged (3 ảnh/tuần × 3 tuần)
- [ ] Mồi 5 review 5 sao (1-2 review/tuần)
- [ ] Đồng bộ Bing Places
- [ ] Đồng bộ Apple Business Connect

### Content (Tuần 2-3)
- [ ] Bài #1: So sánh khe thoáng vs tấm liền
- [ ] Bài #2: Hướng dẫn chọn bình lưu điện
- [ ] Bài #3: Bảng giá sửa cửa cuốn 2026
- [ ] Bài Medium.com (backlink)

### Citations NAP (Tuần 1-4)
- [ ] Facebook Fanpage
- [ ] Trang Vàng (yp.vn)
- [ ] YouTube Channel
- [ ] LinkedIn Company Page
- [ ] Pinterest
- [ ] Blogger (Blogspot)
- [ ] TikTok
- [ ] WordPress.com
- [ ] Tumblr
- [ ] Medium.com
- [ ] Apple Business Connect
- [ ] TrangVang.com.vn
- [ ] VnPages.com.vn
- [ ] Hosodoanhnghiep.com.vn
- [ ] 3 nền tảng tùy chọn

### Video (Tuần 3-4)
- [ ] Video #1: Xử lý cửa cuốn vô nước
- [ ] Video #2: So sánh khe thoáng vs tấm liền

### Đo lường (Tuần 4)
- [ ] Test AI Search (Gemini + ChatGPT + Perplexity)
- [ ] Kiểm tra thứ hạng Google (Incognito)
- [ ] Điền bảng KPI tổng kết
