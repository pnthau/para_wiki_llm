-- ============================================================
-- DATABASE SCHEMA: learn_jp_n5 (Full N5 Session Data)
-- ============================================================

CREATE DATABASE IF NOT EXISTS `learn_jp_n5` 
DEFAULT CHARACTER SET utf8mb4 
DEFAULT COLLATE utf8mb4_unicode_ci;

USE `learn_jp_n5`;

DROP VIEW IF EXISTS `v_today_due_reviews`;
DROP TABLE IF EXISTS `review_schedules`;
DROP TABLE IF EXISTS `grammars`;
DROP TABLE IF EXISTS `vocabularies`;
DROP TABLE IF EXISTS `units`;

-- 1. Table: units
CREATE TABLE `units` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `unit_number` INT NOT NULL UNIQUE COMMENT 'Số thứ tự Unit',
  `title` VARCHAR(255) NOT NULL COMMENT 'Tiêu đề Unit',
  `description` TEXT NULL COMMENT 'Mô tả ngắn',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Table: vocabularies
CREATE TABLE `vocabularies` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `unit_id` BIGINT NOT NULL,
  `japanese` VARCHAR(255) NOT NULL COMMENT 'Kanji / Kana gốc',
  `hiragana` VARCHAR(255) NULL COMMENT 'Cách đọc Hiragana',
  `romaji` VARCHAR(255) NULL COMMENT 'Romaji',
  `vietnamese_meaning` TEXT NOT NULL COMMENT 'Nghĩa tiếng Việt',
  `word_type` ENUM('NOUN', 'I_ADJECTIVE', 'NA_ADJECTIVE', 'VERB', 'ADVERB', 'PARTICLE', 'PHRASE') NOT NULL DEFAULT 'NOUN',
  `example_sentence` TEXT NULL,
  `example_meaning` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_vocab_unit` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Table: grammars
CREATE TABLE `grammars` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `unit_id` BIGINT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `pattern` VARCHAR(255) NOT NULL,
  `explanation` TEXT NOT NULL,
  `example_sentence` TEXT NULL,
  `example_meaning` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_grammar_unit` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Table: review_schedules
