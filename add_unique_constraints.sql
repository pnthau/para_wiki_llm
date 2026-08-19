-- ======================================================================
-- SQL Script: Sửa đổi Unique Constraint (Chặn trùng lặp Từ + Nghĩa)
-- ======================================================================
USE `learn_jp_n5`;

-- 1. Xóa các Constraint cũ (nếu bạn đã lỡ chạy file trước đó)
-- Lưu ý: Nếu DB báo lỗi báo "không tìm thấy index", bạn có thể bỏ qua dòng DROP tương ứng.
ALTER TABLE `vocabularies` DROP INDEX `uq_vocab_japanese`;
ALTER TABLE `grammars` DROP INDEX `uq_grammar_pattern`;

-- 2. Thêm UNIQUE constraint KÉP cho bảng vocabularies (Từ vựng + 100 ký tự đầu của Nghĩa)
-- Cột vietnamese_meaning là kiểu TEXT nên MySQL yêu cầu khai báo độ dài tối đa (prefix). 100 ký tự là đủ!
ALTER TABLE `vocabularies` 
ADD CONSTRAINT `uq_vocab_meaning` UNIQUE (`japanese`, `vietnamese_meaning`(100));

-- 3. Thêm UNIQUE constraint KÉP cho bảng grammars (Mẫu câu + 100 ký tự đầu của Giải thích)
ALTER TABLE `grammars` 
ADD CONSTRAINT `uq_grammar_meaning` UNIQUE (`pattern`, `explanation`(100));
