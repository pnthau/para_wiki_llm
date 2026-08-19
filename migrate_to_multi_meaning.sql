-- ======================================================================
-- SQL Script: MIGRATION - Tách bảng ý nghĩa để hỗ trợ 1 từ đa nghĩa
-- ======================================================================
USE `learn_jp_n5`;

-- 1. Xóa View cũ vì nó đang dính các cột sắp bị xóa
DROP VIEW IF EXISTS `v_today_due_reviews`;

-- 2. TẠO BẢNG vocabulary_meanings
CREATE TABLE IF NOT EXISTS `vocabulary_meanings` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `vocabulary_id` BIGINT NOT NULL,
  `vietnamese_meaning` TEXT NOT NULL,
  `example_sentence` TEXT NULL,
  `example_meaning` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_vocab_meaning` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabularies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. TẠO BẢNG grammar_meanings
CREATE TABLE IF NOT EXISTS `grammar_meanings` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `grammar_id` BIGINT NOT NULL,
  `explanation` TEXT NOT NULL,
  `example_sentence` TEXT NULL,
  `example_meaning` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_grammar_meaning` FOREIGN KEY (`grammar_id`) REFERENCES `grammars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. COPY DỮ LIỆU CŨ SANG BẢNG MỚI
INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`)
SELECT `id`, `vietnamese_meaning`, `example_sentence`, `example_meaning` FROM `vocabularies`;

INSERT INTO `grammar_meanings` (`grammar_id`, `explanation`, `example_sentence`, `example_meaning`)
SELECT `id`, `explanation`, `example_sentence`, `example_meaning` FROM `grammars`;



-- 6. XÓA CÁC CỘT Ý NGHĨA Ở BẢNG GỐC VÀ THIẾT LẬP LẠI UNIQUE ĐƠN
ALTER TABLE `vocabularies` 
  DROP COLUMN `vietnamese_meaning`,
  DROP COLUMN `example_sentence`,
  DROP COLUMN `example_meaning`,
  ADD CONSTRAINT `uq_vocab_japanese` UNIQUE (`japanese`);

ALTER TABLE `grammars` 
  DROP COLUMN `explanation`,
  DROP COLUMN `example_sentence`,
  DROP COLUMN `example_meaning`,
  ADD CONSTRAINT `uq_grammar_pattern` UNIQUE (`pattern`);

-- 7. TÁI TẠO LẠI VIEW v_today_due_reviews (Gộp các nghĩa lại bằng Dấu gạch chéo)
CREATE VIEW `v_today_due_reviews` AS
SELECT 
    rs.id AS schedule_id,
    rs.item_type,
    rs.item_id,
    u.unit_number,
    COALESCE(v.japanese, g.title) AS japanese_word,
    COALESCE(v.hiragana, g.pattern) AS reading_hiragana,
    v.romaji,
    v.word_type,
    COALESCE(
        (SELECT GROUP_CONCAT(vm.vietnamese_meaning SEPARATOR ' / ') FROM vocabulary_meanings vm WHERE vm.vocabulary_id = v.id),
        (SELECT GROUP_CONCAT(gm.explanation SEPARATOR ' / ') FROM grammar_meanings gm WHERE gm.grammar_id = g.id)
    ) AS vietnamese_meaning,
    COALESCE(
        (SELECT GROUP_CONCAT(vm.example_sentence SEPARATOR ' | ') FROM vocabulary_meanings vm WHERE vm.vocabulary_id = v.id),
        (SELECT GROUP_CONCAT(gm.example_sentence SEPARATOR ' | ') FROM grammar_meanings gm WHERE gm.grammar_id = g.id)
    ) AS example_sentence,
    COALESCE(
        (SELECT GROUP_CONCAT(vm.example_meaning SEPARATOR ' | ') FROM vocabulary_meanings vm WHERE vm.vocabulary_id = v.id),
        (SELECT GROUP_CONCAT(gm.example_meaning SEPARATOR ' | ') FROM grammar_meanings gm WHERE gm.grammar_id = g.id)
    ) AS example_meaning,
    rs.next_review_date,
    rs.review_count,
    rs.status
FROM `review_schedules` rs
LEFT JOIN `vocabularies` v ON rs.item_type = 'VOCABULARY' AND rs.item_id = v.id
LEFT JOIN `grammars` g ON rs.item_type = 'GRAMMAR' AND rs.item_id = g.id
LEFT JOIN `units` u ON (v.unit_id = u.id OR g.unit_id = u.id)
WHERE rs.next_review_date <= CURDATE()
  AND rs.status = 'LEARNING';
