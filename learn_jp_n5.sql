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
  CONSTRAINT `fk_vocab_unit` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  UNIQUE KEY `uq_vocab_meaning` (`japanese`, `vietnamese_meaning`(100))
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
  CONSTRAINT `fk_grammar_unit` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  UNIQUE KEY `uq_grammar_meaning` (`pattern`, `explanation`(100))
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
(2, 6, 'Mua sắm & Đồ đạc', 'Từ vựng quần áo, phụ kiện và trung tâm thương mại'),
(3, 7, 'Từ vựng mở rộng', 'Danh sách 41 từ vựng mới'),
(4, 8, 'Từ vựng Đọc hiểu', 'Trích xuất từ bài tập đọc hiểu về khu phố');

-- ============================================================
-- INSERT VOCABULARIES (UNIT 5: Ẩm thực & Vị giác)
-- ============================================================
INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `word_type`) VALUES
(1, 1, '味', 'あじ', 'Aji', 'NOUN'),
(2, 1, '薄い', 'うすい', 'Usui', 'I_ADJECTIVE'),
(3, 1, '美味しい', 'おいしい', 'Oishii', 'I_ADJECTIVE'),
(4, 1, '甘い', 'あまい', 'Amai', 'I_ADJECTIVE'),
(5, 1, '辛い', 'からい', 'Karai', 'I_ADJECTIVE'),
(6, 1, 'ケーキ', 'けーき', 'Keeki', 'NOUN'),
(7, 1, 'カレー', 'かれー', 'Karee', 'NOUN'),
(8, 1, '中華の店', 'ちゅうかのみせ', 'Chuuka no mise', 'NOUN'),
(9, 1, 'カフェ', 'かふぇ', 'Kafe', 'NOUN'),
(10, 1, 'お腹', 'おなか', 'Onaka', 'NOUN'),
(11, 1, 'イタリアン', 'いたりあん', 'Itarian', 'NOUN'),
(12, 1, 'パスタ', 'ぱすた', 'Pasuta', 'NOUN'),
(13, 1, '焼きそば', 'やきそば', 'Yakisoba', 'NOUN'),
(14, 1, '焼肉', 'やきにく', 'Yakiniku', 'NOUN'),
(15, 1, 'ソース', 'そーす', 'Soosu', 'NOUN'),
(16, 1, '奥', 'おく', 'Oku', 'NOUN'),
(17, 1, '近く', 'ちかく', 'Chikaku', 'NOUN'),
(18, 1, '古い', 'ふるい', 'Furui', 'I_ADJECTIVE'),
(19, 1, '黒い', 'くろい', 'Kuroi', 'I_ADJECTIVE'),
(20, 1, '楽しい', 'たのしい', 'Tanoshii', 'I_ADJECTIVE'),
(21, 1, 'いい', 'いい', 'Ii', 'I_ADJECTIVE'),
(22, 1, '素敵な', 'すてきな', 'Sutekina', 'NA_ADJECTIVE'),
(23, 1, '親切な', 'しんせつな', 'Shinsetsuna', 'NA_ADJECTIVE'),
(24, 1, '上手な', 'じょうずな', 'Jouzuna', 'NA_ADJECTIVE'),
(25, 1, '下手な', 'へたな', 'Hetana', 'NA_ADJECTIVE'),
(26, 1, '色々な', 'いろいろな', 'Iroirona', 'NA_ADJECTIVE');

INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`) VALUES
(1, 'Vị (của món ăn)', '味が薄いです。', 'Vị nhạt.'),
(2, 'Nhạt, mỏng', '味が薄くて美味しくなかったです。', 'Vị nhạt nên đã không ngon lắm.'),
(3, 'Ngon', 'ケーキは美味しかったです。', 'Bánh kem đã ngon.'),
(4, 'Ngọt', '甘くて美味しくなかったです。', 'Ngọt nên đã không ngon lắm.'),
(5, 'Cay', 'カレーはからくて美味しくなかった。', 'Cà ri cay nên đã không ngon.'),
(6, 'Bánh kem', 'このケーキは甘いです。', 'Cái bánh kem này ngọt.'),
(7, 'Món cà ri', 'カレーを食べました。', 'Đã ăn món cà ri.'),
(8, 'Quán ăn Trung Hoa', '中華の店に入りました。', 'Đã vào quán ăn Trung Hoa.'),
(9, 'Quán cà phê', 'カフェに入りました。', 'Đã vào quán cà phê.'),
(10, 'Cái bụng', 'お腹がすきました。', 'Đã đói bụng rồi.'),
(11, 'Món Ý / Quán Ý', 'イタリアンを食べます。', 'Ăn món Ý.'),
(12, 'Mì Ý', 'パスタを注文しました。', 'Đã gọi món mì Ý.'),
(13, 'Mì xào Nhật', '焼きそばは美味しいです。', 'Mì xào ngon.'),
(14, 'Thịt nướng', '焼肉を食べました。', 'Đã ăn thịt nướng.'),
(15, 'Nước sốt', 'ソースをつけます。', 'Chấm nước sốt.'),
(16, 'Phía trong cùng', '店の奥に座りました。', 'Đã ngồi ở phía trong cùng của quán.'),
(17, 'Phía gần', '駅の近くの店。', 'Quán ăn ở gần ga.'),
(18, 'Cũ', '古い店です。', 'Là quán cũ.'),
(19, 'Màu đen', '黒い靴。', 'Đôi giày màu đen.'),
(20, 'Vui vẻ', '楽しい時間でした。', 'Đã là thời gian vui vẻ.'),
(21, 'Tốt', 'いい店でした。', 'Đã là một quán tốt.'),
(22, 'Tuyệt vời, sang trọng', '素敵なショッピングモール。', 'TTTM tuyệt vời.'),
(23, 'Thân thiện, tốt bụng', '親切な人です。', 'Là người thân thiện.'),
(24, 'Giỏi', '日本語が上手です。', 'Giỏi tiếng Nhật.'),
(25, 'Dở, tệ', '料理が下手です。', 'Nấu ăn dở.'),
(26, 'Đa dạng, nhiều', '色々な店があります。', 'Có nhiều quán khác nhau.');

-- ============================================================
-- INSERT VOCABULARIES (UNIT 6: Mua sắm & Đồ đạc)
-- ============================================================
INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `word_type`) VALUES
(27, 2, '友達', 'ともだち', 'Tomodachi', 'NOUN'),
(28, 2, 'ストライプ', 'すとらいぷ', 'Sutoraipu', 'NOUN'),
(29, 2, 'シャツ', 'しゃつ', 'Shatsu', 'NOUN'),
(30, 2, 'Tシャツ', 'てぃーしゃつ', 'Tiishatsu', 'NOUN'),
(31, 2, 'ジーンズ', 'じーんず', 'Jiinzu', 'NOUN'),
(32, 2, '靴', 'くつ', 'Kutsu', 'NOUN'),
(33, 2, '食器', 'しょっき', 'Shokki', 'NOUN'),
(34, 2, 'グラス', 'ぐらす', 'Gurasu', 'NOUN'),
(35, 2, 'ポーチ', 'ぽーち', 'Poochi', 'NOUN'),
(36, 2, 'ボールペン', 'ぼーるぺん', 'Boorupen', 'NOUN'),
(37, 2, 'ショッピングモール', 'しょっぴんぐもーる', 'Shoppingu mooru', 'NOUN'),
(38, 2, '買い物', 'かいもの', 'Kaimono', 'NOUN'),
(39, 2, '可愛い', 'かわいい', 'Kawaii', 'I_ADJECTIVE'),
(40, 2, '小さい', 'ちいさい', 'Chiisai', 'I_ADJECTIVE'),
(41, 2, '安い', 'やすい', 'Yasui', 'I_ADJECTIVE'),
(42, 2, '広い', 'ひろい', 'Hiroi', 'I_ADJECTIVE'),
(43, 2, '大きい', 'おおきい', 'Ookii', 'I_ADJECTIVE'),
(44, 2, '綺麗な', 'きれいな', 'Kireina', 'NA_ADJECTIVE'),
(45, 2, '面白い', 'おもしろい', 'Omoshiroi', 'I_ADJECTIVE'),
(46, 2, '白い', 'しろい', 'Shiroi', 'I_ADJECTIVE'),
(47, 2, '悲しい', 'かなしい', 'Kanashii', 'I_ADJECTIVE');

INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`) VALUES
(27, 'Bạn bè', '友達と行きました。', 'Đã đi cùng bạn.'),
(28, 'Kẻ sọc', 'ストライプのシャツ。', 'Áo sơ mi kẻ sọc.'),
(29, 'Áo sơ mi', 'シャツを買いました。', 'Đã mua áo sơ mi.'),
(30, 'Áo thun', 'Tシャツを着ます。', 'Mặc áo thun.'),
(31, 'Quần jeans', 'ジーンズを買いました。', 'Đã mua quần jeans.'),
(32, 'Giày', '靴とシャツを買いました。', 'Đã mua giày và áo sơ mi.'),
(33, 'Bát đĩa, chén bát', '食器を買いました。', 'Đã mua chén bát.'),
(34, 'Ly thủy tinh', 'きれいなグラス。', 'Cái ly đẹp.'),
(35, 'Túi trang điểm / túi nhỏ', '可愛いポーチ。', 'Cái túi dễ thương.'),
(36, 'Bút bi', '安くて可愛いボールペン。', 'Bút bi rẻ và dễ thương.'),
(37, 'Trung tâm thương mại', '広くて素敵なショッピングモール。', 'TTTM rộng và tuyệt vời.'),
(38, 'Việc mua sắm', '買い物に行きました。', 'Đã đi mua sắm.'),
(39, 'Dễ thương', '可愛いボールペン。', 'Bút bi dễ thương.'),
(40, 'Nhỏ', '小さくて可愛い。', 'Nhỏ và dễ thương.'),
(41, 'Rẻ', '安くて可愛いボールペン。', 'Bút bi rẻ và dễ thương.'),
(42, 'Rộng', '広くて素敵なモール。', 'Trung tâm thương mại rộng và đẹp.'),
(43, 'To lớn', 'モールは大きかったです。', 'TTTM đã rất to lớn.'),
(44, 'Đẹp, sạch sẽ', '綺麗で大きかったです。', 'Rất đẹp và to lớn.'),
(45, 'Thú vị', '面白い本です。', 'Là cuốn sách thú vị.'),
(46, 'Màu trắng', '白いシャツ。', 'Áo sơ mi màu trắng.'),
(47, 'Buồn', '悲しい映画。', 'Bộ phim buồn.');