CREATE TABLE `review_schedules` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `item_type` ENUM('VOCABULARY', 'GRAMMAR') NOT NULL,
  `item_id` BIGINT NOT NULL,
  `next_review_date` DATE NOT NULL COMMENT 'Ngày cần ôn tập (YYYY-MM-DD)',
  `review_count` INT NOT NULL DEFAULT 0,
  `status` ENUM('LEARNING', 'MASTERED') NOT NULL DEFAULT 'LEARNING',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `uk_schedule_item` (`item_type`, `item_id`),
  INDEX `idx_review_date` (`next_review_date`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. VIEW: v_today_due_reviews (Lấy danh sách cần ôn HÔM NAY)
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
    COALESCE(v.vietnamese_meaning, g.explanation) AS vietnamese_meaning,
    v.example_sentence,
    v.example_meaning,
    rs.next_review_date,
    rs.review_count,
    rs.status
FROM `review_schedules` rs
LEFT JOIN `vocabularies` v ON rs.item_type = 'VOCABULARY' AND rs.item_id = v.id
LEFT JOIN `grammars` g ON rs.item_type = 'GRAMMAR' AND rs.item_id = g.id
LEFT JOIN `units` u ON (v.unit_id = u.id OR g.unit_id = u.id)
WHERE rs.next_review_date <= CURDATE()
  AND rs.status = 'LEARNING';

-- ============================================================
-- INSERT UNITS
-- ============================================================
INSERT INTO `units` (`id`, `unit_number`, `title`, `description`) VALUES
(1, 5, 'Quán ăn & Cảm giác vị giác', 'Mô tả vị ăn uống, cửa hàng và nối tính từ'),
(2, 6, 'Mua sắm & Đồ đạc', 'Từ vựng quần áo, phụ kiện và trung tâm thương mại');

-- ============================================================
-- INSERT VOCABULARIES (UNIT 5: Ẩm thực & Vị giác)
-- ============================================================
INSERT INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `vietnamese_meaning`, `word_type`, `example_sentence`, `example_meaning`) VALUES
(1, 1, '味', 'あじ', 'Aji', 'Vị (của món ăn)', 'NOUN', '味が薄いです。', 'Vị nhạt.'),
(2, 1, '薄い', 'うすい', 'Usui', 'Nhạt, mỏng', 'I_ADJECTIVE', '味が薄くて美味しくなかったです。', 'Vị nhạt nên đã không ngon lắm.'),
(3, 1, '美味しい', 'おいしい', 'Oishii', 'Ngon', 'I_ADJECTIVE', 'ケーキは美味しかったです。', 'Bánh kem đã ngon.'),
(4, 1, '甘い', 'あまい', 'Amai', 'Ngọt', 'I_ADJECTIVE', '甘くて美味しくなかったです。', 'Ngọt nên đã không ngon lắm.'),
(5, 1, '辛い', 'からい', 'Karai', 'Cay', 'I_ADJECTIVE', 'カレーはからくて美味しくなかった。', 'Cà ri cay nên đã không ngon.'),
(6, 1, 'ケーキ', 'けーき', 'Keeki', 'Bánh kem', 'NOUN', 'このケーキは甘いです。', 'Cái bánh kem này ngọt.'),
(7, 1, 'カレー', 'かれー', 'Karee', 'Món cà ri', 'NOUN', 'カレーを食べました。', 'Đã ăn món cà ri.'),
(8, 1, '中華の店', 'ちゅうかのみせ', 'Chuuka no mise', 'Quán ăn Trung Hoa', 'NOUN', '中華の店に入りました。', 'Đã vào quán ăn Trung Hoa.'),
(9, 1, 'カフェ', 'かふぇ', 'Kafe', 'Quán cà phê', 'NOUN', 'カフェに入りました。', 'Đã vào quán cà phê.'),
(10, 1, 'お腹', 'おなか', 'Onaka', 'Cái bụng', 'NOUN', 'お腹がすきました。', 'Đã đói bụng rồi.'),
(11, 1, 'イタリアン', 'いたりあん', 'Itarian', 'Món Ý / Quán Ý', 'NOUN', 'イタリアンを食べます。', 'Ăn món Ý.'),
(12, 1, 'パスタ', 'ぱすた', 'Pasuta', 'Mì Ý', 'NOUN', 'パスタを注文しました。', 'Đã gọi món mì Ý.'),
(13, 1, '焼きそば', 'やきそば', 'Yakisoba', 'Mì xào Nhật', 'NOUN', '焼きそばは美味しいです。', 'Mì xào ngon.'),
(14, 1, '焼肉', 'やきにく', 'Yakiniku', 'Thịt nướng', 'NOUN', '焼肉を食べました。', 'Đã ăn thịt nướng.'),
(15, 1, 'ソース', 'そーす', 'Soosu', 'Nước sốt', 'NOUN', 'ソースをつけます。', 'Chấm nước sốt.'),
(16, 1, '奥', 'おく', 'Oku', 'Phía trong cùng', 'NOUN', '店の奥に座りました。', 'Đã ngồi ở phía trong cùng của quán.'),
(17, 1, '近く', 'ちかく', 'Chikaku', 'Phía gần', 'NOUN', '駅の近くの店。', 'Quán ăn ở gần ga.'),
(18, 1, '古い', 'ふるい', 'Furui', 'Cũ', 'I_ADJECTIVE', '古い店です。', 'Là quán cũ.'),
(19, 1, '黒い', 'くろい', 'Kuroi', 'Màu đen', 'I_ADJECTIVE', '黒い靴。', 'Đôi giày màu đen.'),
(20, 1, '楽しい', 'たのしい', 'Tanoshii', 'Vui vẻ', 'I_ADJECTIVE', '楽しい時間でした。', 'Đã là thời gian vui vẻ.'),
(21, 1, 'いい', 'いい', 'Ii', 'Tốt', 'I_ADJECTIVE', 'いい店でした。', 'Đã là một quán tốt.'),
(22, 1, '素敵な', 'すてきな', 'Sutekina', 'Tuyệt vời, sang trọng', 'NA_ADJECTIVE', '素敵なショッピングモール。', 'TTTM tuyệt vời.'),
(23, 1, '親切な', 'しんせつな', 'Shinsetsuna', 'Thân thiện, tốt bụng', 'NA_ADJECTIVE', '親切な人です。', 'Là người thân thiện.'),
(24, 1, '上手な', 'じょうずな', 'Jouzuna', 'Giỏi', 'NA_ADJECTIVE', '日本語が上手です。', 'Giỏi tiếng Nhật.'),
(25, 1, '下手な', 'へたな', 'Hetana', 'Dở, tệ', 'NA_ADJECTIVE', '料理が下手です。', 'Nấu ăn dở.'),
(26, 1, '色々な', 'いろいろな', 'Iroirona', 'Đa dạng, nhiều', 'NA_ADJECTIVE', '色々な店があります。', 'Có nhiều quán khác nhau.');

