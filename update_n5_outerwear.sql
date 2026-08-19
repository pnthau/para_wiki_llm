-- ======================================================================
-- SQL Script: Thêm 3 từ vựng mới về Áo khoác / Âu phục
-- Đưa thẳng vào hàng chờ ưu tiên HÔM NAY (CURDATE())
-- ======================================================================
USE `learn_jp_n5`;

-- Thêm từ vựng mới vào bảng vocabularies (ID 85, 86, 87) thuộc Unit 2 (Mua sắm & Đồ đạc)
INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `word_type`) VALUES
(85, 2, 'スーツ', 'すーつ', 'Suutsu', 'NOUN'),
(86, 2, 'ジャンパー', 'じゃんぱー', 'Janpaa', 'NOUN'),
(87, 2, 'コート', 'こーと', 'Kooto', 'NOUN');

INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`) VALUES
(85, 'Áo vest, Âu phục (Suit)', 'スーツを着ます。', 'Mặc âu phục.'),
(86, 'Áo khoác gió, Áo khoác mỏng', 'ジャンパーを買いました。', 'Đã mua áo khoác mỏng.'),
(87, 'Áo khoác dáng dài (Coat)', '冬のコート。', 'Áo khoác mùa đông.');

-- Thiết lập lịch ôn tập ngắt quãng (SRS) cho 3 từ này ngay hôm nay
INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
SELECT 'VOCABULARY', id, CURDATE(), 0, 'LEARNING'
FROM `vocabularies`
WHERE id IN (85, 86, 87)
ON DUPLICATE KEY UPDATE 
    `next_review_date` = CURDATE(),
    `review_count` = 0,
    `status` = 'LEARNING';
