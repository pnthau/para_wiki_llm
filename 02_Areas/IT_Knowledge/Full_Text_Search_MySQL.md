---
domain: "IT_Knowledge"
type: "expansion-note"
status: "active"
tags: [sql, mysql, indexing, full-text-search, search-engine, performance]
created: 2026-05-30
nexus_version: 6.0
---

# 🧠 FULL-TEXT SEARCH TRONG MYSQL: BẢN CHẤT & QUYỀN NĂNG

> "Khi B-Tree bó tay trước văn bản dài, Full-text Search là vị cứu tinh mang sức mạnh của một Search Engine thu nhỏ."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- Câu lệnh: `MATCH(column) AGAINST('keyword')`.
- Các toán tử trong Boolean Mode: `+`, `-`, `*`, `> <`, `~`, `( )`.
- Kết quả: Tìm kiếm văn bản cực nhanh ngay cả với dữ liệu khổng lồ.

### 2. Patterns (Mô thức)
- **Tokenization Pattern**: Xé nhỏ văn bản thành các "Token" (từ đơn).
- **Relevance Ranking Pattern**: Sắp xếp kết quả theo "Độ liên quan" (Score) thay vì chỉ đúng/sai.
- **Stopword Pattern**: Tự động loại bỏ các từ vô nghĩa (the, a, and, hoặc các từ quá ngắn) để tối ưu bộ nhớ.

### 3. Structures (Cấu trúc hệ thống)
- **Inverted Index (Chỉ mục đảo ngược)**: Thay vì lưu `Record -> Words`, nó lưu `Word -> [List of Records]`. Giống như mục lục tra cứu từ vựng ở cuối sách.
- **Natural Language Mode**: Chế độ mặc định, tìm kiếm thông minh dựa trên tần suất xuất hiện.
- **Boolean Mode**: Chế độ "Tập kích" chính xác, cho phép dùng logic AND/OR/NOT.

### 4. Mental Models (Tư duy cốt lõi)
- **"The Search Engine Mindset"**: Đừng coi DB chỉ là kho chứa, hãy coi nó là một công cụ lọc thông tin thông minh.
- **"Garbage In, Garbage Out"**: Nếu không cấu hình Stopwords và Min_Word_Len đúng, Search Engine của bạn sẽ trả về kết quả rác hoặc không tìm thấy gì.

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý Đảo ngược (Inversion Principle)**: Chuyển đổi từ việc tìm kiếm tuần tự trong văn bản sang việc tra cứu trực tiếp từ khóa trong bảng mục lục đảo ngược.

---

## 🛠️ HƯỚNG DẪN TÁC CHIẾN

### 1. Tạo Chỉ mục
```sql
ALTER TABLE table_name ADD FULLTEXT(column1, column2);
```

### 2. Truy vấn Boolean Mode (Quyền năng nhất)
```sql
SELECT * FROM posts 
WHERE MATCH(title, body) 
AGAINST('+Java -Javascript' IN BOOLEAN MODE);
-- Giải thích: Bắt buộc có 'Java', nhưng KHÔNG được có 'Javascript'.
```

---

## 🔗 NEURAL MAPPING
- **Vertical (Parent)**: [[MySQL_Index_Deep_Dive]].
- **Horizontal (Siblings)**: [[MySQL_Indexing_Performance]].
- **Cross-Domain (Nexus)**: 
    - **Elasticsearch**: Hệ thống Search Engine chuyên dụng dùng chung nguyên lý Inverted Index.
    - **Google Search**: Cùng mô hình tư duy nhưng ở quy mô toàn cầu.

---

## 📝 CORNELL SUMMARY
| Key Points | Detailed Notes |
|------------|----------------|
| Inverted Index | Cấu trúc cốt lõi lưu trữ Từ khóa -> ID bản ghi. |
| Boolean Mode | Dùng `+`, `-`, `*` để điều khiển logic tìm kiếm. |
| Stopwords | Các từ bị MySQL lờ đi (ví dụ: 'the', 'is'). Cần lưu ý khi tìm từ khóa ngắn. |

---
**Summary**: Full-text Search biến MySQL thành một công cụ tìm kiếm mạnh mẽ nhờ cấu trúc Inverted Index, giúp xử lý các truy vấn văn bản phức tạp mà B-Tree không thể đáp ứng hiệu quả.

---
*Back to [[MySQL_Index_Deep_Dive]] | [[Systems_Thinking_Protocol]]*