-- ============================================================
-- INSERT VOCABULARIES (UNIT 6: Mua sắm & Đồ đạc)
-- ============================================================
INSERT INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `vietnamese_meaning`, `word_type`, `example_sentence`, `example_meaning`) VALUES
(27, 2, '友達', 'ともだち', 'Tomodachi', 'Bạn bè', 'NOUN', '友達と行きました。', 'Đã đi cùng bạn.'),
(28, 2, 'ストライプ', 'すとらいぷ', 'Sutoraipu', 'Kẻ sọc', 'NOUN', 'ストライプのシャツ。', 'Áo sơ mi kẻ sọc.'),
(29, 2, 'シャツ', 'しゃつ', 'Shatsu', 'Áo sơ mi', 'NOUN', 'シャツを買いました。', 'Đã mua áo sơ mi.'),
(30, 2, 'Tシャツ', 'てぃーしゃつ', 'Tiishatsu', 'Áo thun', 'NOUN', 'Tシャツを着ます。', 'Mặc áo thun.'),
(31, 2, 'ジーンズ', 'じーんず', 'Jiinzu', 'Quần jeans', 'NOUN', 'ジーンズを買いました。', 'Đã mua quần jeans.'),
(32, 2, '靴', 'くつ', 'Kutsu', 'Giày', 'NOUN', '靴とシャツを買いました。', 'Đã mua giày và áo sơ mi.'),
(33, 2, '食器', 'しょっき', 'Shokki', 'Bát đĩa, chén bát', 'NOUN', '食器を買いました。', 'Đã mua chén bát.'),
(34, 2, 'グラス', 'ぐらす', 'Gurasu', 'Ly thủy tinh', 'NOUN', 'きれいなグラス。', 'Cái ly đẹp.'),
(35, 2, 'ポーチ', 'ぽーち', 'Poochi', 'Túi trang điểm / túi nhỏ', 'NOUN', '可愛いポーチ。', 'Cái túi dễ thương.'),
(36, 2, 'ボールペン', 'ぼーるぺん', 'Boorupen', 'Bút bi', 'NOUN', '安くて可愛いボールペン。', 'Bút bi rẻ và dễ thương.'),
(37, 2, 'ショッピングモール', 'しょっぴんぐもーる', 'Shoppingu mooru', 'Trung tâm thương mại', 'NOUN', '広くて素敵なショッピングモール。', 'TTTM rộng và tuyệt vời.'),
(38, 2, '買い物', 'かいもの', 'Kaimono', 'Việc mua sắm', 'NOUN', '買い物に行きました。', 'Đã đi mua sắm.'),
(39, 2, '可愛い', 'かわいい', 'Kawaii', 'Dễ thương', 'I_ADJECTIVE', '可愛いボールペン。', 'Bút bi dễ thương.'),
(40, 2, '小さい', 'ちいさい', 'Chiisai', 'Nhỏ', 'I_ADJECTIVE', '小さくて可愛い。', 'Nhỏ và dễ thương.'),
(41, 2, '安い', 'やすい', 'Yasui', 'Rẻ', 'I_ADJECTIVE', '安くて可愛いボールペン。', 'Bút bi rẻ và dễ thương.'),
(42, 2, '広い', 'ひろい', 'Hiroi', 'Rộng', 'I_ADJECTIVE', '広くて素敵なモール。', 'Trung tâm thương mại rộng và đẹp.'),
(43, 2, '大きい', 'おおきい', 'Ookii', 'To lớn', 'I_ADJECTIVE', 'モールは大きかったです。', 'TTTM đã rất to lớn.'),
(44, 2, '綺麗な', 'きれいな', 'Kireina', 'Đẹp, sạch sẽ', 'NA_ADJECTIVE', '綺麗で大きかったです。', 'Rất đẹp và to lớn.'),
(45, 2, '面白い', 'おもしろい', 'Omoshiroi', 'Thú vị', 'I_ADJECTIVE', '面白い本です。', 'Là cuốn sách thú vị.'),
(46, 2, '白い', 'しろい', 'Shiroi', 'Màu trắng', 'I_ADJECTIVE', '白いシャツ。', 'Áo sơ mi màu trắng.'),
(47, 2, '悲しい', 'かなしい', 'Kanashii', 'Buồn', 'I_ADJECTIVE', '悲しい映画。', 'Bộ phim buồn.');

