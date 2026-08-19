-- ======================================================================
-- SQL Script: Thêm Ngữ pháp Trợ từ に / を với động từ di chuyển
-- (Sử dụng cấu trúc Đa nghĩa 1-N mới của Database)
-- ======================================================================
USE `learn_jp_n5`;

-- 1. Thêm mẫu ngữ pháp vào bảng grammars gốc (ID 6, thuộc Unit 2)
INSERT IGNORE INTO `grammars` (`id`, `unit_id`, `title`, `pattern`) VALUES
(6, 2, 'Trợ từ に và を với động từ di chuyển', 'N + に / を + V(di chuyển)');

-- 2. Thêm giải thích ngữ pháp vào bảng grammar_meanings
-- Xóa trước để tránh bị duplicate nếu bạn vô tình chạy file 2 lần
DELETE FROM `grammar_meanings` WHERE `grammar_id` = 6;

INSERT INTO `grammar_meanings` (`grammar_id`, `explanation`, `example_sentence`, `example_meaning`) VALUES
(6, 'Hành động VÀO / LÊN (tiếp xúc điểm đến) dùng に. Hành động RA / XUỐNG (thoát ly khỏi không gian) dùng を.', 'バスに乗ります。 / バスを降ります。', 'Lên xe buýt. / Xuống xe buýt.');

-- 3. Xếp lịch ôn tập ngay hôm nay
INSERT INTO `review_schedules` (`item_type`, `item_id`, `next_review_date`, `review_count`, `status`)
VALUES ('GRAMMAR', 6, CURDATE(), 0, 'LEARNING')
ON DUPLICATE KEY UPDATE 
    `next_review_date` = CURDATE(),
    `review_count` = 0,
    `status` = 'LEARNING';
