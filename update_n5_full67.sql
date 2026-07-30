-- SQL Script: Nạp trọn bộ 67 từ vựng N5 vào MySQL DB learn_jp_n5
USE `learn_jp_n5`;

-- Thêm các từ còn lại vào bảng vocabularies
INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `vietnamese_meaning`, `word_type`, `example_sentence`, `example_meaning`) VALUES
(66, 2, '土曜日', 'どようび', 'Doyoubi', 'Thứ Bảy', 'NOUN', '土曜日に買い物に行きます。', 'Đi mua sắm vào thứ Bảy.'),
(67, 2, 'ピザ', 'ぴざ', 'Piza', 'Bánh Pizza', 'NOUN', 'ピザを食べました。', 'Đã ăn bánh pizza.'),
(68, 2, '中', 'なか', 'Naka', 'Bên trong', 'NOUN', 'バッグの中。', 'Bên trong cái túi.'),
(69, 2, '一日', 'いちにち', 'Ichinichi', 'Một ngày', 'NOUN', '楽しい一日でした。', 'Đã là một ngày vui vẻ.'),
(70, 2, '悲しい', 'かなしい', 'Kanashii', 'Buồn, bi thương', 'I_ADJECTIVE', '悲しい映画を見ました。', 'Đã xem bộ phim buồn.'),
(71, 2, 'また', 'また', 'Mata', 'Lại, lần nữa', 'ADVERB', 'また会いましょう。', 'Hãy lại gặp nhau nhé.'),
(72, 2, 'ナイフ', 'ないふ', 'Naifu', 'Con dao', 'NOUN', 'ナイフで切ります。', 'Cắt bằng dao.'),
(73, 2, 'ポロシャツ', 'ぽろしゃつ', 'Poroshatsu', 'Áo thun có cổ (Polo)', 'NOUN', '黒いポロシャツ。', 'Áo thun polo màu đen.'),
(74, 2, 'チェック', 'ちぇっく', 'Chekku', 'Họa tiết sọc ca rô', 'NOUN', 'チェックのスカート。', 'Chân váy sọc ca rô.'),
(75, 2, 'ストライプ', 'すとらいぷ', 'Sutoraipu', 'Họa tiết sọc thẳng', 'NOUN', 'ストライプのシャツ。', 'Áo sơ mi sọc thẳng.');

-- Lập lịch ôn tập ngắt quãng (SRS) cho toàn bộ 67 từ vựng trong bảng review_schedules
INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
SELECT 'VOCABULARY', id, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 1, 'LEARNING'
FROM `vocabularies`
ON DUPLICATE KEY UPDATE 
    `next_review_date` = DATE_ADD(CURDATE(), INTERVAL 1 DAY),
    `review_count` = 1,
    `status` = 'LEARNING';
