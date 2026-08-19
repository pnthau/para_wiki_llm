-- ======================================================================
-- SQL Script: Thêm 3 từ vựng mới (Khăn quàng, Váy liền, Bao tay)
-- Đưa thẳng vào hàng chờ ưu tiên HÔM NAY (CURDATE())
-- ======================================================================
USE `learn_jp_n5`;

-- Thêm từ vựng mới vào bảng vocabularies (ID 78, 79, 80) thuộc Unit 2 (Mua sắm & Đồ đạc)
INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `word_type`) VALUES
(78, 2, 'マフラー', 'まふらー', 'Mafuraa', 'NOUN'),
(79, 2, 'ワンピース', 'わんぴーす', 'Wanpiisu', 'NOUN'),
(80, 2, '手袋', 'てぶくろ', 'Tebukuro', 'NOUN');

INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`) VALUES
(78, 'Khăn quàng cổ', 'マフラーをします。', 'Quàng khăn cổ.'),
(79, 'Váy liền thân (Đầm)', '可愛いワンピースを買いました。', 'Tôi đã mua một chiếc váy liền thân dễ thương.'),
(80, 'Găng tay / Bao tay', '手袋をします。', 'Đeo găng tay.');

-- Thiết lập lịch ôn tập ngắt quãng (SRS) cho 3 từ này ngay hôm nay
INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
SELECT 'VOCABULARY', id, CURDATE(), 0, 'LEARNING'
FROM `vocabularies`
WHERE id IN (78, 79, 80)
ON DUPLICATE KEY UPDATE 
    `next_review_date` = CURDATE(),
    `review_count` = 0,
    `status` = 'LEARNING';