-- ============================================================
-- INSERT VOCABULARIES (UNIT 7: Ôn tập mở rộng)
-- ============================================================
INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `word_type`) VALUES
(48, 3, '土曜日', 'どようび', 'Doyoubi', 'NOUN'),
(49, 3, '買い物', 'かいもの', 'Kaimono', 'NOUN'),
(50, 3, 'ショッピングモール', 'しょっぴんぐもーる', 'Shoppingumooru', 'NOUN'),
(51, 3, '綺麗な', 'きれいな', 'Kireina', 'NA_ADJECTIVE'),
(52, 3, '大きい', 'おおきい', 'Ookii', 'I_ADJECTIVE'),
(53, 3, 'モール', 'もーる', 'Mooru', 'NOUN'),
(54, 3, '中', 'なか', 'Naka', 'NOUN'),
(55, 3, '庭', 'にわ', 'Niwa', 'NOUN'),
(56, 3, '木', 'き', 'Ki', 'NOUN'),
(57, 3, '広い', 'ひろい', 'Hiroi', 'I_ADJECTIVE'),
(58, 3, 'います', 'います', 'Imasu', 'VERB'),
(59, 3, '白い', 'しろい', 'Shiroi', 'I_ADJECTIVE'),
(60, 3, 'ポロシャツ', 'ぽろしゃつ', 'Poroshatsu', 'NOUN'),
(61, 3, 'チェック', 'ちぇっく', 'Chekku', 'NOUN'),
(62, 3, 'スカート', 'すかーと', 'Sukaato', 'NOUN'),
(63, 3, 'ジーンズ', 'じーんず', 'Jiinzu', 'NOUN'),
(64, 3, '可愛い', 'かわいい', 'Kawaii', 'I_ADJECTIVE'),
(65, 3, 'ポーチ', 'ぽーち', 'Poochi', 'NOUN'),
(66, 3, 'ボールペン', 'ぼーるぺん', 'Boorupen', 'NOUN'),
(67, 3, 'ストライプ', 'すとらいぷ', 'Sutoraipu', 'NOUN'),
(68, 3, 'シャツ', 'しゃつ', 'Shatsu', 'NOUN'),
(69, 3, '靴', 'くつ', 'Kutsu', 'NOUN'),
(70, 3, '食器', 'しょっき', 'Shokki', 'NOUN'),
(71, 3, '疲れます', 'つかれます', 'Tsukaremasu', 'VERB'),
(72, 3, 'お腹がすきます', 'おなかがすきます', 'Onakagasukimasu', 'PHRASE'),
(73, 3, '味', 'あじ', 'Aji', 'NOUN'),
(74, 3, '薄い', 'うすい', 'Usui', 'I_ADJECTIVE'),
(75, 3, 'また', 'また', 'Mata', 'ADVERB'),
(76, 3, '本屋', 'ほんや', 'Honya', 'NOUN'),
(77, 3, '会います', 'あいます', 'Aimasu', 'VERB'),
(78, 3, '映画館', 'えいがかん', 'Eigakan', 'NOUN'),
(79, 3, '中国', 'ちゅうごく', 'Chuugoku', 'NOUN'),
(80, 3, '面白い', 'おもしろい', 'Omoshiroi', 'I_ADJECTIVE'),
(81, 3, '悲しい', 'かなしい', 'Kanashii', 'I_ADJECTIVE'),
(82, 3, 'ビル', 'びる', 'Biru', 'NOUN'),
(83, 3, 'ピザ', 'ぴざ', 'Piza', 'NOUN'),
(84, 3, '歴史', 'れきし', 'Rekishi', 'NOUN'),
(85, 3, '知っています', 'しっています', 'Shitteimasu', 'VERB'),
(86, 3, '出ます', 'でます', 'Demasu', 'VERB'),
(87, 3, '送ります', 'おくります', 'Okurimasu', 'VERB'),
(88, 3, '一日', 'いちにち', 'Ichinichi', 'NOUN');

INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`) VALUES
(48, 'Thứ bảy', NULL, NULL),
(49, 'Mua sắm', NULL, NULL),
(50, 'Trung tâm mua sắm', NULL, NULL),
(51, 'Đẹp', NULL, NULL),
(52, 'Lớn, to', NULL, NULL),
(53, 'Trung tâm thương mại', NULL, NULL),
(54, 'Bên trong', NULL, NULL),
(55, 'Vườn', NULL, NULL),
(56, 'Cây', NULL, NULL),
(57, 'Rộng', NULL, NULL),
(58, 'Có', NULL, NULL),
(59, 'Trắng', NULL, NULL),
(60, 'Áo thun có cổ, áo polo', NULL, NULL),
(61, 'Sọc ca rô', NULL, NULL),
(62, 'Váy', NULL, NULL),
(63, 'Quần jean', NULL, NULL),
(64, 'Dễ thương', NULL, NULL),
(65, 'Ví, bóp', NULL, NULL),
(66, 'Bút bi', NULL, NULL),
(67, 'Sọc thẳng', NULL, NULL),
(68, 'Áo sơ mi', NULL, NULL),
(69, 'Giày', NULL, NULL),
(70, 'Chén bát', NULL, NULL),
(71, 'Mệt', NULL, NULL),
(72, 'Đói bụng', NULL, NULL),
(73, 'Vị', NULL, NULL),
(74, 'Nhạt nhẽo', NULL, NULL),
(75, 'Lại', NULL, NULL),
(76, 'Nhà sách', NULL, NULL),
(77, 'Gặp', NULL, NULL),
(78, 'Rạp chiếu phim', NULL, NULL),
(79, 'Trung quốc', NULL, NULL),
(80, 'Hay, thú vị', NULL, NULL),
(81, 'Buồn', NULL, NULL),
(82, 'Toà nhà', NULL, NULL),
(83, 'Pizza', NULL, NULL),
(84, 'Lịch sử', NULL, NULL),
(85, 'Biết', NULL, NULL),
(86, 'Ra khỏi (cửa tiệm)', NULL, NULL),
(87, 'Tiễn', NULL, NULL),
(88, 'Một ngày', NULL, NULL);

-- ============================================================
-- INSERT VOCABULARIES (UNIT 8: Từ vựng Đọc hiểu)
-- ============================================================
INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `word_type`) VALUES
(89, 4, 'この辺り', 'このあたり', 'Kono atari', 'NOUN'),
(90, 4, 'レストラン', 'れすとらん', 'Resutoran', 'NOUN'),
(91, 4, '多い', 'おおい', 'Ooi', 'I_ADJECTIVE'),
(92, 4, 'デパート', 'でぱーと', 'Depaato', 'NOUN'),
(93, 4, '食事', 'しょくじ', 'Shokuji', 'NOUN'),
(94, 4, '便利な', 'べんりな', 'Benrina', 'NA_ADJECTIVE'),
(95, 4, '賑やかな', 'にぎやかな', 'Nigiyakana', 'NA_ADJECTIVE'),
(96, 4, 'や', 'や', 'Ya', 'PARTICLE');

INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`) VALUES
(89, 'Khu vực này', 'この辺りはレストランが多いです。', 'Khu vực này có nhiều nhà hàng.'),
(90, 'Nhà hàng', NULL, NULL),
(91, 'Nhiều', NULL, NULL),
(92, 'Trung tâm thương mại (Bách hóa tổng hợp)', NULL, NULL),
(93, 'Bữa ăn, việc ăn uống', '食事に便利です。', 'Tiện lợi cho việc ăn uống.'),
(94, 'Tiện lợi', NULL, NULL),
(95, 'Nhộn nhịp, náo nhiệt', 'とても賑やかです。', 'Rất nhộn nhịp.'),
(96, 'Và, hay là (trợ từ liệt kê)', '買いものや食事', 'Việc mua sắm và ăn uống');

