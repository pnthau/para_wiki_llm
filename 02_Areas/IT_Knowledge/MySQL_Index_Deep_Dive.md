---
domain: "IT_Knowledge"
type: "atomic-note"
status: "active"
tags: [sql, mysql, indexing, b-tree, hash-index, performance]
created: 2026-05-30
source: "00_Raw/Chỉ mục (index) trong mysql.md"
nexus_version: 6.0
---

# 🧠 MYSQL INDEX DEEP DIVE: B-TREE VS HASH

> "Chọn đúng loại Index là bước đi chiến lược của một Kiến trúc sư để tối ưu hóa cỗ máy Database."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- Thao tác: `CREATE INDEX`, `ALTER TABLE ADD INDEX`, `DROP INDEX`.
- Các loại Index phổ biến: Primary Key, Unique Index, Fulltext Index.

### 2. Patterns (Mô thức)
- **Range Search Pattern**: Sử dụng **B-Tree** khi cần tìm kiếm trong một khoảng (ví dụ: `5 < score < 9`). B-Tree sắp xếp dữ liệu tăng dần, cho phép duyệt cây hiệu quả.
- **Exact Match Pattern**: Sử dụng **Hash Index** khi chỉ cần so khớp chính xác (`=`, `<>`). Tốc độ Hash cực nhanh nhưng "vô dụng" với việc sắp xếp (`ORDER BY`) hoặc tìm kiếm theo khoảng.
- **Text Search Pattern**: Sử dụng **Full-text Index** cho các cột chứa đoạn văn dài. Nó sử dụng cấu trúc **Inverted Index** (giống Google) để tìm kiếm từ khóa cực nhanh mà không cần dùng `LIKE %...%`. Chi tiết tại: [[Full_Text_Search_MySQL]].
- **Data Integrity Pattern**: Sử dụng `UNIQUE INDEX` để vừa tăng tốc vừa đảm bảo dữ liệu không bị trùng lặp.

### 3. Structures (Cấu trúc hệ thống)
- **B-Tree (Balance Tree)**: Cấu trúc phân cấp (Root -> Branch -> Leaf). Dữ liệu nằm ở lá (leaf). Tìm kiếm là quá trình đệ quy. Chi tiết: [[B-Tree_Architecture]].
- **Hash Index**: Cấu trúc Key-Value. Sử dụng hàm băm (Hash function) để trỏ thẳng đến địa chỉ vùng nhớ. Chi tiết về cơ chế tự động của MySQL: [[Adaptive_Hash_Index]].
- **Full-text (Inverted Index)**: Xé nhỏ văn bản thành các từ đơn (Token) và lưu trữ danh sách các tài liệu chứa từ đó. Chỉ hỗ trợ một số Engine (InnoDB, MyISAM). Chi tiết: [[Full_Text_Search_MySQL]].
- **Automatic Indexing**: Nếu không chỉ định, MySQL tự động đánh Index lên `Primary Key`.

### 4. Mental Models (Tư duy cốt lõi)
- **"The Right Tool for the Right Job"**: B-Tree là "dao đa năng", Hash là "dao mổ", Full-text là "kính lúp" soi văn bản.
- **"Index is a Shadow Table"**: Hãy coi Index là một bảng phụ thu nhỏ luôn chạy song song. Khi bảng chính thay đổi, "bóng" của nó cũng phải đổi theo -> Gây tốn tài nguyên ghi.

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý Cấu trúc dữ liệu (Data Structure Principle)**: Hiệu năng của Database phụ thuộc trực tiếp vào cấu trúc dữ liệu lưu trữ Chỉ mục (Tree $O(\log n)$ vs Hash $O(1)$ vs Inverted Index for Text).

---

## 🔗 NEURAL MAPPING
- **Horizontal (Siblings)**: [[MySQL_Indexing_Performance]], [[SQL_Views]].
- **Vertical (Foundations)**: [[Relational_Database_Fundamentals]].
- **Cross-Domain (Nexus)**: 
    - **Java**: B-Tree tương đương `TreeMap`, Hash tương đương `HashMap`, Full-text tương đương các thư viện như **Lucene** hoặc **Elasticsearch**.

---

## 📝 CORNELL SUMMARY
| Key Points         | Detailed Notes                                                                                   |
| ------------------ | ------------------------------------------------------------------------------------------------ |
| **Thao tác**       | `CREATE INDEX`, `ALTER TABLE ADD INDEX`, <br> `DROP INDEX`.                                      |
| **B-Tree**         | Mặc định trong MySQL. Hỗ trợ tìm kiếm theo khoảng (`>`, `<`, `BETWEEN`) và sắp xếp (`ORDER BY`). |
| **Hash**           | Nhanh hơn B-Tree cho phép so khớp chính xác (`=`). KHÔNG hỗ trợ tìm khoảng hoặc sắp xếp.         |
| **Full-text**      | Chuyên trị tìm kiếm từ khóa trong đoạn văn dài. Dùng `MATCH() ... AGAINST()`.                    |
| **UNIQUE INDEX**   | Ngăn chặn giá trị trùng lặp. Tốt cho bảo toàn dữ liệu (Integrity).                               |
| **Khi nào tránh?** | Bảng nhỏ, bảng ghi nhiều hơn đọc (High write frequency), cột chứa quá nhiều NULL.                |


---
**Summary**: Hiểu rõ sự khác biệt giữa B-Tree và Hash Index giúp lập trình viên lựa chọn cấu trúc tối ưu cho từng loại truy vấn. B-Tree linh hoạt cho tìm kiếm khoảng, trong khi Hash vượt trội về tốc độ cho các so khớp chính xác.

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
