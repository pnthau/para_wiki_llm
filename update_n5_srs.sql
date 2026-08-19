-- SQL Script: Thêm các từ vựng mới vào DB learn_jp_n5 & Thiết lập Spaced Repetition (SRS)
USE `learn_jp_n5`;

-- Thêm các từ vựng mới chưa có trong bảng vocabularies
INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `word_type`) VALUES
(48, 2, 'スカート', 'すかーと', 'Sukaato', 'NOUN'),
(49, 2, '時計', 'とけい', 'Tokei', 'NOUN'),
(50, 2, '消しゴム', 'けしごむ', 'Keshigomu', 'NOUN'),
(51, 2, 'シャーペン', 'しゃーぺん', 'Shaapen', 'NOUN'),
(52, 2, 'スプーン', 'すぷーん', 'Supuun', 'NOUN'),
(53, 2, 'フォーク', 'ふぉーく', 'Fooku', 'NOUN'),
(54, 2, '本屋', 'ほんや', 'Honya', 'NOUN'),
(55, 2, '映画館', 'えいがかん', 'Eigakan', 'NOUN'),
(56, 2, '庭', 'にわ', 'Niwa', 'NOUN'),
(57, 2, 'ビル', 'びる', 'Biru', 'NOUN'),
(58, 2, '木', 'き', 'Ki', 'NOUN'),
(59, 2, 'モール', 'もーる', 'Mooru', 'NOUN'),
(60, 2, '会います', 'あいます', 'Aimasu', 'VERB'),
(61, 2, '疲れます', 'つかれます', 'Tsukaremasu', 'VERB'),
(62, 2, 'お腹がすきます', 'おなかがすきます', 'Onakagasukimasu', 'VERB'),
(63, 2, '出ます', 'でます', 'Demasu', 'VERB'),
(64, 2, '送ります', 'おくります', 'Okurimasu', 'VERB'),
(65, 2, '知っています', 'しっています', 'Shitteimasu', 'VERB');

INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`) VALUES
(48, 'Chân váy', 'スカートを買いました。', 'Đã mua chân váy.'),
(49, 'Đồng hồ', '新しい時計。', 'Cái đồng hồ mới.'),
(50, 'Gôm, tẩy', '消しゴムを使います。', 'Dùng cục tẩy.'),
(51, 'Bút chì bấm', 'シャーペンで書きます。', 'Viết bằng bút chì bấm.'),
(52, 'Thìa, muỗng', 'スプーンで食べます。', 'Ăn bằng thìa.'),
(53, 'Nĩa', 'フォークを使います。', 'Dùng nĩa.'),
(54, 'Nhà sách', '本屋に行きました。', 'Đã đi đến nhà sách.'),
(55, 'Rạp chiếu phim', '映画館で映画を見ます。', 'Xem phim ở rạp.'),
(56, 'Khu vườn', '庭に木があります。', 'Có cây ở trong vườn.'),
(57, 'Tòa nhà cao tầng', ' nh 広いビル。', 'Tòa nhà rộng.'),
(58, 'Cây', '大きな木です。', 'Là cái cây to.'),
(59, 'Trung tâm thương mại', 'モールに行きました。', 'Đã đi trung tâm thương mại.'),
(60, 'Gặp gỡ', '友達に会いました。', 'Đã gặp bạn.'),
(61, 'Mệt mỏi', '今日は疲れました。', 'Hôm nay đã mệt.'),
(62, 'Đói bụng', 'お腹がすきました。', 'Đã đói bụng rồi.'),
(63, 'Ra khỏi', '店を出ました。', 'Đã ra khỏi cửa tiệm.'),
(64, 'Tiễn, đưa về', '彼女を家まで送りました。', 'Đã đưa cô ấy về tận nhà.'),
(65, 'Biết, nắm rõ', '歴史を知っています。', 'Biết rõ lịch sử.');

-- Thiết lập lịch ôn tập ngắt quãng (SRS) cho 30 từ hôm nay vào bảng review_schedules
-- Lần 1: Ngày mai DATE_ADD(CURDATE(), INTERVAL 1 DAY)
INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
SELECT 'VOCABULARY', id, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 1, 'LEARNING'
FROM `vocabularies`
WHERE id IN (2, 29, 30, 31, 32, 33, 36, 39, 42, 43, 44, 46, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65)
ON DUPLICATE KEY UPDATE 
    `next_review_date` = DATE_ADD(CURDATE(), INTERVAL 1 DAY),
    `review_count` = 1,
    `status` = 'LEARNING';