-- ============================================================
-- INSERT GRAMMARS (Các cấu trúc đã học)
-- ============================================================
INSERT IGNORE INTO `grammars` (`id`, `unit_id`, `title`, `pattern`) VALUES
(1, 1, 'Nối tính từ đuôi い', 'A(i) -> A + kute'),
(2, 1, 'Cụm từ chỉ cảm giác đói', 'お腹がすきました'),
(3, 1, 'Trợ từ に đi với động từ 入る', 'Địa điểm + に + 入ります'),
(4, 2, 'Nối tính từ đuôi な', 'A(na) -> A + de'),
(5, 2, 'Liệt kê danh từ bằng と', 'A と B を買いました'),
(6, 1, 'Phủ định tính từ đuôi い', 'A(i) -> A(bỏ i) + kunai desu'),
(7, 1, 'Quá khứ phủ định tính từ đuôi い', 'A(i) -> A(bỏ i) + kunakatta desu');

INSERT INTO `grammar_meanings` (`grammar_id`, `explanation`, `example_sentence`, `example_meaning`) VALUES
(1, 'Bỏ i thêm kute để nối 2 tính từ đuôi i (Nghĩa: ... và / ... nên)', '薄くて美味しくなかったです。', 'Vị nhạt nên đã không ngon lắm.'),
(2, 'Tôi đã đói bụng rồi (luôn dùng đuôi quá khứ sukimashita)', 'とてもお腹がすきました。', 'Và đã rất đói bụng.'),
(3, 'Bước vào / Đi vào một không gian kín', '中華の店に入りました。', 'Chúng tôi đã vào quán ăn Trung Hoa.'),
(4, 'Tính từ đuôi na bỏ na thêm de để nối tính từ (Nghĩa: ... và ...)', '綺麗で大きかったです。', 'Rất đẹp và đã to lớn.'),
(5, 'Nối các danh từ lại với nhau (A và B)', '靴とシャツを買いました。', 'Tôi đã mua giày và áo sơ mi.'),
(6, 'Bỏ i thêm kunai desu để nói Không... (Ngoại lệ: いい -> よくない)', 'ケーキは甘くないです。', 'Cái bánh kem này thì không ngọt.'),
(7, 'Bỏ i thêm kunakatta desu để nói Đã Không... (Ngoại lệ: いい -> よくなかった)', 'ショッピングモールは大きくなかったです。', 'Trung tâm thương mại đã không to lớn.');

-- ============================================================
-- LẬP LỊCH ÔN TẬP HÔM NAY (CURDATE()) CHO TOÀN BỘ 47 TỪ VỰNG & 7 NGỮ PHÁP
-- ============================================================
INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
SELECT 'VOCABULARY', id, CURDATE(), 0, 'LEARNING' FROM `vocabularies`;

INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
SELECT 'GRAMMAR', id, CURDATE(), 0, 'LEARNING' FROM `grammars`;

-- ============================================================
-- CẬP NHẬT TIẾN ĐỘ THỰC TẾ (Phiên học ngày 2026-08-02)
-- ============================================================
-- Tăng review_count = 1 và dời next_review_date sang ngày mai cho các từ vựng/ngữ pháp đã thực hành đúng 100%
UPDATE `review_schedules` 
SET `review_count` = 1, 
    `next_review_date` = DATE_ADD(CURDATE(), INTERVAL 1 DAY)
WHERE (`item_type` = 'VOCABULARY' AND `item_id` IN (3, 4, 5, 6, 7, 14, 20, 21, 36, 37, 38, 43))
   OR (`item_type` = 'GRAMMAR' AND `item_id` IN (6, 7));