-- ============================================================
-- INSERT GRAMMARS (Các cấu trúc đã học)
-- ============================================================
INSERT INTO `grammars` (`id`, `unit_id`, `title`, `pattern`, `explanation`, `example_sentence`, `example_meaning`) VALUES
(1, 1, 'Nối tính từ đuôi い', 'A(i) -> A + kute', 'Bỏ i thêm kute để nối 2 tính từ đuôi i (Nghĩa: ... và / ... nên)', '薄くて美味しくなかったです。', 'Vị nhạt nên đã không ngon lắm.'),
(2, 1, 'Cụm từ chỉ cảm giác đói', 'お腹がすきました', 'Tôi đã đói bụng rồi (luôn dùng đuôi quá khứ sukimashita)', 'とてもお腹がすきました。', 'Và đã rất đói bụng.'),
(3, 1, 'Trợ từ に đi với động từ 入る', 'Địa điểm + に + 入ります', 'Bước vào / Đi vào một không gian kín', '中華の店に入りました。', 'Chúng tôi đã vào quán ăn Trung Hoa.'),
(4, 2, 'Nối tính từ đuôi な', 'A(na) -> A + de', 'Tính từ đuôi na bỏ na thêm de để nối tính từ (Nghĩa: ... và ...)', '綺麗で大きかったです。', 'Rất đẹp và đã to lớn.'),
(5, 2, 'Liệt kê danh từ bằng と', 'A と B を買いました', 'Nối các danh từ lại với nhau (A và B)', '靴とシャツを買いました。', 'Tôi đã mua giày và áo sơ mi.');

-- ============================================================
-- LẬP LỊCH ÔN TẬP HÔM NAY (CURDATE()) CHO TOÀN BỘ 47 TỪ VỰNG & 5 NGỮ PHÁP
-- ============================================================
INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
SELECT 'VOCABULARY', id, CURDATE(), 0, 'LEARNING' FROM `vocabularies`;

INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
SELECT 'GRAMMAR', id, CURDATE(), 0, 'LEARNING' FROM `grammars`;
