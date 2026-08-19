-- ======================================================================
-- SQL Script: 
-- 1. Thêm 2 từ mới (ジャケット, セーター)
-- 2. Đưa toàn bộ 35 từ cũ bị lỡ nhịp và 5 ngữ pháp về HÀNG CHỜ HÔM NAY
-- ======================================================================
USE `learn_jp_n5`;

-- ----------------------------------------------------------------------
-- PHẦN 1: THÊM TỪ VỰNG MỚI (VÀ ĐƯA VÀO LỊCH HÔM NAY)
-- ----------------------------------------------------------------------
INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `word_type`) VALUES
(76, 2, 'ジャケット', 'じゃけっと', 'Jaketto', 'NOUN'),
(77, 2, 'セーター', 'せーたー', 'Seetaa', 'NOUN');

INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`) VALUES
(76, 'Áo khoác', 'ジャケットを着ます。', 'Mặc áo khoác.'),
(77, 'Áo len', '暖かいセーターです。', 'Là chiếc áo len ấm áp.');

INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
SELECT 'VOCABULARY', id, CURDATE(), 0, 'LEARNING'
FROM `vocabularies`
WHERE id IN (76, 77)
ON DUPLICATE KEY UPDATE 
    `next_review_date` = CURDATE(),
    `review_count` = 0,
    `status` = 'LEARNING';

-- ----------------------------------------------------------------------
-- PHẦN 2: RESET 35 TỪ CŨ VÀ 5 NGỮ PHÁP VỀ HÔM NAY (PRIORITY QUEUE)
-- ----------------------------------------------------------------------

-- Reset 35 từ vựng cũ chưa ôn
UPDATE `review_schedules`
SET `next_review_date` = CURDATE(),
    `review_count` = 0,
    `status` = 'LEARNING'
WHERE `item_type` = 'VOCABULARY'
  AND `item_id` IN (
      1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, -- Unit 1
      27, 28, 34, 35, 37, 38, 40, 41, 45, 47 -- Unit 2
  );

-- Reset 5 ngữ pháp về hôm nay
UPDATE `review_schedules`
SET `next_review_date` = CURDATE(),
    `review_count` = 0,
    `status` = 'LEARNING'
WHERE `item_type` = 'GRAMMAR'
  AND `item_id` IN (1, 2, 3, 4, 5);
