---
domain: Japanese_N5
type: atomic-note
status: active
tags: [n5, srs, spaced-repetition, vocabulary]
created: 2026-07-30
updated: 2026-07-30
nexus_version: 8.4
---

# 📅 LỊCH ÔN TẬP NGẮT QUẢNG (SPACED REPETITION - SRS) — JAPANESE N5

> **Mục tiêu**: Nạp 30 từ vựng N5 đã học hôm nay (2026-07-30) vào bộ nhớ dài hạn theo chu kỳ ngắt quãng **1 - 3 - 7 - 14 - 30 ngày**.

---

## 📊 DANH SÁCH 30 TỪ VỰNG ĐÃ KHÓA HÔM NAY (2026-07-30)

| STT | Kanji / Katakana | Hiragana | Tiếng Việt | Phân loại |
| :---: | :--- | :--- | :--- | :--- |
| 1 | Tシャツ | てぃーしゃつ | Áo thun | Trang phục |
| 2 | シャツ | しゃつ | Áo sơ mi | Trang phục |
| 3 | スカート | すかーと | Váy | Trang phục |
| 4 | ジーンズ | じーんず | Quần jeans | Trang phục |
| 5 | 靴 | くつ | Giày | Trang phục |
| 6 | 時計 | とけい | Đồng hồ | Trang phục |
| 7 | 消しゴム | けしごむ | Gôm, tẩy | Đồ dùng |
| 8 | 食器 | しょっき | Chén bát | Đồ dùng |
| 9 | シャーペン | しゃーぺん | Bút chì bấm | Đồ dùng |
| 10 | スプーン | すぷーん | Thìa, muỗng | Đồ dùng |
| 11 | ボールペン | ぼーるぺん | Bút bi | Đồ dùng |
| 12 | フォーク | ふぉーく | Nĩa | Đồ dùng |
| 13 | 本屋 | ほんや | Nhà sách | Địa điểm |
| 14 | 映画館 | えいがかん | Rạp chiếu phim | Địa điểm |
| 15 | 庭 | にわ | Khu vườn | Địa điểm |
| 16 | ビル | びる | Tòa nhà | Địa điểm |
| 17 | 木 | き | Cây | Đồ vật/Cảnh vật |
| 18 | モール | もーる | Trung tâm mua sắm | Địa điểm |
| 19 | 綺麗な | きれいな | Đẹp, sạch | Tính từ Na |
| 20 | 広い | ひろい | Rộng rãi | Tính từ I |
| 21 | 大きい | おおきい | Lớn, to | Tính từ I |
| 22 | 可愛い | かわいい | Dễ thương | Tính từ I |
| 23 | 薄い | うすい | Nhạt, mỏng | Tính từ I |
| 24 | 白い | しろい | Trắng | Tính từ I |
| 25 | 会います | あいます | Gặp gỡ | Động từ |
| 26 | 疲れます | つかれます | Mệt mỏi | Động từ |
| 27 | お腹がすきます | おなかがすきます | Đói bụng | Cụm động từ |
| 28 | 出ます | でます | Ra khỏi | Động từ |
| 29 | 送ります | おくります | Tiễn, đưa về | Động từ |
| 30 | 知っています | しっています | Biết | Thể trạng thái |

---

## 🗓️ LỊCH NHẮC NHỞ ÔN TẬP NGẮT QUẢNG (SRS TRACKER)

| Lần ôn | Khoảng cách | Ngày hẹn ôn (YYYY-MM-DD) | Nội dung ôn tập | Trạng thái |
| :---: | :---: | :---: | :--- | :---: |
| 🟢 **Lần 0** | Ngày 0 | **2026-07-30** (Hôm nay) | Học & Đạt 100% qua 5 Micro-Raids | **HOÀN THÀNH** ✅ |
| ⏰ **Lần 1** | **+1 ngày** | **2026-07-31** (Ngày mai) | Quick Flash Review 30 từ (5 phút) | ⏳ Chờ nhắc |
| ⏰ **Lần 2** | **+3 ngày** | **2026-08-02** | Trắc nghiệm phản xạ Việt ➔ Nhật | ⏳ Chờ nhắc |
| ⏰ **Lần 3** | **+7 ngày** | **2026-08-06** | Đặt câu thực tế với 5 động từ/tính từ | ⏳ Chờ nhắc |
| ⏰ **Lần 4** | **+14 ngày** | **2026-08-13** | Kiểm tra ngẫu nhiên (Random Check) | ⏳ Chờ nhắc |
| 🏆 **Lần 5** | **+30 ngày** | **2026-08-29** | Kiểm tra tổng hợp ➔ Khóa Mastered | ⏳ Chờ nhắc |

---

## 🗄️ DATABASE QUERY (SQL CHECK)

```sql
-- Query kiểm tra các từ cần ôn tập trong ngày
SELECT * FROM v_today_due_reviews WHERE next_review_date <= CURDATE();
```
