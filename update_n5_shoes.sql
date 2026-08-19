-- ======================================================================
-- SQL Script: Thêm 3 từ vựng mới (Nhẫn, Bốt, Giày thể thao)
-- Đưa thẳng vào hàng chờ ưu tiên HÔM NAY (CURDATE())
-- ======================================================================
USE `learn_jp_n5`;

-- Thêm từ vựng mới vào bảng vocabularies (ID 82, 83, 84) thuộc Unit 2 (Mua sắm & Đồ đạc)
INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `word_type`) VALUES
(82, 2, 'リング', 'りんぐ', 'Ringu', 'NOUN'),
(83, 2, 'ブーツ', 'ぶーつ', 'Buutsu', 'NOUN'),
(84, 2, 'スニーカー', 'すにーかー', 'Suniikaa', 'NOUN');

INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`) VALUES
(82, 'Chiếc nhẫn', 'リングを買いました。', 'Đã mua chiếc nhẫn.'),
(83, 'Giày bốt (Boots)', '黒いブーツを履きます。', 'Mang đôi bốt màu đen.'),
(84, 'Giày thể thao (Sneakers)', 'スニーカーで走ります。', 'Chạy bằng giày thể thao.');

-- Thiết lập lịch ôn tập ngắt quãng (SRS) cho 3 từ này ngay hôm nay
INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
SELECT 'VOCABULARY', id, CURDATE(), 0, 'LEARNING'
FROM `vocabularies`
WHERE id IN (82, 83, 84)
ON DUPLICATE KEY UPDATE 
    `next_review_date` = CURDATE(),
    `review_count` = 0,
    `status` = 'LEARNING';
