-- ======================================================================
-- SQL Script: Thêm từ vựng mới (Cái cốc - カップ)
-- Đưa thẳng vào hàng chờ ưu tiên HÔM NAY (CURDATE())
-- ======================================================================
USE `learn_jp_n5`;

-- Thêm từ vựng mới vào bảng vocabularies (ID 81) thuộc Unit 2 (Mua sắm & Đồ đạc)
INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `word_type`) VALUES
(81, 2, 'カップ', 'かっぷ', 'Kappu', 'NOUN');

INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`) VALUES
(81, 'Cái cốc (tách có quai)', 'コーヒーのカップ。', 'Tách cà phê.');

-- Thiết lập lịch ôn tập ngắt quãng (SRS) cho từ này ngay hôm nay
INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
SELECT 'VOCABULARY', id, CURDATE(), 0, 'LEARNING'
FROM `vocabularies`
WHERE id IN (81)
ON DUPLICATE KEY UPDATE 
    `next_review_date` = CURDATE(),
    `review_count` = 0,
    `status` = 'LEARNING';
