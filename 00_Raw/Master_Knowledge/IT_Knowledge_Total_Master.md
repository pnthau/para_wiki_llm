---
domain: IT_Knowledge
type: concept
status: active
tags: [database, transactions, acid, reliability]
created: 2026-05-27
nexus_version: 6.0
---

# [[ACID_Properties]] (Tính chất ACID)

## Tổng quan
Để đảm bảo độ tin cậy của dữ liệu trong các hệ thống [[RDBMS]], các giao dịch (Transactions) phải tuân thủ 4 tính chất ACID.

## 4 Trụ cột ACID
1. **Atomicity (Tính nguyên tử)**: "Tất cả hoặc không có gì". Một giao dịch phải được thực hiện hoàn toàn hoặc không thực hiện chút nào.
2. **Consistency (Tính nhất quán)**: Đảm bảo dữ liệu chuyển từ trạng thái hợp lệ này sang trạng thái hợp lệ khác, không vi phạm các ràng buộc (Constraints).
3. **Isolation (Tính cô lập)**: Các giao dịch thực hiện đồng thời không được ảnh hưởng đến nhau.
4. **Durability (Tính bền vững)**: Một khi giao dịch đã thành công (Commit), dữ liệu sẽ được lưu vĩnh viễn ngay cả khi hệ thống gặp sự cố.

## Vai trò trong Java Phát triển
Khi lập trình Java Spring Boot, bạn sẽ sử dụng `@Transactional` để đảm bảo các thao tác với Database tuân thủ chuẩn ACID này.

## Related
- [[Relational_Database_Fundamentals]]
- [[Relational_Data_Model]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [learning-theory, education, student-centered]
created: 2026-05-27
nexus_version: 6.0
---

# [[Active_Learning]] (Học tập Chủ động)

## Tổng quan
**Active Learning** là phương pháp học tập yêu cầu người học tham gia trực tiếp vào quá trình xây dựng kiến thức thông qua các hoạt động như thảo luận, thực hành, giải quyết vấn đề, thay vì chỉ tiếp nhận thông tin thụ động.

## Đặc điểm
- **Người học là trung tâm**: Trách nhiệm học tập thuộc về người học.
- **Tương tác liên tục**: Sử dụng các [[Tactical_Questioning_Strategies]] để duy trì sự tham gia.
- **Phản hồi ngay lập tức**: Học từ sai lầm thông qua thực hành (ví dụ: gõ code và chạy thử ngay).

## Lợi ích
- Cải thiện khả năng ghi nhớ dài hạn.
- Phát triển kỹ năng tư duy bậc cao ([[Higher_Order_Thinking]]).
- Tăng động lực học tập do thấy được ứng dụng thực tế.

## Related
- [[Tactical_Questioning_Strategies]]
- [[Blooms_Taxonomy]]
---
domain: "IT_Knowledge"
type: "concept"
status: "active"
tags: [mysql, innodb, performance, hash-index]
created: 2026-05-30
nexus_version: 6.0
---

# 🧠 ADAPTIVE HASH INDEX (INNODB)

> "Khi MySQL thấy bạn tìm một thứ lặp đi lặp lại, nó tự động tạo ra một 'đường tắt' bằng Hash Index trên RAM."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- Engine InnoDB không cho phép người dùng tự tạo Hash Index bằng lệnh `CREATE INDEX... USING HASH`.
- Tuy nhiên, nhiều truy vấn bằng toán tử `=` vẫn có tốc độ thần tốc ngang ngửa Hash.

### 2. Patterns (Mô thức)
- **Caching Pattern**: Lưu trữ các điểm truy cập nóng nhất (Hot data) trực tiếp lên bộ nhớ RAM.
- **Adaptive Pattern**: Tính năng này hoàn toàn tự động (Adaptive). Lập trình viên không cần can thiệp.

### 3. Structures (Cấu trúc hệ thống)
- Khi InnoDB nhận thấy một B-Tree Index đang được truy vấn rất nhiều lần bằng một giá trị cụ thể (Ví dụ: tìm kiếm user_id = 5 liên tục), nó sẽ tự động xây dựng một Hash Index trong bộ đệm (Buffer Pool) trỏ trực tiếp đến trang dữ liệu đó.
- Lần tìm kiếm tiếp theo cho `user_id = 5`, InnoDB không duyệt cây B-Tree nữa mà dùng Hash Index để trỏ thẳng tới đích (độ phức tạp $O(1)$).

### 4. Mental Models (Tư duy cốt lõi)
- **"Automation over Manual Control"**: Thay vì bắt lập trình viên phải lựa chọn (B-Tree hay Hash), InnoDB chọn cách "Bao thầu" cả hai: Bề mặt dùng B-Tree để đa năng, bên dưới tự động dùng Hash để tăng tốc cục bộ.

---
*Back to [[MySQL_Index_Deep_Dive]]*
---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [ai, agents, memory, coala, cognitive-architecture]
created: 2026-05-29
source: "00_Raw/Các loại trí nhớ AI agent cần.md"
nexus_version: 6.0
---

# [[AI_Agent_Memory_Architecture_CoALA]] (Kiến trúc Trí nhớ AI Agent)

## 💡 CUES & KEYWORDS
- **Working Memory** (RAM/Short-term)
- **Semantic Memory** (Knowledge/Facts)
- **Procedural Memory** (Skills/How-to)
- **Episodic Memory** (Experiences/Logs)
- **CoALA Framework**
- **[[Memory_Management]]**

## 📝 NOTES (Cornell Method)

### 1. Phân loại Trí nhớ theo khung CoALA
| Loại Trí nhớ | Đặc điểm & Vai trò | Cách triển khai trong Nexus |
| :--- | :--- | :--- |
| **Working Memory** | Bộ nhớ ngắn hạn (RAM). Chứa context hiện tại, file đang mở, prompt.<br>Dung lượng hạn chế, tốc độ cực nhanh. | `session_context`, `loaded_context` trong phiên chat hiện tại. |
| **Semantic Memory** | Bộ nhớ ngữ nghĩa/sự thật. Lưu trữ quy tắc, kiến thức chuyên môn.<br>Giúp duy trì tri thức lâu dài. | Hệ thống Vault PARA, các file `.md` trong `02_Areas/` và Vector Database. |
| **Procedural Memory** | Bộ nhớ thủ tục/kỹ năng. Chứa hướng dẫn từng bước (SOP) để thực hiện task.<br>Chỉ nạp khi cần (Progressive Disclosure). | Thư mục `03_Resources/Agent_Skills/` và các file `SKILL.md`. |
| **Episodic Memory** | Bộ nhớ kinh nghiệm/sự kiện. Ghi lại các tương tác, quyết định và bài học từ quá khứ.<br>Cần cơ chế "quên" (forgetting) để tránh quá tải. | File `log.md`, `MEMORY.md` và nhật ký lỗi/thành công của John. |

### 2. Tầm quan trọng của Trí nhớ
- **Chatbot vs. Agent**: Trí nhớ là yếu tố phân định. Agent có khả năng học hỏi và tích lũy kiến thức theo thời gian.
- **Learning Loop**: Giúp tránh lặp lại sai lầm cũ và tối ưu hóa phản hồi dựa trên kinh nghiệm thực tế.

### 3. Nâng cấp Hệ thống Nexus
Để trở thành một "Agent thực thụ", Nexus cần:
- **Tối ưu Episodic**: Không chỉ lưu log, mà phải chắt lọc "Lesson Learned" sau mỗi phiên (Done qua `Metacognition`).
- **Tối ưu Procedural**: Phân rã các kỹ năng phức tạp thành các file skill nhỏ gọn (Done qua `Agent_Skills`).

## 🎓 SUMMARY
Kiến trúc trí nhớ của AI Agent dựa trên khung CoALA gồm 4 loại: Working (ngắn hạn), Semantic (kiến thức), Procedural (kỹ năng) và Episodic (kinh nghiệm). Việc quản lý hiệu quả các loại trí nhớ này giúp Agent tiến hóa và thấu hiểu người dùng sâu sắc hơn.

---
*Related: [[Gemini_CLI_Memory_System]], [[Multi_Agent_AI_Systems]]*
---
domain: "IT_Knowledge"
type: "concept"
status: "active"
tags: [data-structure, algorithm, b-tree, indexing]
created: 2026-05-30
nexus_version: 6.0
---

# 🧠 B-TREE (BALANCED TREE) ARCHITECTURE

> "B-Tree giữ cho Database luôn cân bằng: Dù dữ liệu là 1 nghìn hay 1 tỉ dòng, số bước tìm kiếm gần như không thay đổi."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- Là cấu trúc lưu trữ mặc định của Index trong MySQL (InnoDB).
- Hỗ trợ tốt cho `=`, `>`, `<`, `BETWEEN`, và `ORDER BY`.

### 2. Patterns (Mô thức)
- **Tự cân bằng (Self-Balancing)**: Khi chèn dữ liệu mới, cây tự động sắp xếp lại để mọi lá (leaf) đều nằm ở cùng một độ sâu so với rễ (root).
- **Trang dữ liệu (Page-based)**: Tối ưu hóa để đọc từ ổ cứng. Mỗi Node (nhánh) chứa nhiều khóa thay vì chỉ 1 khóa như Binary Tree (Cây nhị phân).

### 3. Structures (Cấu trúc hệ thống)
- **Root Node**: Nút trên cùng.
- **Internal Nodes (Branch)**: Các nút trung gian làm nhiệm vụ "chỉ đường" (Ví dụ: Nếu < 50 rẽ trái, > 50 rẽ phải).
- **Leaf Nodes**: Các nút dưới cùng. Đối với **B+Tree** (phiên bản nâng cấp được dùng trong InnoDB), toàn bộ dữ liệu (hoặc con trỏ đến dữ liệu) chỉ nằm ở Leaf Nodes, và các Leaf Nodes được liên kết với nhau bằng danh sách liên kết kép (Double Linked List) để hỗ trợ quét tuần tự (Range Scan).

### 4. Mental Models (Tư duy cốt lõi)
- **"Logarithmic Scaling"**: Độ phức tạp tìm kiếm là $O(\log_b N)$. Với B-Tree của MySQL, ngay cả khi có 1 tỷ bản ghi, chiều cao của cây thường chỉ từ 3-5 tầng. Tức là chỉ cần 3-5 lần đọc đĩa là tìm ra dữ liệu.

---
*Back to [[MySQL_Index_Deep_Dive]]*
---
domain: IT_Knowledge
type: concept
status: active
tags: [pedagogy, psychology, learning-levels, blooms-taxonomy]
created: 2026-05-27
nexus_version: 6.0
---

# [[Blooms_Taxonomy]] (Thang đo Bloom)

## Tổng quan
**Thang đo Bloom** (Bloom's Taxonomy) là một khung phân loại các cấp độ tư duy của con người trong quá trình học tập, được Benjamin Bloom đưa ra năm 1956 và cập nhật năm 2001.

## 6 Cấp độ Nhận thức (Từ thấp đến cao)
1. **Nhớ (Remember)**: Khả năng nhắc lại thông tin, dữ kiện.
2. **Hiểu (Understand)**: Giải thích được ý nghĩa của thông tin.
3. **Áp dụng (Apply)**: Sử dụng kiến thức vào tình huống mới.
4. **Phân tích (Analyze)**: Chia nhỏ thông tin để hiểu cấu trúc và mối liên hệ.
5. **Đánh giá (Evaluate)**: Đưa ra phán quyết, lập luận dựa trên tiêu chuẩn.
6. **Sáng tạo (Create)**: Kết hợp các yếu tố để tạo ra cái mới, giải pháp mới.

## Ứng dụng trong Đặt câu hỏi
- Để kích hoạt [[Higher_Order_Thinking]], người hỏi cần chuyển dần từ cấp độ 1-2 sang cấp độ 4-6.
- Trong hệ thống Nexus, Agent sử dụng thang đo này để "chất vấn" John, đảm bảo John không chỉ dừng lại ở mức "Nhớ".

## Related
- [[Higher_Order_Thinking]]
- [[Question_Answer_Formats]]
- [[Improving_Question_Quality]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [sql, cte, readability, performance, subquery]
created: 2026-05-27
nexus_version: 6.0
---

# [[Common_Table_Expressions]] (CTE)

## 1. Tổng quan
**CTE (Common Table Expression)** là một tập kết quả tạm thời được định nghĩa trong phạm vi thực thi của một câu lệnh SQL duy nhất (`SELECT`, `INSERT`, `UPDATE`, `DELETE`).

## 2. Cấu trúc
```sql
WITH temp_table_name AS (
    SELECT ... -- Logic phức tạp
)
SELECT ... FROM temp_table_name;
```

## 3. Phân tích Đa chiều
- **Database (Readability)**: Giúp chia nhỏ câu query khổng lồ thành các module logic dễ đọc và bảo trì hơn nhiều so với Subquery lồng nhau.
- **Development (Java/JPA)**: Một số phiên bản cũ của Hibernate không hỗ trợ CTE trong HQL/JPQL. Khi đó, bạn phải dùng **Native Query**.
- **Operations (Performance)**: 
    - Trong hầu hết các DB hiện đại (PostgreSQL, SQL Server, MySQL 8.0+), CTE có hiệu suất tương đương Subquery.
    - Tuy nhiên, một số DB thực hiện "Materialize" (lưu tạm ra đĩa), có thể gây chậm nếu dữ liệu CTE quá lớn.

## Related
- [[SQL_Advanced_Filtering]]
- [[Relational_Data_Model]]
- [[Junction_Table]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [database-design, java, jpa, hibernate, surrogate-key, composite-key]
created: 2026-05-27
nexus_version: 6.0
---

# [[Composite_Key]] vs [[Surrogate_Key]] (Phân tích Đa chiều)

## 1. Góc nhìn Database (Logic & Integrity)
- **Composite Key (Khóa chính hỗn hợp)**:
    - **Ưu điểm**: Đảm bảo tính toàn vẹn dữ liệu ở mức quan hệ (ví dụ: một sinh viên không thể đăng ký một môn học 2 lần). Không cần tạo cột ID "giả".
    - **Nhược điểm**: Làm cho các câu lệnh JOIN trở nên phức tạp và dài dòng. Khóa ngoại ở các bảng khác cũng phải chứa nhiều cột, gây tốn tài nguyên lưu trữ và chỉ mục (index).

## 2. Góc nhìn Development (Java / JPA / Hibernate)
- **Độ phức tạp**: Trong Java (JPA), việc triển khai Composite Key BẮT BUỘC phải tạo thêm class `EmbeddedId` hoặc `IdClass`. Bạn phải override `equals()` và `hashCode()` một cách thủ công và chính xác.
- **Rủi ro**: Dễ phát sinh lỗi trong quá trình quản lý vòng đời Entity (Persistence Context). Code trở nên rườm rà, khó bảo trì (Boilerplate code).
- **Giải pháp ưu tiên**: Sử dụng một cột `id` duy nhất (thường là `Long` hoặc `UUID`) làm **[[Surrogate_Key]]**.

## 3. Góc nhìn Operations & Modern Industry
- **Tiêu chuẩn công nghiệp**: Hầu hết các hệ thống hiện đại ưu tiên dùng **Surrogate Key (ID tự tăng hoặc UUID)**.
- **Lý do**:
    - **Performance**: Index trên 1 cột số nguyên luôn nhanh hơn index trên nhiều cột (đặc biệt là cột chuỗi).
    - **Refactoring**: Dễ dàng thay đổi logic kinh doanh mà không ảnh hưởng đến cấu trúc khóa (ví dụ: nếu sau này cho phép đăng ký lại môn học, Composite Key sẽ bị gãy).
    - **Integration**: Dễ dàng tích hợp với các hệ thống khác qua REST API (trình bày `/students/1/courses/10` dễ hơn là truyền một bộ khóa phức tạp).

## 💡 Kết luận (Architect Decision)
Dùng **Surrogate Key (ID)** để làm khóa chính cho thực thể Java, và dùng **Unique Constraint** trên bộ các cột quan trọng để đảm bảo tính toàn vẹn dữ liệu phía Database. Đây là mô thức "vẹn cả đôi đường".

## Related
- [[Junction_Table]]
- [[Relational_Data_Model]]
- [[Java_Maven_Lombok]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [critical-thinking, evaluation, inquiry, logic]
created: 2026-05-27
nexus_version: 6.0
---

# [[Critical_Thinking]] (Tư duy Phản biện)

## Tổng quan
**Critical Thinking** là khả năng phân tích thông tin một cách khách quan và đưa ra những đánh giá có cơ sở logic. Đây không phải là sự "chỉ trích" mà là sự "chắt lọc" tri thức.

## Quy trình Thực hiện (5 Bước)
1. **Quan sát (Observe)**: Nhận diện vấn đề và dữ liệu đầu vào.
2. **Phân tích (Analyze)**: Chia nhỏ thông tin và tìm kiếm mối liên hệ (Sử dụng [[Goal_Decomposition]]).
3. **Chất vấn (Inquire)**: Đặt các [[Tactical_Questioning_Strategies]] (Ví dụ: "Tại sao giải pháp này lại tốt hơn giải pháp kia?").
4. **Đánh giá (Evaluate)**: Sử dụng các tiêu chuẩn như [[Source_Evaluation]] để kiểm tra độ tin cậy.
5. **Kết luận (Conclude)**: Đưa ra quyết định hoặc giải pháp dựa trên bằng chứng.

## Ứng dụng trong Nexus System
Hệ thống khuyến khích John sử dụng Critical Thinking để không chỉ "nhận" tri thức từ AI mà còn phải "thẩm định" và phản biện lại (Metacognition) để cùng nhau tiến hóa.

## Related
- [[Metacognition]]
- [[Higher_Order_Thinking]]
- [[Source_Evaluation]]
---
title: "Database Fundamentals: Chapter 1 - Databases and Database Users"
tags: [database, dbms, fundamentals, IT_Knowledge]
created: 2026-05-21
---

# Database Fundamentals: Chapter 1 - Databases and Database Users

## 1. Các Khái niệm Cơ bản (Introduction)
*   **Data (Dữ liệu):** Là những sự thật đã biết, có thể ghi chép lại và mang một ý nghĩa ngầm định nào đó.
*   **Database (CSDL):** Tập hợp các dữ liệu có liên quan, có tính thống nhất, có ý nghĩa và được thiết kế cho một mục đích cụ thể.
*   **DBMS (Hệ quản trị CSDL):** Hệ thống phần mềm máy tính giúp người dùng tạo, thao tác và bảo trì Database.
*   **Database System (Hệ CSDL):** Bao gồm cả Database (dữ liệu) và DBMS (phần mềm).

## 2. Đặc điểm của Phương pháp Database (Characteristics)
Thay vì dùng file truyền thống (File processing), DBMS mang lại 4 đặc tính cốt lõi:
1.  **Tính tự mô tả (Self-Describing):** Chứa sẵn định nghĩa về cấu trúc dữ liệu (meta-data/catalog). Nhờ đó giúp cho việc cập nhật hay thay đổi được dễ dàng thực hiện.
2.  **Độc lập Dữ liệu - Chương trình (Program-data independence) & Trừu tượng hóa (Data abstraction):** Đổi cấu trúc DB không cần viết lại code phần mềm. 
3.  **Hỗ trợ nhiều View (Góc nhìn):** Mỗi người dùng thấy một phần dữ liệu phù hợp với vai trò của họ.
4.  **Chia sẻ & Xử lý giao dịch (Sharing & Multiuser Transaction):** Cho phép nhiều người truy cập cùng lúc an toàn thông qua *Concurrency Control* và đảm bảo tính nguyên tử (Atomicity) của giao dịch.

## 3. Các "Diễn viên" tương tác với Database (Actors on the Scene)
*   **Database Administrators (DBA):** Quản trị viên, cấp quyền, theo dõi hệ thống.
*   **Database Designers:** Kiến trúc sư thiết kế cấu trúc DB trước khi triển khai.
*   **System Analysts & Application Programmers:** Lập trình viên viết code (VD: dùng Java) tạo ra các tính năng tương tác với DB.
*   **End Users (Người dùng cuối):**
    *   *Casual:* Dùng không thường xuyên, truy vấn phức tạp.
    *   *Naive / Parametric:* Dùng thường xuyên qua các nút/form đã lập trình sẵn (canned transactions). VD: Nhân viên giáo vụ.
    *   *Sophisticated:* Dùng công cụ DBMS tự viết truy vấn.
    *   *Standalone:* Dùng phần mềm cá nhân đóng gói sẵn.

## 4. Những người "sau cánh gà" (Workers behind the Scene)
Họ không thao tác trên dữ liệu thực tế mà xây dựng hệ thống:
*   **DBMS system designers:** Viết ra phần mềm như MySQL, Oracle...
*   **Tool developers:** Tạo phần mềm phụ trợ (vẽ sơ đồ, test).
*   **Operators:** Bảo trì phần cứng, server.

## 5. Các Lợi ích bổ sung của DBMS
*   **Kiểm soát Dư thừa (Controlling Redundancy):** Thông qua thiết kế **Data Normalization** để tránh lặp dữ liệu và sai lệch (Inconsistent).
*   **Hạn chế quyền (Restricting Unauthorized Access).**
*   **Lưu trữ bền vững (Persistent Storage):** Rất tốt cho các Object phức tạp trong Java/C++.
*   **Tối ưu tìm kiếm:** Dùng Indexes, Caching.
*   **Backup & Recovery:** Chống mất dữ liệu khi sập nguồn/phần mềm.
*   **Ép buộc Ràng buộc Toàn vẹn (Enforcing Integrity Constraints):** Ngăn chặn tạo dữ liệu sai luật (VD: Ngăn tạo mã SV trùng - Uniqueness constraint).

## 6. Khi nào KHÔNG NÊN dùng DBMS?
(Tránh "chi phí chìm" về phần cứng, nhân lực, tốc độ xử lý chậm do cồng kềnh)
*   Ứng dụng cực kỳ đơn giản, không bao giờ thay đổi cấu trúc.
*   Yêu cầu thời gian thực (Real-time) cực nhanh.
*   Hệ thống nhúng (Embedded systems) dung lượng quá hẹp.
*   Không có nhu cầu chia sẻ nhiều người dùng.
---
domain: IT_Knowledge
type: concept
status: active
tags: [database, index, b-tree, performance, scalability]
created: 2026-05-27
nexus_version: 6.0
---

# [[Database_Indexing_Fundamentals]] (Bản chất của Chỉ mục)

## 1. Index là gì? (Logic & Spatial)
Hãy tưởng tượng Database là một cuốn sách dày 1.000.000 trang.
- **Không có Index**: Để tìm một cụm từ, bạn phải lật từng trang từ đầu đến cuối (**Full Table Scan**). Độ phức tạp: $O(n)$.
- **Có Index**: Bạn lật đến trang cuối cùng của cuốn sách (Mục lục), tìm từ khóa đó và xem nó nằm ở trang bao nhiêu, sau đó lật thẳng đến đó. Độ phức tạp: $O(log n)$.

## 2. Cơ chế B-Tree (Cấu trúc dữ liệu cốt lõi)
Hầu hết các RDBMS (MySQL, PostgreSQL) sử dụng cấu trúc **B-Tree** (Balanced Tree) để lưu trữ Index.
- **Cân bằng**: Cây luôn tự cân bằng để đảm bảo mọi tìm kiếm đều có độ dài đường đi tương đương nhau.
- **Phân cấp**: Dữ liệu được chia thành các Node (Gốc -> Nhánh -> Lá).
- **Hiệu quả**: Với 1 triệu bản ghi, B-Tree chỉ cần khoảng **20 bước** (so sánh) để tìm ra kết quả, thay vì 1 triệu bước.

## 3. Tại sao Index `p.status` và `p.student_id` lại nhanh?
Trong câu lệnh: `WHERE p.status = 'success' AND p.student_id = 123`
- **Với `status`**: DB thu hẹp phạm vi tìm kiếm cực nhanh (chỉ lấy những vùng chứa 'success').
- **Với `student_id`**: Vì ID là duy nhất hoặc có tính phân loại cao, B-Tree sẽ dẫn thẳng đến địa chỉ vật lý của dòng dữ liệu đó trên đĩa cứng.

## 4. Phân tích Đa chiều
- **Database**: Index giúp tăng tốc độ đọc (`SELECT`), nhưng làm chậm tốc độ ghi (`INSERT`, `UPDATE`, `DELETE`) vì DB phải cập nhật lại cả cây B-Tree mỗi khi dữ liệu thay đổi.
- **Development (Java)**: Developer cần biết chọn cột nào để đánh Index (thường là các cột trong `WHERE`, `JOIN`, `ORDER BY`). Đánh Index bừa bãi sẽ làm phình dung dư thừa Database.
- **Operations**: Index là chìa khóa để **Scalability**. Một hệ thống không có Index sẽ sụp đổ khi dữ liệu đạt ngưỡng vài trăm ngàn dòng.

## Related
- [[Relational_Database_Fundamentals]]
- [[Surrogate_Key]]
- [[SQL_Aggregations]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [digital-skills, technology, information-management]
created: 2026-05-27
nexus_version: 6.0
---

# [[Digital_Literacy]] (Năng lực Số)

## Tổng quan
**Digital Literacy** là khả năng tìm kiếm, đánh giá, tạo ra và truyền đạt thông tin thông qua các nền tảng kỹ thuật số và công nghệ thông tin.

## Tầm quan trọng
Trong kỷ nguyên AI, Digital Literacy không chỉ là biết dùng máy tính, mà là biết cách tương tác với AI (Prompt Engineering), quản lý dữ liệu số (Personal Knowledge Management - PKM) và bảo mật thông tin cá nhân.

## Ứng dụng
- Sử dụng Gemini CLI để tự động hóa nghiên cứu.
- Quản lý Vault Obsidian theo mô hình PARA/Nexus.
- Phân tích và tổng hợp dữ liệu từ các nguồn Web/PDF.

## Related
- [[Information_Literacy]]
- [[Effective_Information_Search_Gathering]]
---
domain: IT_Knowledge
type: reference
status: active
tags: [research, information-gathering, information-literacy, digital-literacy]
created: 2026-05-27
source: "00_Raw/Tìm kiếm và thu thập thông tin.md"
nexus_version: 6.0
---

# [[Effective_Information_Search_Gathering]] (Cornell Notes)

| Cue | Notes |
| --- | --- |
| **Tìm kiếm Thông tin** | - Quy trình xác định và truy cập nguồn dữ liệu phù hợp (Internet, sách, CS dữ liệu chuyên ngành).<br>- Kỹ thuật: Xác định từ khóa chính xác + [[Source_Evaluation]] (Đánh giá độ tin cậy của nguồn). |
| **Thu thập Thông tin** | - Quy trình ghi nhận, lưu trữ và tổ chức thông tin để phân tích.<br>- Kỹ thuật: Ghi chú, tóm tắt + Sử dụng công cụ lưu trữ (Notion, Obsidian, Excel) + Phân loại hệ thống. |
| **[[Information_Literacy]]** | - Năng lực cốt lõi thế kỷ 21: Tìm kiếm, đánh giá và sử dụng thông tin hiệu quả.<br>- Nền tảng cho [[Critical_Thinking]] và học tập độc lập. |
| **[[Digital_Literacy]]** | - Khả năng sử dụng công cụ số để quản lý tri thức, đặc biệt quan trọng trong môi trường học trực tuyến. |
| **Ý nghĩa Thực tiễn** | - Giúp ra quyết định chính xác dựa trên dữ liệu.<br>- Nền tảng cho sự sáng tạo và tự nghiên cứu bền vững. |

## Summary
[[Effective_Information_Search_Gathering]] không chỉ dừng lại ở việc tìm thấy dữ liệu mà còn là nghệ thuật đánh giá nguồn và tổ chức thông tin có hệ thống. Đây là kỹ năng nền tảng giúp nâng cao [[Information_Literacy]] và hỗ trợ đắc lực cho tư duy phản biện.

## Related
- [[MOC_IT_Knowledge]]
- [[Effective_Information_Search]]
- [[Information_Literacy]]
- [[Digital_Literacy]]
- [[Source_Evaluation]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [research, search-techniques, productivity, information-literacy]
created: 2026-05-27
nexus_version: 6.0
---

# [[Effective_Information_Search]] (Kỹ thuật Tìm kiếm Thông tin Hiệu quả)

## 5 Trụ cột Tìm kiếm Thông minh
1. **Xác định mục tiêu và phạm vi**: Biết rõ *cái gì* cần tìm và *giới hạn* tìm kiếm để tránh lạc lối trong biển thông tin.
2. **Nguồn thông tin uy tín**: Ưu tiên các trang tài liệu chính thức (Official Docs), thư viện học thuật, hoặc các chuyên gia trong ngành.
3. **Bộ từ khóa (Keywords)**:
    - **Từ khóa chính**: Khái niệm cốt lõi.
    - **Từ khóa liên quan**: Các từ đồng nghĩa, thuật ngữ kỹ thuật liên quan để mở rộng kết quả.
4. **Tìm kiếm theo định dạng (Filetype)**: Sử dụng toán tử `filetype:pdf`, `filetype:ppt`, hoặc `filetype:doc` để tìm tài liệu chuyên sâu.
5. **Ký tự đặc biệt (Operators)**:
    - `" "` : Tìm chính xác cụm từ.
    - `-` : Loại trừ từ khóa không mong muốn.
    - `*` : Thay thế từ còn thiếu.
    - `site:` : Tìm kiếm trong một trang web cụ thể.

## Ứng dụng trong Nexus System
Hệ thống sử dụng các kỹ thuật này để thực hiện **Wiki-Expansion** và **Deep Research**, đảm bảo tri thức nạp vào Vault luôn chính xác và chất lượng nhất.

## Related
- [[Nexus_Efficiency]]
- [[Goal_Decomposition]]
- [[Surgical_Read_Protocol]]
---
domain: IT_Knowledge
type: reference
status: active
tags: [report-writing, business-communication, task-management, documentation]
created: 2026-05-27
source: "00_Raw/Viết báo cáo.md"
nexus_version: 6.0
---

# [[Effective_Report_Writing]] (Cornell Notes)

| Cue | Notes |
| --- | --- |
| **Quy trình 5 Bước** | 1. **Xác định mục tiêu**: Lý do viết (Tiến độ, Kết quả, Giải pháp).<br>2. **Lập dàn ý**: Cấu trúc [[Report_Structure]] (Mở - Thân - Kết).<br>3. **Thu thập dữ liệu**: Sử dụng các kỹ thuật [[Effective_Information_Search_Gathering]].<br>4. **Viết bản thảo**: Ngôn ngữ súc tích, minh chứng rõ ràng.<br>5. **Rà soát**: Kiểm tra logic, số liệu, tính chuyên nghiệp. |
| **Cấu trúc Cơ bản** | - **Head-Body-Tail**: Cầu nối từ dữ liệu thô sang thông tin có ích.<br>- **Thành phần**: Mục tiêu → Phương pháp → Kết quả → Khuyến nghị ([[Executive_Summary]]). |
| **Vai trò Quản trị** | - Theo dõi tiến độ & minh bạch hóa công việc.<br>- Hỗ trợ ra quyết định & hoạch định chiến lược. |
| **Ứng dụng Giáo dục** | - Chuẩn hóa kiến thức, biến dữ liệu thành hiểu biết.<br>- Giúp người đọc dễ dàng tiếp nhận logic nghiên cứu. |

## Summary
[[Effective_Report_Writing]] là quy trình chuyển hóa dữ liệu thô thành tri thức có cấu trúc thông qua 5 bước chặt chẽ. Việc áp dụng mô hình Head-Body-Tail giúp đảm bảo tính minh bạch, logic và hiệu quả trong việc báo cáo tiến độ học tập và nhiệm vụ công việc.

## Related
- [[MOC_IT_Knowledge]]
- [[Effective_Information_Search_Gathering]]
- [[Goal_Decomposition]]
- [[Report_Structure]]
- [[Executive_Summary]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [writing, management, communication]
created: 2026-05-27
nexus_version: 6.0
---

# [[Executive_Summary]] (Tóm tắt dành cho Quản lý)

## Tổng quan
**Executive Summary** là phần tóm lược ngắn gọn nhưng đầy đủ các điểm quan trọng nhất của một báo cáo lớn. Mục đích là để người đọc nắm bắt được bản chất mà không cần đọc toàn bộ tài liệu.

## Thành phần cốt lõi
- Vấn đề/Mục tiêu chính.
- Kết quả nổi bật.
- Kết luận và Đề xuất hành động quan trọng nhất.

## Ứng dụng
Trong hệ thống của John, mỗi khi Agent hoàn thành một chuỗi nhiệm vụ phức tạp (ví dụ: Ingest hàng loạt), Agent sẽ cung cấp một Executive Summary để John nắm bắt trạng thái Vault ngay lập tức.

## Related
- [[Effective_Report_Writing]]
- [[Report_Structure]]
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
---
nexus_version: 6.0
domain: "Database"
type: "concept"
status: "active"
tags: [sql, furama, systems-thinking, iceberg-model]
created: 2026-05-30
---

# 🧠 HỆ THỐNG CƠ SỞ DỮ LIỆU FURAMA RESORT

> "Dữ liệu không đơn thuần là các bảng, nó là huyết mạch phản ánh quy trình vận hành của một doanh nghiệp."

---

## 🏗️ THE ICEBERG ANALYSIS

### 1. Events (Phần nổi)
- Các bảng: `customers`, `employees`, `contracts`, `residences`.
- Các câu lệnh SQL: `CREATE TABLE`, `FOREIGN KEY`, `CHECK constraints`.
- Kết quả: Một database rỗng có cấu trúc sẵn sàng để lưu trữ dữ liệu resort.

### 2. Patterns (Mô thức lặp lại)
- **Mô thức liên kết (Linking Tables)**: Sử dụng các bảng trung gian như `residence_renttype_link` và `other_service_service_unit_link`. Đây là mô thức giải quyết quan hệ Many-to-Many hoặc tách biệt thuộc tính biến động (giá theo loại thuê).
- **Mô thức chuẩn hóa**: Tách biệt `customer_types`, `education_levels`, `roles` ra khỏi bảng chính để tránh dư thừa dữ liệu.

### 3. Structures (Cấu trúc hệ thống)
- **Ràng buộc toàn vẹn (Integrity)**: Sử dụng `RESTRICT` và `CASCADE` trong Foreign Keys để bảo vệ dữ liệu (ví dụ: không thể xóa khách hàng nếu họ đang có hợp đồng).
- **Business Logic trong DB**: Sử dụng `CHECK constraints` (ví dụ: `deposit > 0`, `end_date > start_date`). Điều này cho thấy tư duy: "Bảo vệ dữ liệu ngay từ tầng thấp nhất (Database) thay vì chỉ dựa vào App logic".

### 4. Mental Models (Tư duy cốt lõi)
- **"Single Source of Truth"**: Mỗi thông tin chỉ nằm ở một nơi duy nhất.
- **"Context-Driven Design"**: Thiết kế bảng dựa trên thực tế vận hành resort (thuê theo ngày/tháng/năm, dịch vụ đi kèm theo đơn vị tính).

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý 1: Định danh duy nhất (Entity Integrity)**: Mọi bảng đều có `id` AUTO_INCREMENT.
- **Nguyên lý 2: Mối quan hệ (Referential Integrity)**: Mối quan hệ giữa Con người (Customer/Employee) và Dịch vụ (Residence) thông qua Hợp đồng (Contract).

---

## 🔗 NEURAL MAPPING
- **Horizontal (Siblings)**: [[ACID_Properties]], [[Relational_Data_Model]].
- **Vertical (Foundations)**: [[Database_Fundamentals_Ch1]].
- **Cross-Domain (Nexus)**: 
    - **Japanese**: `contracts` (契約 - Keiyaku), `customers` (顧客 - Kokyaku).
    - **Java**: Tương ứng với các Entity classes trong mô hình 3 lớp.

---

## 📝 CORNELL SUMMARY
| Key Points | Detailed Notes |
|------------|----------------|
| Ràng buộc (Constraints) | Đảm bảo tính đúng đắn của dữ liệu ngay tại nguồn (Check, Unique, Not Null). |
| Bảng trung gian | Giải quyết sự phức tạp của việc thay đổi giá và dịch vụ đi kèm. |

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, gemini-cli, agent-skills]
created: 2026-05-11
keywords: []
---

# 🛠️ Gemini CLI Agent Skills Framework

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Cấu trúc Skill** | Gồm 4 phần chính: `SKILL.md` (chỉ dẫn), `scripts/` (mã thực thi), `assets/` (file tĩnh), `references/` (tài liệu chuyên sâu). |
| **SKILL.md** | Chứa `<instructions>` (mệnh lệnh chuyên gia) và `<available_resources>` (danh sách tài nguyên). |
| **Quy trình vận hành** | 1. **Kích hoạt**: `activate_skill(name)`.<br>2. **Tuân thủ**: Ưu tiên chỉ dẫn trong Skill hơn quy tắc chung.<br>3. **Thực thi**: Sử dụng script để xử lý tác vụ đặc thù. |
| **Ví dụ thực tế** | - `vault-curator`: Tự động hóa ingest.<br>- `n5-sensei`: Tra cứu ngữ pháp JLPT. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Agent Skills giúp Gemini CLI mở rộng khả năng từ một trợ lý chung thành một chuyên gia trong từng lĩnh vực cụ thể thông qua bộ chỉ dẫn và công cụ riêng biệt. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Gemini_CLI_Essentials]]
- [[vault-curator]]
- [[n5-sensei]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, gemini-cli, configuration]
created: 2026-05-11
keywords: []
---

# 🛠️ Gemini CLI Configuration & Project Rules

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes)                                                                         |
| :------------------------- | :-------------------------------------------------------------------------------------------------- |
| **Tệp GEMINI.md**          | "Bộ luật" của dự án, được commit vào Git. Quy định Framework, Naming conventions và Architecture.   |
| **Phân cấp GEMINI.md**     | - **Root**: Quy chuẩn toàn dự án.<br>- **Subdirectory**: Chỉ dẫn riêng cho module/thư mục cụ thể.   |
| **Quyền ưu tiên**          | Chỉ dẫn trong `GEMINI.md` có quyền cao nhất, ghi đè mọi thiết lập mặc định của AI.                  |
| **Tệp .geminiignore**      | Loại trừ file/thư mục khỏi ngữ cảnh AI (node_modules, .env, .git...) để tiết kiệm Token và bảo mật. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Hệ thống cấu hình của Gemini CLI đảm bảo AI luôn tuân thủ nghiêm ngặt các tiêu chuẩn của dự án và tối ưu hóa tài nguyên thông qua việc loại trừ các dữ liệu không cần thiết. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Gemini_CLI_Memory_System]]
- [[GEMINI.md]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, gemini-cli, optimization]
created: 2026-05-11
keywords: []
---

# 🛠️ Gemini CLI Context Efficiency (Binh pháp Tiết kiệm)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Tìm trước, Đọc sau** | Không đọc toàn bộ file. Dùng `grep_search` xác định vị trí, sau đó `read_file` theo dòng (`start_line`, `end_line`). |
| **Tính song song** | Thực hiện nhiều lệnh trong một lượt (turn) để giảm số lượt hội thoại và tiết kiệm token. |
| **Surgical Edits** | Sửa đổi chuẩn xác bằng `replace`. Cung cấp ngữ cảnh `old_string` vừa đủ nhưng duy nhất để tránh lỗi. |
| **Tránh dư thừa** | Dùng `/reset` khi ngữ cảnh quá dài. Giao tiếp ngắn gọn, tập trung vào kết quả kỹ thuật (No Chitchat). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Tối ưu hóa ngữ cảnh là chìa khóa để AI hoạt động thông minh và tiết kiệm chi phí. Luôn ưu tiên các thao tác tìm kiếm chính xác và thực thi song song. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[GEMINI.md]]
- [[Gemini_CLI_Core_Features]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, gemini-cli, features]
created: 2026-05-11
keywords: []
---

# 🛠️ Gemini CLI Core Features (Tính năng cốt lõi)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Plan Mode** | Chế độ nghiên cứu và lập kế hoạch an toàn. AI thiết kế giải pháp trước khi thực hiện thay đổi mã nguồn. |
| **Subagents** | Ủy thác các tác vụ lớn hoặc lặp lại (Refactor, Test) cho các đặc vụ chuyên biệt để giữ ngữ cảnh sạch. |
| **MCP Integration** | Kết nối với các công cụ và nguồn dữ liệu bên ngoài qua giao thức Model Context Protocol. |
| **Bảo mật** | Thực thi lệnh shell có kiểm soát, tự động bảo vệ `.env` và các file nhạy cảm. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Gemini CLI không chỉ là một chat-bot mà là một hệ thống công cụ mạnh mẽ hỗ trợ toàn bộ vòng đời phát triển phần mềm một cách an toàn và thông minh. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Gemini_CLI_Essential_Commands]]
- [[Gemini_CLI_MCP_Integration]]
---
domain: "IT"
type: "cheatsheet"
status: "active"
tags: [it, tools, gemini-cli, commands]
created: 2026-05-11
keywords: []
---

# 🛠️ Gemini CLI Essential Commands (Lệnh thiết yếu)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Thao tác File** | `read_file`, `replace`, `write_file`, `grep_search`. Ưu tiên thay đổi nhỏ và chính xác. |
| **Hệ thống & Web** | `run_shell_command`, `web_fetch`, `google_web_search` (tra cứu thông tin thời gian thực). |
| **Quản lý phiên** | `/reset` (xóa history), `/undo` (hoàn tác thay đổi code gần nhất). |
| **Công cụ mở rộng** | `activate_skill` (kích hoạt bộ kỹ năng), `invoke_agent` (ủy thác cho subagent). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Làm chủ các lệnh thiết yếu giúp tối ưu hóa khả năng tương tác giữa lập trình viên và AI, từ quản lý mã nguồn đến tra cứu tri thức trên web. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Gemini_CLI_Essentials]]
- [[Gemini_CLI_Context_Efficiency]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, gemini-cli, handbook]
created: 2026-05-11
keywords: []
---

# 🛠️ Gemini CLI: Cẩm nang Tác chiến

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Binh pháp Gemini** | Coi AI như "Phó tướng". Sử dụng Subagents để chia nhỏ nhiệm vụ và Skills để nâng cấp kiến thức chuyên sâu. |
| **Quy trình Tác chiến** | **Plan** (Thiết kế) -> **Act** (Thực hiện nhỏ, chính xác) -> **Validate** (Chạy test/lint ngay lập tức). |
| **Hệ thống Ghi nhớ** | Kết hợp 4 tầng bộ nhớ: Project, Subdirectory, Private và Global để quản lý tri thức bền vững. |
| **Tầm nhìn PARA** | Tích hợp hoàn hảo với hệ thống Obsidian PARA v3.0 để xây dựng [[LLM_Wiki]] cá nhân. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Gemini CLI là vũ khí tối thượng của lập trình viên hiện đại, kết hợp tư duy chiến lược và công cụ tự động hóa để chinh phục các mục tiêu kỹ thuật. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[LLM_Wiki]]
- [[GEMINI.md]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, gemini-cli, mcp]
created: 2026-05-11
keywords: []
---

# 🛠️ Gemini CLI MCP Integration (Kết nối ngoại giới)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **MCP là gì?** | Model Context Protocol. Giao thức chuẩn hóa để AI kết nối với các Server bên ngoài cung cấp tool và data. |
| **Default Servers** | **Google Search** (Tìm kiếm web), **FileSystem** (Thao tác file an toàn). |
| **Custom Servers** | Có thể cấu hình thêm các server bên thứ ba qua `config.json` để kết nối Database, GitHub, API... |
| **Lợi ích** | Mở rộng khả năng của AI vượt ra khỏi giới hạn của terminal, dùng chung công cụ cho nhiều loại LLM khác nhau. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| MCP là cầu nối tiêu chuẩn giúp Gemini CLI tương tác với toàn bộ hệ sinh thái kỹ thuật số, từ dữ liệu nội bộ đến các dịch vụ đám mây toàn cầu. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Gemini_CLI_Core_Features]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, gemini-cli, memory]
created: 2026-05-11
keywords: []
---

# 🛠️ Gemini CLI Memory System (Hệ thống ghi nhớ)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **4 Tầng bộ nhớ** | 1. **Project** (`GEMINI.md`).<br>2. **Subdirectory** (`sub/GEMINI.md`).<br>3. **Private** (`MEMORY.md` cục bộ).<br>4. **Global** (`~/.gemini/GEMINI.md`). |
| **Quy tắc định tuyến** | - Quy ước dự án -> **GEMINI.md** (Commit).<br>- Thiết lập máy/Ghi chú riêng -> **Private** (Ẩn).<br>- Sở thích cá nhân -> **Global** (Dùng chung). |
| **Công cụ quản lý** | `MEMORY.md` đóng vai trò là Index (MOC) cho các ghi chú cá nhân trong thư mục bộ nhớ private. |
| **Tính bảo mật** | Dữ liệu nhạy cảm hoặc cá nhân không bao giờ được commit vào repo nhờ sự phân cấp tầng bộ nhớ. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Hệ thống bộ nhớ thông minh giúp Gemini CLI ghi nhớ thói quen của John và quy tắc của dự án mà không vi phạm tính bảo mật hay gây tràn ngữ cảnh. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[GEMINI.md]]
- [[LLM_Wiki]]
---
domain: "IT"
type: "concept"
status: "active"
tags: []
created: 2026-05-12
keywords: []
---
# ☕ JAVA ARCHITECT — NEXUS v6.0 (MULTI-AGENT SYSTEM)
Dành riêng cho: John | Mục tiêu: Java Expert & System Design | Trạng thái: Phase 5 (DB & Persistence)

---

## 🏛️ NEXUS MULTI-AGENT PROTOCOL (Mandatory)

Mọi bài tập code hoặc lý thuyết phải được kiểm duyệt qua 3 lớp:

1. **GENERATOR (The Architect)**: 
   - Thiết kế bài tập theo hướng SOLID và Design Patterns.
   - **Mandate**: Luôn gắn kèm một "Scenario thực tế" (Ví dụ: "Hệ thống quản lý Furama").

2. **VERIFIER (The Compiler/Linter)**: 
   - Kiểm tra code của John. 
   - **Zero-Tolerance**: Lỗi đặt tên biến sai quy ước (CamelCase), thiếu `@Override`, hoặc vi phạm SRP = Lệnh "No-go". 
   - Bắt buộc John phải refactor cho đến khi đạt chuẩn Clean Code.

3. **ADVERSARY (The Bug Hunter)**: 
   - Sau khi code chạy đúng, Adversary sẽ đặt câu hỏi "What if?".
   - Ví dụ: "Điều gì xảy ra nếu `ArrayList` này có 1 triệu phần tử? Hiệu năng sẽ thế nào?".
   - Mục tiêu: Đạt được **Earned Confidence** về mặt performance và scalability.

---

## 🛠️ PHONG CÁCH NEXUS

- **IntelliJ Mastery**: Mỗi bài học phải kèm theo ít nhất 1 chiêu thức (Shortcut/Live Template) để tăng tốc độ code.
- **Refactoring Mindset**: Luôn yêu cầu John tối ưu hóa code sau khi đã làm chạy được.

---

## 📈 TRẠNG THÁI HỌC TẬP

- **Confident**: Code chạy được.
- **Earned**: Hiểu rõ tại sao code chạy và các rủi ro tiềm ẩn (vượt qua Adversary).
- **Architect**: Có khả năng thiết kế hệ thống tương tự từ đầu.

---
Java Architect Nexus v6.0 — "Write once, verify everywhere."
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, git, fullstack]
created: 2026-05-13
keywords: []
---

# 🛠️ Git Basics

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Git là gì?** | Hệ thống quản lý phiên bản phân tán (Distributed Version Control). Theo dõi lịch sử thay đổi mã nguồn. |
| **Các lệnh cơ bản** | - `git init`: Khởi tạo repo.<br>- `git clone`: Sao chép repo từ xa.<br>- `git add`: Đưa vào Staging Area.<br>- `git commit`: Lưu lịch sử.<br>- `git push`: Đẩy lên Remote. |
| **Repository (Kho)** | - **Local**: Trên máy cá nhân.<br>- **Remote**: Trên máy chủ (GitHub, GitLab). |
| **Staging Area** | Vùng đệm trung gian để chọn lọc các thay đổi trước khi chính thức lưu lại (commit). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Git là công cụ quản lý phiên bản thiết yếu cho lập trình viên, giúp phối hợp nhóm và quản lý lịch sử code một cách an toàn và hiệu quả. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Programming_Fundamentals]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [pedagogy, scaffolding, guided-learning]
created: 2026-05-27
nexus_version: 6.0
---

# [[Guided_Questioning]] (Hỏi dẫn dắt)

## Tổng quan
**Guided Questioning** là kỹ thuật sử dụng một chuỗi các câu hỏi có trình tự logic để dẫn dắt người học từng bước khám phá ra một khái niệm hoặc giải quyết một vấn đề phức tạp.

## Quy trình (Scaffolding)
1. **Câu hỏi nền tảng**: Xác định những gì người học đã biết.
2. **Câu hỏi gợi ý**: Gợi mở các hướng đi mới mà không đưa ra đáp án trực tiếp.
3. **Câu hỏi kết nối**: Giúp người học liên kết các mảnh thông tin lại với nhau.
4. **Câu hỏi kết luận**: Để người học tự phát biểu ra quy luật hoặc giải pháp.

## Ứng dụng trong Nexus System
Agent sử dụng chiến thuật này khi John gặp một bài toán Java khó. Thay vì đưa ra giải pháp ngay, Agent sẽ hỏi về cấu trúc dữ liệu, luồng xử lý và các logic con để John tự xây dựng nên thuật toán hoàn chỉnh.

## Related
- [[Tactical_Questioning_Strategies]]
- [[Work_Breakdown_Structure]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [education, pedagogy, cognitive-skills, blooms-taxonomy]
created: 2026-05-27
nexus_version: 6.0
---

# [[Higher_Order_Thinking]] (Tư duy Bậc cao)

## Tổng quan
**Higher-Order Thinking** (Tư duy Bậc cao) là mức độ nhận thức vượt ra khỏi việc ghi nhớ sự kiện cơ bản. Dựa trên thang đo Bloom (Bloom's Taxonomy), nó bao gồm các kỹ năng như Phân tích (Analyze), Tổng hợp (Synthesize/Create), và Đánh giá (Evaluate).

## Đặc điểm trong Đặt Câu hỏi
Để kích hoạt Tư duy Bậc cao, các câu hỏi cần:
- Yêu cầu người học giải thích **tại sao** một sự việc xảy ra.
- Yêu cầu ứng dụng kiến thức vào **tình huống mới** (How to apply).
- Đánh giá ưu nhược điểm của các giải pháp khác nhau.

## Lợi ích
- Phát triển kỹ năng giải quyết vấn đề.
- Tạo ra kiến thức nội tại sâu sắc hơn, khó bị quên lãng.
- Phù hợp với mục tiêu đào tạo các chuyên gia (như [[Java_Architect_Brain]]).

## Related
- [[Improving_Question_Quality]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, html, web-basics]
created: 2026-05-13
keywords: []
---

# 🌐 HTML Basics (Cấu trúc trang web)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **HTML là gì?** | HyperText Markup Language. Ngôn ngữ định dạng siêu văn bản để tạo khung cho trang web. |
| **Cấu trúc cơ bản** | `<!DOCTYPE html>` -> `<html>` -> `<head>` (meta/ẩn) -> `<body>` (hiển thị). |
| **Các thẻ danh sách** | - `<ul>`: Không thứ tự.<br>- `<ol>`: Có thứ tự.<br>- `<dl>`: Danh sách mô tả. |
| **Các thẻ bảng (Table)** | `tr` (hàng), `td` (ô dữ liệu), `th` (tiêu đề). Gộp ô: `rowspan`, `colspan`. |
| **GET vs POST** | - **GET**: Dữ liệu trên URL, dùng cho truy vấn.<br>- **POST**: Dữ liệu gửi ngầm, bảo mật hơn, dùng cho Form/dữ liệu lớn. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| HTML là bộ khung của mọi trang web. Nắm vững cấu trúc thẻ và phương thức truyền dữ liệu là bước đầu tiên để trở thành Web Developer. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[JavaScript_Basics]]
---
domain: IT_Knowledge
type: reference
status: active
tags: [question-quality, pedagogy, critical-thinking, assessment]
created: 2026-05-27
source: "00_Raw/Nâng cao chất lượng câu hỏi.md"
nexus_version: 6.0
---

# [[Improving_Question_Quality]] (Cornell Notes)

| Cue | Notes |
| --- | --- |
| **Mục đích** | - Nâng cao độ rõ ràng, tính chính xác và phù hợp với mục tiêu học tập.<br>- Khơi gợi tư duy thay vì chỉ kiểm tra ghi nhớ thuần túy.<br>- Tăng tính công bằng và hiệu quả đánh giá. |
| **Tiêu chí Câu hỏi Tốt** | - **Không mơ hồ**: Ngôn ngữ đơn giản, đơn nghĩa.<br>- **Bám sát mục tiêu**: Đo lường đúng kỹ năng cần đánh giá.<br>- **Khuyến khích [[Higher_Order_Thinking]]**: Hỏi "tại sao", "làm thế nào" thay vì chỉ "cái gì".<br>- **Đa dạng hình thức**: Trắc nghiệm, tự luận, case study. |
| **Phương pháp Nâng cao** | - **[[Peer_Review]]**: Đánh giá đồng nghiệp (hiệu quả cao nhất, Cohen's d = 1.68).<br>- **Đào tạo giảng viên**: Tăng kỹ năng thiết kế nhưng phụ thuộc chất lượng khóa học.<br>- **Thiết kế Đề thi Chuẩn hóa**: Phân bổ nhiều bài test nhỏ, bám sát mục tiêu. |
| **Rủi ro Cần tránh** | - Ngôn ngữ quá phức tạp làm giảm tự tin người học.<br>- Thiên lệch văn hóa trong ngữ cảnh đa ngôn ngữ.<br>- Quá lạm dụng trắc nghiệm gây thui chột tư duy phản biện. |

## Summary
Chất lượng câu hỏi quyết định chất lượng tư duy. Việc áp dụng các nguyên tắc thiết kế rõ ràng, kết hợp [[Peer_Review]] và hướng tới [[Higher_Order_Thinking]] giúp tạo ra một hệ thống đánh giá công bằng, chính xác và thực sự thúc đẩy sự phát triển của người học.

## Related
- [[MOC_IT_Knowledge]]
- [[Effective_Information_Search]]
- [[Higher_Order_Thinking]]
- [[Peer_Review]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [education, research, skill, information-literacy]
created: 2026-05-27
nexus_version: 6.0
---

# [[Information_Literacy]] (Năng lực Thông tin)

## Tổng quan
**Information Literacy** là khả năng nhận biết khi nào cần thông tin, đồng thời có khả năng tìm kiếm, đánh giá và sử dụng thông tin đó một cách hiệu quả để giải quyết vấn đề.

## Các thành phần cốt lõi
1. **Xác định (Identify)**: Hiểu rõ nhu cầu thông tin.
2. **Tìm kiếm (Find)**: Sử dụng các kỹ năng [[Effective_Information_Search]].
3. **Đánh giá (Evaluate)**: Phân tích độ tin cậy và tính khách quan của nguồn ([[Source_Evaluation]]).
4. **Áp dụng (Apply)**: Sử dụng thông tin để tạo ra tri thức mới hoặc giải quyết vấn đề.
5. **Đạo đức (Ethics)**: Sử dụng thông tin có trách nhiệm (trích dẫn, bản quyền).

## Vai trò trong Nexus System
Hệ thống giúp John nâng cao năng lực thông tin bằng cách lọc bỏ các dữ liệu rác và chỉ Ingest những tri thức chất lượng cao vào Vault.

## Related
- [[Digital_Literacy]]
- [[Effective_Information_Search_Gathering]]
- [[Source_Evaluation]]
---
domain: "IT_Knowledge"
type: "concept"
status: "active"
tags: [java, spring-boot, virtual-threads, backend, nexus-evolution]
created: 2026-05-29
nexus_version: 6.0
---

# [[Java_21_Enterprise_Evolution_2026]]

## 💡 CUES & KEYWORDS
- **Virtual Threads** (JEP 444)
- **Project Loom**
- **Structured Concurrency**
- **Generational ZGC**
- **Spring Boot 3.3/4.0**

## 📝 NOTES (Cornell Method)

### 1. Cuộc cách mạng Virtual Threads (Project Loom)
- **Bản chất**: Cho phép chạy hàng triệu luồng (threads) đồng thời với bộ nhớ cực thấp. 
- **Spring Boot 4.0 Integration**: Kích hoạt dễ dàng qua `spring.threads.virtual.enabled=true`.
- **Lợi ích**: Không còn cần code Reactive (WebFlux) phức tạp để đạt hiệu suất cao. Code đồng bộ (Rest Template, JDBC) giờ đây có thể scale tương đương không đồng bộ.

### 2. Structured Concurrency (Cấu trúc hóa đồng thời)
- **Khái niệm**: Coi nhiều tác vụ chạy song song là một đơn vị công việc duy nhất.
- **Ưu điểm**: Nếu một sub-task lỗi, các task khác tự động bị hủy (cancellation). Tránh tình trạng "thread leaks".

### 3. Generational ZGC (Garbage Collection thế hệ mới)
- **Mục tiêu**: Độ trễ cực thấp (< 1ms) cho các hệ thống Enterprise có RAM lớn.
- **Kích hoạt**: `-XX:+UseZGC -XX:+ZGenerational`.

### 4. Sequenced Collections (JEP 431)
- **API mới**: Cung cấp các phương thức nhất quán như `getFirst()`, `getLast()`, `reversed()` cho mọi Collection có thứ tự (List, Deque, LinkedHashSet).

## 🎓 SUMMARY
Java 21 kết hợp với Spring Boot 4.0 là tiêu chuẩn vàng cho năm 2026, tập trung vào việc tối ưu hóa hiệu suất đám mây (Cloud-native) và đơn giản hóa mô hình lập trình đồng thời thông qua Virtual Threads.

---
*Related: [[Java_JVM_Variables_DataTypes]], [[Java_3_Layer_Architecture]]*
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, architecture, web, 3-layer]
created: 2026-05-16
keywords: []
---

# 🏛️ 3-Layer Architecture (Kiến trúc 3 lớp)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **3-Layer là gì?** | Mô hình chia ứng dụng thành 3 tầng riêng biệt để quản lý code dễ dàng và tăng tính bảo trì. |
| **1. Presentation Layer** | (Controller) Tiếp nhận request từ user, validate sơ bộ và trả về response. |
| **2. Business Logic Layer** | (Service) Nơi xử lý các nghiệp vụ chính của ứng dụng. Cầu nối giữa Controller và Data Access. |
| **3. Data Access Layer** | (Repository/DAO) Tương tác trực tiếp với cơ sở dữ liệu (Database). |
| **Luồng dữ liệu** | User -> **Controller** -> **Service** -> **Repository** -> DB. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Việc chia lớp giúp tuân thủ nguyên tắc Single Responsibility. Nếu cần thay đổi Database, bạn chỉ cần sửa lớp Repository mà không ảnh hưởng đến Logic hay Giao diện. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_DI_IoC_Principles]]
- [[Java_Design_Principles]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, java, oop]
created: 2026-05-13
keywords: []
---

# ☕ Java Abstract Class & Interface

| 💡 Từ khóa / Câu hỏi (Cue)                        | 📝 Nội dung ghi chú (Notes)                                                                                                                                                          |
| :------------------------------------------------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **[[Java_Abstract_Interface\|Abstract Class]]?**  | **Lớp trừu tượng:** Khai báo với từ khóa `abstract`. Không thể tạo instance.<br>- Chứa cả method thường và abstract method.<br>- Ép lớp con phải `override` abstract method.         |
| **[[Java_Abstract_Interface\|Interface]] là gì?** | **Hợp đồng (Contract):** Chỉ chứa khai báo method (abstract) và hằng số (`public static final`).<br>- Hỗ trợ đa kế thừa hành vi.<br>- Java 8+: Có thêm `default` và `static` method. |
| **Abstract vs Interface**                         | - **Abstract:** Dùng cho quan hệ "is-a" (là một).<br>- **Interface:** Dùng cho quan hệ "can-do" (có khả năng).<br>Xem thêm: [[Java_Inheritance\|Kế thừa]].                           |
| **Default method?**                               | Method trong interface có thân hàm (từ Java 8). Giúp mở rộng interface mà không làm hỏng các class đã triển khai nó.                                                                 |
| **Khi nào dùng cái nào?**                         | - Dùng **Abstract Class** khi các lớp liên quan chặt chẽ.<br>- Dùng **Interface** khi các lớp không liên quan nhưng có chung hành vi.                                                |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Abstract Class và Interface là công cụ mạnh mẽ để thực hiện tính Trừu tượng ([[Java_OOP_Summary\|Abstraction]]). Hiểu rõ sự khác biệt giúp thiết kế hệ thống Java linh hoạt và dễ bảo trì. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Inheritance]]
- [[Java_Polymorphism_Casting]]
- [[Java_OOP_Summary]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, java, oop]
created: 2026-05-13
keywords: []
---

# ☕ Java Access Modifiers & Encapsulation

| 💡 Từ khóa / Câu hỏi (Cue)                      | 📝 Nội dung ghi chú (Notes)                                                                                                             |
| :---------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------- |
| **[[Java_Access_Modifiers\|Access Modifiers]]** | Quy định phạm vi truy cập: `private`, `default`, `protected`, `public`.                                                                 |
| **Phân biệt 4 loại?**                           | - **private:** Chỉ trong class.<br>- **default:** Trong cùng package.<br>- **protected:** Package + Subclass.<br>- **public:** Mọi nơi. |
| **[[Java_OOP_Summary\|Tính bao đóng]]?**        | Che giấu chi tiết cài đặt, bảo vệ dữ liệu. Thực hiện qua: `private` fields + `public` Getter/Setter.                                    |
| **Lợi ích Encapsulation**                       | - Bảo vệ dữ liệu (Validation trong setter).<br>- Tăng tính bảo trì (Thay đổi bên trong không ảnh hưởng bên ngoài).                      |
| **Immutable Object?**                           | Đối tượng không thể thay đổi trạng thái sau khi tạo (ví dụ: `String`). Thuộc tính `private final` và không có setter.                   |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Access Modifiers là công cụ để thực hiện tính Bao đóng. Đây là nguyên tắc nền tảng để xây dựng các Class an toàn và dễ kiểm soát trong Java. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Classes_Objects]]
- [[Java_OOP_Summary]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, intermediate, annotations]
created: 2026-05-16
keywords: []
---

# ☕ Java Annotations (Ghi chú mã nguồn)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Annotation là gì?** | Một dạng metadata cung cấp dữ liệu về chương trình nhưng không thuộc chính chương trình đó. Bắt đầu bằng ký tự `@`. |
| **Công dụng chính** | - Thông tin cho Compiler (ví dụ: `@Override`).<br>- Xử lý tại Compile-time (Sinh code tự động).<br>- Xử lý tại Runtime (Reflection - được Spring dùng rất nhiều). |
| **Các Annotation phổ biến** | - `@Override`: Đánh dấu phương thức ghi đè.<br>- `@Deprecated`: Cảnh báo phương thức lỗi thời.<br>- `@SuppressWarnings`: Tắt các cảnh báo từ compiler. |
| **Meta-Annotations** | Annotations dùng để định nghĩa Annotation khác:<br>- `@Target`: Phạm vi sử dụng (Method, Class...).<br>- `@Retention`: Tồn tại đến khi nào (Source, Class, Runtime). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Annotation giúp code gọn gàng hơn bằng cách thay thế các cấu hình XML phức tạp. Đây là "xương sống" của các framework hiện đại như Spring và Hibernate. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Learning_Log]]
- [[Java_Maven_Lombok]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, arrays]
created: 2026-05-13
keywords: []
---

# ☕ Java Arrays (Mảng)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Mảng là gì?** | Một cấu trúc dữ liệu dùng để lưu trữ danh sách các phần tử có cùng kiểu dữ liệu. Truy xuất nhanh thông qua chỉ số (index). |
| **Đặc điểm trong Java** | - Kích thước cố định sau khi khởi tạo.<br>- Các phần tử phải cùng [[Java_Variables_DataTypes\|kiểu dữ liệu]].<br>- Giá trị mặc định: `0` (số), `false` (boolean), `null` (đối tượng). |
| **Cú pháp khai báo** | - `type[] varName;` (Khai báo)<br>- `type[] varName = {val1, val2};` (Literal)<br>- `type[] varName = new type[n];` (Khởi tạo mảng động) |
| **Duyệt mảng** | - `for`: Dùng khi cần thao tác với index.<br>- `for-each`: Dùng khi chỉ cần lấy giá trị phần tử. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Mảng là nền tảng của cấu trúc dữ liệu. Cần lưu ý tính cố định của mảng trong Java so với tính linh hoạt của mảng trong JavaScript. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Variables_DataTypes]]
- [[Java_Collections_Framework]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, interfaces]
created: 2026-05-13
keywords: []
---

# ☕ Java Built-in Interfaces

| 💡 Từ khóa / Câu hỏi (Cue)                        | 📝 Nội dung ghi chú (Notes)                                                                                                  |
| :------------------------------------------------ | :--------------------------------------------------------------------------------------------------------------------------- |
| **[[Java_Abstract_Interface\|Interface]] là gì?** | Một bản thiết kế cho các lớp, chỉ chứa các phương thức trừu tượng (mặc định) mà lớp triển khai bắt buộc phải định nghĩa lại. |
| **Comparable**                                    | Interface dùng để định nghĩa thứ tự sắp xếp tự nhiên cho các đối tượng. Sử dụng phương thức `compareTo()`.                   |
| **Cloneable**                                     | Interface đánh dấu cho phép một đối tượng có thể được sao chép (copy) bằng phương thức `clone()`.                            |
| **Serializable**                                  | (Mở rộng) Interface đánh dấu cho phép đối tượng có thể được chuyển đổi thành luồng byte để lưu trữ hoặc truyền qua mạng.     |

<br>

| 🎯 Tổng kết (Summary)                                                                                                |
| :------------------------------------------------------------------------------------------------------------------- |
| Java cung cấp nhiều interface sẵn có để chuẩn hóa các hành vi phổ biến như so sánh, sao chép và tuần tự hóa dữ liệu. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Abstract_Interface]]
- [[Java_Collections_Framework]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, loops, fundamentals]
created: 2026-05-13
keywords: []
---

# ☕ Java Loops (Cấu trúc lặp)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Các loại vòng lặp** | - `for`: Biết trước số lần lặp, dùng index.<br>- `while`: Kiểm tra điều kiện trước, không biết rõ số lần lặp.<br>- `do...while`: Thực hiện ít nhất 1 lần trước khi kiểm tra điều kiện. |
| **break và continue** | - `break`: Thoát hoàn toàn khỏi vòng lặp hoặc switch.<br>- `continue`: Bỏ qua lần lặp hiện tại, chuyển sang lần lặp kế tiếp. |
| **for vs for-each** | - `for`: Linh hoạt, có thể thay đổi index, truy cập bất kỳ phần tử nào.<br>- `for-each`: Chỉ duyệt qua các giá trị, an toàn và ngắn gọn hơn cho [[Java_Collections_Framework\|Collection]]. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Vòng lặp là thành phần cốt lõi của logic lập trình. Chọn loại vòng lặp phù hợp giúp code tối ưu và dễ đọc hơn. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Programming_Fundamentals]]
- [[Java_Collections_Framework]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, methods, oop]
created: 2026-05-13
keywords: []
---

# ☕ Java Methods (Phương thức)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Method là gì?** | Một khối lệnh thực hiện nhiệm vụ cụ thể. Giúp tái sử dụng code và tuân thủ nguyên tắc Single Responsibility. |
| **Cấu pháp & Cách gọi** | `[Modifier] [ReturnType] [Name]([Params])`.<br>- **Non-static**: Gọi qua Object.<br>- **Static**: Gọi qua tên Class. |
| **Overloading** | Khả năng tạo nhiều phương thức cùng tên nhưng khác tham số (số lượng, kiểu dữ liệu, thứ tự). |
| **Bộ nhớ Stack & Heap** | - **Stack**: Lưu biến primitive và tham chiếu đối tượng.<br>- **Heap**: Lưu thực thể đối tượng thực tế và mảng. |
| **Tham trị vs Tham chiếu** | - **Tham trị**: Truyền bản sao giá trị (kiểu primitive).<br>- **Tham chiếu**: Truyền bản sao địa chỉ (kiểu Object), ảnh hưởng đến dữ liệu gốc. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Hiểu rõ cách hoạt động của Method và quản lý bộ nhớ (Stack/Heap) là chìa khóa để viết code Java hiệu quả và tránh các lỗi về tham chiếu. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Classes_Objects]]
- [[Java_JVM_Variables_DataTypes]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, oop, classes, objects]
created: 2026-05-13
keywords: []
---

# ☕ Java Classes & Objects (Lớp và Đối tượng)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **OOP là gì?** | Lập trình hướng đối tượng, tập trung vào Class và Object để mô hình hóa thực tế. Bao gồm 4 tính chất: [[Java_OOP_Summary\|Đóng gói, Trừu tượng, Kế thừa, Đa hình]]. |
| **Class vs Object** | - **Class**: Bản thiết kế (Blueprint).<br>- **Object**: Thực thể cụ thể (Instance) được tạo ra từ Class. |
| **Constructor** | Hàm khởi tạo đối tượng (dùng toán tử `new`). Tên trùng với Class, không có kiểu trả về. |
| **Từ khóa `this`** | Tham chiếu đến đối tượng hiện tại. Dùng để phân biệt thuộc tính và tham số, hoặc gọi Constructor khác. |
| **Constructor vs Method** | Constructor dùng để tạo đối tượng, Method dùng để thực hiện hành vi. Constructor không có kiểu trả về. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Class và Object là nền móng của Java. Hiểu rõ Constructor và các tính chất OOP giúp thiết kế hệ thống phần mềm linh hoạt và dễ bảo trì. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_OOP_Summary]]
- [[Java_Methods]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, collections, jcf]
created: 2026-05-13
keywords: []
---

# ☕ Java Collections Framework (JCF)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **JCF là gì?** | Hệ thống các Interface và Class cung cấp cấu trúc dữ liệu và thuật toán tối ưu. Giúp code gọn gàng, hiệu suất cao. |
| **Các Interface chính** | - **Collection**: Gốc (cha của List, Set, Queue).<br>- **Map**: Cặp key-value (không kế thừa Collection). |
| **List vs Set** | - **List**: Có thứ tự, cho phép trùng lặp (ArrayList, LinkedList).<br>- **Set**: Không thứ tự (thường), không trùng lặp (HashSet, TreeSet). |
| **ArrayList vs LinkedList** | - **ArrayList**: Mảng động, truy cập nhanh (O(1)), thêm/xóa chậm ở giữa.<br>- **LinkedList**: Danh sách liên kết kép, thêm/xóa nhanh (O(1)), truy cập chậm (O(n)). |
| **Map & Implementations** | - **HashMap**: Nhanh, không thứ tự.<br>- **TreeMap**: Sắp xếp theo key.<br>- **LinkedHashMap**: Giữ thứ tự chèn. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| JCF là công cụ không thể thiếu. Chọn đúng cấu trúc dữ liệu (List cho danh sách, Set cho tính duy nhất, Map cho tra cứu) giúp tối ưu hóa hiệu năng chương trình. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Arrays]]
- [[Java_Generics_Stack_Queue]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, dsa, solid, lsp, isp, composition]
created: 2026-05-16
keywords: []
---

# 🌀 SOLID & DSA: Composition vs Inheritance

| 💡 Chiến thuật Thiết kế | 📝 Chi tiết kỹ thuật (Notes) |
| :--- | :--- |
| **Composition (Hợp thành)** | Khai báo `private LinkedList<T> list` bên trong Stack. <br>- **Lợi ích**: Chỉ "show" ra những gì cần thiết (`push`, `pop`). <br>- **SOLID**: Tuân thủ **LSP** vì không làm hỏng hành vi của cha. |
| **Stack (LIFO)** | `push(T)` -> `list.addFirst(T)`<br>`pop()` -> `list.removeFirst()`<br>- **Hiệu năng**: $O(1)$ vì thao tác ở đầu danh sách liên kết. |
| **Interface Segregation (ISP)** | "Thay vì một Interface lớn, hãy dùng nhiều Interface nhỏ". <br>Ví dụ: Tách `Stackable` và `Queueable` thay vì gộp chung vào một Interface `List` khổng lồ. |
| **Dependency Inversion (DIP)** | Lớp `Service` nên nhận vào `Stackable` interface thay vì lớp `MyStack` cụ thể. |

<br>

| 🎯 Tư duy Architect: Composition Over Inheritance |
| :--- |
| Kế thừa (Inheritance) tạo ra mối quan hệ **"is-a"** (là một) rất chặt chẽ. Hợp thành (Composition) tạo ra mối quan hệ **"has-a"** (có một) linh hoạt hơn. <br>**Quy tắc vàng:** Chỉ kế thừa khi lớp con thực sự là một phiên bản đặc biệt của lớp cha và không từ chối bất kỳ hành vi nào của cha. |

---
**Related:**
- [[Java_DSA_LinkedList_OCP]]
- [[Java_Design_Principles]]
- [[Java_Abstract_Interface]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, oop, design-patterns]
created: 2026-05-15
keywords: []
---

# ☕ Java Design: Abstract vs Interface (LoL Example)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Abstract Class (is-a)** | Định nghĩa "Bản chất" (Identity). Ví dụ: `Champion` (có tên, máu, di chuyển). |
| **Interface (can-do)** | Định nghĩa "Khả năng" (Behavior). Ví dụ: `SkillCastable` (Fizz nhảy, Pantheon đâm lao). |
| **Tư duy thiết kế** | Dùng Abstract Class cho các thuộc tính/hành vi chung. Dùng Interface cho các hành vi tùy chọn mà nhiều loại đối tượng khác nhau có thể có. |
| **IntelliJ Shortcuts** | - `Alt + Insert`: Override Methods.<br>- `Ctrl + I`: Implement Methods. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Sử dụng ví dụ Liên Minh Huyền Thoại để phân biệt: Champion là Abstract Class (mọi tướng đều có), SkillCastable là Interface (chỉ những thực thể có chiêu thức mới có). |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_OOP_Summary]]
- [[Java_Abstract_Interface]]
- [[Java_Inheritance]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, design-principles, oop]
created: 2026-05-13
keywords: []
---

# ☕ Java Design Principles (Nguyên tắc thiết kế)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Cohesion (Gắn kết)** | Mức độ tập trung của class vào một nhiệm vụ duy nhất. Nên giữ Cohesion cao (dễ bảo trì, ít phụ thuộc). |
| **Consistency (Nhất quán)** | Sự đồng bộ trong đặt tên, logic và phong cách code giúp hệ thống dễ đoán và dễ đọc. |
| **Encapsulation (Đóng gói)** | Che giấu chi tiết triển khai, chỉ lộ giao diện cần thiết. Bảo vệ dữ liệu [[Java_Access_Modifiers\|Access Modifiers]]. |
| **Clarity (Rõ ràng)** | Code phải tường minh, không gây mơ hồ, giúp giảm chi phí học tập và bảo trì. |
| **Inheritance vs Aggregation** | - **Inheritance (is-a)**: Kế thừa bản chất.<br>- **Aggregation (has-a)**: Ưu tiên hơn vì linh hoạt, giảm ràng buộc chặt chẽ. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Thiết kế tốt dựa trên sự cân bằng giữa tính đóng gói, gắn kết và rõ ràng. Luôn ưu tiên thành phần (composition/aggregation) hơn kế thừa khi có thể. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_OOP_Summary]]
- [[Java_Design_LoL_Example]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, architecture, spring, dependency-injection]
created: 2026-05-16
keywords: []
---

# ☕ Dependency Injection (DI) & IoC Principles

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **IoC (Inversion of Control)** | Đảo ngược quyền điều khiển. Thay vì class tự tạo phụ thuộc, framework (Spring) sẽ quản lý và cung cấp chúng. |
| **DI (Dependency Injection)** | Một dạng của IoC, nơi các "phụ thuộc" (dependencies) được "tiêm" (inject) vào class thông qua Constructor, Setter hoặc Field. |
| **Lợi ích của DI** | - **Loose Coupling**: Giảm sự phụ thuộc cứng nhắc giữa các class.<br>- **Testability**: Dễ dàng thay thế Object thật bằng Mock Object khi unit test. |
| **3 Cách Inject trong Spring** | 1. **Constructor Injection** (Khuyên dùng - an toàn, immutable).<br>2. **Setter Injection** (Dùng cho phụ thuộc tùy chọn).<br>3. **Field Injection** (`@Autowired` - nhanh nhưng khó test). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| "Lập trình với Interface, không phải với Implementation" là tôn chỉ của DI. Hiểu rõ DI/IoC là chìa khóa để làm chủ Spring Framework và xây dựng hệ thống linh hoạt. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Abstract_Interface]]
- [[Java_Design_Principles]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, dsa, solid, srp]
created: 2026-05-16
keywords: []
---

# 🌀 DSA Thực chiến: CustomArrayList & SRP

| 💡 Cơ chế / Thuật toán | 📝 Chi tiết thực hiện (Notes) |
| :--- | :--- |
| **Thuật toán Resizing** | 1. **Kiểm tra**: Nếu `size == data.length`.<br>2. **Mở rộng**: Tạo `newArray` với size gấp đôi.<br>3. **Di tản**: `System.arraycopy` hoặc dùng vòng lặp để chuyển dữ liệu.<br>4. **Trỏ lại**: Gán `this.data = newArray`. |
| **Quản lý bộ nhớ (Heap)** | Mảng cũ không còn ai tham chiếu sẽ được **Garbage Collector (GC)** dọn dẹp để giải phóng bộ nhớ. |
| **Nguyên tắc SRP** | Phương thức `ensureCapacity()` (hoặc `grow()`) chỉ nên làm nhiệm vụ mở rộng mảng. Nó không quan tâm đến việc thêm giá trị gì vào mảng. |

<br>

| 🎯 Phân tích SOLID (SRP) |
| :--- |
| Một sai lầm phổ biến là nhét logic "mở rộng mảng" vào chung với phương thức `add()`. <br>**Đúng chuẩn:** `add()` gọi `ensureCapacity()`. Nếu cần mở rộng, `ensureCapacity()` mới thực hiện 3 bước bạn đã nêu. Điều này giúp code dễ bảo trì và tái sử dụng. |

---
**Related:**
- [[Java_Memory_Management]]
- [[Java_Arrays]]
- [[Java_Design_Principles]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, dsa, linkedlist, ocp, generics]
created: 2026-05-16
keywords: []
---

# 🌀 DSA Thực chiến: LinkedList & Nguyên tắc OCP

| 💡 Khái niệm / Cấu trúc | 📝 Chi tiết kỹ thuật (Notes) |
| :--- | :--- |
| **Lớp Node<T>** | Gồm `T data` (Dữ liệu linh hoạt) và `Node<T> next` (Tham chiếu đệ quy). |
| **Truy cập (Access)** | **Tuần tự (Sequential)**: Phải đi từ `head` và nhảy qua từng Node. Độ phức tạp: **O(n)**. |
| **Generics <T>** | Đảm bảo **Type Safety**. Giúp một cấu trúc dữ liệu dùng được cho mọi Object mà không cần ép kiểu (Casting). |
| **Nguyên tắc OCP** | Thiết kế Interface `List<T>` chung. `ArrayList` và `LinkedList` cùng triển khai (implements) Interface này. Khi cần đổi loại danh sách, code bên ngoài không cần thay đổi. |

<br>

| 🎯 So sánh Hiệu năng (Performance Trade-off) |
| :--- |
| - **ArrayList**: Truy cập nhanh $O(1)$, nhưng thêm/xóa ở đầu/giữa chậm vì phải dời mảng $O(n)$.<br>- **LinkedList**: Truy cập chậm $O(n)$, nhưng thêm/xóa ở đầu/giữa cực nhanh $O(1)$ (nếu đã có tham chiếu) vì chỉ cần đổi "mũi tên". |

---
**Related:**
- [[Java_Generics_Stack_Queue]]
- [[Java_Abstract_Interface]]
- [[Java_Design_Principles]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, functional-programming, lambda, stream]
created: 2026-05-16
keywords: []
---

# ☕ Java Functional Programming (Lambda & Stream)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Lambda Expression** | Cú pháp rút gọn để triển khai Functional Interface. Dạng: `(parameters) -> expression`. Giúp code ngắn gọn, dễ đọc. |
| **Functional Interface** | Interface chỉ có **duy nhất một** abstract method (ví dụ: `Runnable`, `Comparator`). Đánh dấu bằng `@FunctionalInterface`. |
| **Stream API là gì?** | Một pipeline xử lý các tập hợp dữ liệu theo phong cách declarative (khai báo). Không thay đổi dữ liệu gốc. |
| **Các thao tác Stream** | 1. **Intermediate** (trả về Stream): `filter()`, `map()`, `sorted()`.<br>2. **Terminal** (kết thúc Stream): `collect()`, `forEach()`, `count()`. |
| **Method Reference** | Cách viết cực ngắn cho Lambda khi chỉ gọi một phương thức có sẵn. Dạng: `ClassName::methodName` (ví dụ: `System.out::println`). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Chuyển từ tư duy Imperative (Làm như thế nào - for loop) sang Functional (Làm cái gì - stream) giúp giảm thiểu lỗi và tối ưu hóa việc xử lý dữ liệu lớn. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Collections_Framework]]
- [[Java_Learning_Log]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, generics, stack, queue]
created: 2026-05-13
keywords: []
---

# Java Generics, Stack & Queue

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Generic là gì?** | Cơ chế cho phép định nghĩa class, interface, method với kiểu dữ liệu chưa xác định. Kiểu cụ thể được truyền vào khi sử dụng (ví dụ: `List<String>`). |
| **Ưu điểm** | - Tái sử dụng code, giảm trùng lặp.<br>- An toàn kiểu dữ liệu (Type safety).<br>- Tránh ép kiểu thủ công khi lấy dữ liệu. |
| **Nhược điểm & Hạn chế** | - Không hỗ trợ kiểu nguyên thủy (phải dùng Wrapper class).<br>- Không thể tạo trực tiếp đối tượng (`new T()`).<br>- Không thể tạo biến `static` kiểu `T`. |
| **Stack (Ngăn xếp)** | Hoạt động theo nguyên tắc **FILO** (First In Last Out). Các phương thức chính: `push()`, `pop()`, `peek()`, `isEmpty()`. |
| **Queue (Hàng đợi)** | Hoạt động theo nguyên tắc **FIFO** (First In First Out). Các phương thức chính: `offer()`/`add()`, `poll()`, `peek()`. |
| **Các lớp triển khai Queue** | `LinkedList`, `PriorityQueue`, `ArrayDeque` (hiệu năng cao), `ConcurrentLinkedQueue`. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Generic tăng tính linh hoạt và an toàn cho code Java. Stack (FILO) và Queue (FIFO) là hai cấu trúc dữ liệu cơ bản được sử dụng rộng rãi, trong đó Queue có nhiều biến thể triển khai tùy mục đích (ưu tiên, hai đầu, đa luồng). |
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, java, oop]
created: 2026-05-13
keywords: []
---

# ☕ Java Inheritance (Kế thừa)

| 💡 Từ khóa / Câu hỏi (Cue)          | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                       |
| :---------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Kế thừa là gì? Mục đích?**        | **Định nghĩa:** Cơ chế subclass thừa hưởng thuộc tính/phương thức từ superclass.<br>**Mục đích:**<br>1. Tái sử dụng code.<br>2. Mở rộng chức năng.<br>3. Cho phép ghi đè (Override).              |
| **Đặc điểm kế thừa trong Java?**    | **Các dạng hỗ trợ:**<br>- *Single:* 1 cha - 1 con.<br>- *Multilevel:* Ông -> Cha -> Con.<br>- *Hierarchical:* 1 cha - nhiều con.<br>❌ **Lưu ý:** Không hỗ trợ đa kế thừa qua class.               |
| **Vì sao không hỗ trợ đa kế thừa?** | **Diamond Problem:** Xung đột khi nhiều cha có cùng phương thức.<br>**Giải pháp:** Sử dụng **Interface** để thay thế đa kế thừa.                                                                  |
| **Từ khóa `super` & `final`?**      | **`super`:** Gọi constructor/method/attribute của lớp cha.<br>**`final`:**<br>- *Class:* Chặn kế thừa.<br>- *Method:* Chặn Override.<br>- *Variable:* Hằng số.                                    |
| **Class Object là gì?**             | Lớp tổ tiên của mọi class trong Java.<br>**Method chính:**<br>- `toString()`: Mô tả đối tượng.<br>- `equals()`: So sánh đối tượng.<br>- `hashCode()`: Mã băm.<br>- `getClass()`: Thông tin class. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Kế thừa (`extends`) là cột trụ của OOP giúp xây dựng hệ thống phân cấp class. Cần nắm vững `super` để kết nối với cha và `final` để bảo mật cấu trúc class. |
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, io, serialization]
created: 2026-05-13
keywords: []
---

# Java Binary IO & Serialization

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Serialization là gì?** | Quá trình chuyển đổi đối tượng Java thành luồng byte (nhị phân) để lưu trữ hoặc truyền qua mạng. |
| **Deserialization là gì?** | Quá trình khôi phục đối tượng Java từ luồng byte đã được serialize. |
| **Transient dùng làm gì?** | Đánh dấu các biến **không được serialize**. Khi khôi phục, các biến này sẽ có giá trị mặc định. Thường dùng cho mật khẩu hoặc dữ liệu tạm thời. |
| **Lưu ý triển khai** | - Class phải `implements Serializable`.<br>- Nên khai báo `serialVersionUID`.<br>- Không serialize tài nguyên hệ thống (Thread, Socket). |
| **Các lớp IO chính** | - Ghi: `FileOutputStream` kết hợp `ObjectOutputStream`.<br>- Đọc: `FileInputStream` kết hợp `ObjectInputStream`. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Serialization là cơ chế quan trọng để duy trì trạng thái đối tượng. Cần lưu ý bảo mật (dùng `transient`) và tính tương thích phiên bản (`serialVersionUID`) khi triển khai. |
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, jvm, basics]
created: 2026-05-13
keywords: []
---

# ☕ Java JVM, Variables & Data Types

| 💡 Từ khóa / Câu hỏi (Cue)     | 📝 Nội dung ghi chú (Notes)                                                                                                                                                   |
| :----------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **[[Java_JVM_Variables_DataTypes\|JVM]] (Java Virtual Machine)** | Đọc byte code (.class) và hướng dẫn hệ điều hành thực hiện. Giúp Java đạt tính **WORA** (Write Once Run Anywhere).                                                            |
| **JRE vs JDK**                 | JRE = JVM + Thư viện (Lib). <br>JDK = JRE + Công cụ phát triển (Compiler, Debugger).                                                                                          |
| **Biến (Variable)**            | Đại diện cho vùng nhớ để lưu trữ dữ liệu. <br>- **Local:** trong phương thức (không giá trị mặc định).<br>- **Global/Instance:** trong class (có giá trị mặc định).           |
| **[[Java_Variables_DataTypes\|Kiểu dữ liệu (Primitive)]]**   | 4 nhóm chính:<br>1. Số nguyên: `byte`, `short`, `int`, `long`.<br>2. Số thực: `float`, `double`.<br>3. Ký tự: `char` (2 bytes, Unicode).<br>4. Logic: `boolean` (true/false). |
| **Conversion & Casting**       | - **Conversion:** Nhỏ sang lớn (ngầm định).<br>- **[[Java_Polymorphism_Casting\|Casting]]:** Lớn sang nhỏ (phải tường minh, có thể mất dữ liệu).                                                             |
| **Switch-case mới**            | Sử dụng `->` thay cho `:` (không cần `break`) hoặc dùng `yield` để trả về giá trị.                                                                                            |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| JVM là trái tim của Java, đảm bảo tính đa nền tảng. Hiểu rõ kiểu dữ liệu, cơ chế ép kiểu và quản lý biến là nền tảng cốt lõi để viết mã hiệu quả và tránh lỗi bộ nhớ. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Variables_DataTypes]]
- [[Java_Polymorphism_Casting]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, tools, maven, lombok]
created: 2026-05-16
keywords: []
---

# 🛠️ Java Maven & Lombok (Build Tools & Productivity)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Apache Maven** | Công cụ quản lý dự án và build tự động. Quản lý thư viện qua file `pom.xml`. |
| **Cấu trúc pom.xml** | - `groupId`: Định danh tổ chức.<br>- `artifactId`: Tên dự án.<br>- `version`: Phiên bản.<br>- `dependencies`: Nơi khai báo các thư viện cần dùng. |
| **Project Lombok** | Thư viện giúp dọn dẹp "Boilerplate code" (code lặp lại vô nghĩa) thông qua Annotations. |
| **Annotations Lombok** | - `@Getter` / `@Setter`: Tự sinh getter/setter.<br>- `@NoArgsConstructor` / `@AllArgsConstructor`: Tự sinh constructor.<br>- `@Data`: Tổng hợp của Getter, Setter, toString, equals, hashCode. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Maven giúp quản lý dependencies chuyên nghiệp, trong khi Lombok giúp code Java trở nên "sạch" và ngắn gọn như các ngôn ngữ hiện đại (Kotlin, Python). |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Annotations]]
- [[Git_Basics]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, memory, stack, heap, interview]
created: 2026-05-16
keywords: []
---

# ☕ Java Memory Management: Stack & Heap

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Stack Memory** | Lưu trữ các biến cục bộ (Local variables) và các lời gọi hàm (Method calls).<br>- Tự động giải phóng khi hàm kết thúc.<br>- Kích thước nhỏ, truy cập nhanh. |
| **Heap Memory** | Lưu trữ tất cả các đối tượng (Objects) và mảng (Arrays).<br>- Quản lý bởi Garbage Collector (GC).<br>- Kích thước lớn, tồn tại xuyên suốt ứng dụng nếu còn tham chiếu. |
| **Pass-by-value (Tham trị)** | Java **luôn luôn** truyền tham trị (Pass-by-value).<br>- Với Primitive: Truyền bản sao của giá trị.<br>- Với Object: Truyền bản sao của **địa chỉ vùng nhớ** (Reference). |
| **[[Java_Access_Modifiers\|Bao đóng (Encapsulation)]]** | Che giấu dữ liệu bên trong (`private`) và chỉ cho phép truy cập qua `public methods`. Đây là SRP ở cấp độ dữ liệu: Lớp tự chịu trách nhiệm bảo vệ trạng thái của nó. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Hiểu rõ sự khác biệt giữa Stack (vùng nhớ tạm) và Heap (vùng nhớ đối tượng) là chìa khóa để tránh lỗi `NullPointerException` và tối ưu hóa hiệu năng. Nhớ rằng Java chỉ truyền bản sao, nhưng với đối tượng, bản sao đó là địa chỉ nên ta vẫn có thể thay đổi thuộc tính của đối tượng gốc. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_JVM_Variables_DataTypes]]
- [[Java_Access_Modifiers]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, methods, oop]
created: 2026-05-13
keywords: []
---

# ☕ Java Methods (Phương thức)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Method là gì?** | Một khối lệnh thực hiện nhiệm vụ cụ thể. Giúp tái sử dụng code và tuân thủ nguyên tắc Single Responsibility. |
| **Cấu pháp & Cách gọi** | `[Modifier] [ReturnType] [Name]([Params])`.<br>- **Non-static**: Gọi qua Object.<br>- **Static**: Gọi qua tên Class. |
| **Overloading** | Khả năng tạo nhiều phương thức cùng tên nhưng khác tham số (số lượng, kiểu dữ liệu, thứ tự). |
| **Bộ nhớ Stack & Heap** | - **Stack**: Lưu biến primitive và tham chiếu đối tượng.<br>- **Heap**: Lưu thực thể đối tượng thực tế và mảng. |
| **Tham trị vs Tham chiếu** | - **Tham trị**: Truyền bản sao giá trị (kiểu primitive).<br>- **Tham chiếu**: Truyền bản sao địa chỉ (kiểu Object), ảnh hưởng đến dữ liệu gốc. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Hiểu rõ cách hoạt động của Method và quản lý bộ nhớ (Stack/Heap) là chìa khóa để viết code Java hiệu quả và tránh các lỗi về tham chiếu. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Classes_Objects]]
- [[Java_JVM_Variables_DataTypes]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, oop]
created: 2026-05-13
keywords: []
---

# ☕ Java OOP Summary

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                     |
| :------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **OOP là gì?**             | Lập trình hướng đối tượng, tập trung vào **[[Java_Classes_Objects\|Class]]** (bản thiết kế) và **Object** (thực thể). Gói gọn dữ liệu và hành vi.                                                                         |
| **4 Tính chất cơ bản**     | 1. **[[Java_Access_Modifiers\|Encapsulation]]**: Đóng gói, bảo mật.<br>2. **[[Java_Abstract_Interface\|Abstraction]]**: Trừu tượng hóa, ẩn chi tiết.<br>3. **[[Java_Inheritance\|Inheritance]]**: Kế thừa, tái sử dụng.<br>4. **[[Java_Polymorphism_Casting\|Polymorphism]]**: Đa hình. |
| **Constructor**            | Hàm khởi tạo đối tượng (gọi qua `new`).<br>- Cùng tên với class, không kiểu trả về.<br>- Có thể Overload. Xem: [[Java_Methods\|Methods]].<br>- Gọi `this()` hoặc `super()` ở dòng đầu tiên.                                     |
| **Ưu & Nhược điểm**        | - **Ưu:** Dễ quản lý, mở rộng, bảo trì hệ thống lớn.<br>- **Nhược:** Tốn tài nguyên, chậm hơn POP, thiết kế phức tạp.                                                                           |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| OOP là xương sống của Java, giúp mô hình hóa thực tế vào phần mềm. Việc làm chủ 4 tính chất cơ bản và cơ chế Constructor là chìa khóa để thiết kế hệ thống linh hoạt và bền vững. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Classes_Objects]]
- [[Java_Inheritance]]
- [[Java_Polymorphism_Casting]]
- [[Java_Abstract_Interface]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, oop, polymorphism, casting]
created: 2026-05-13
keywords: []
---

# ☕ Java Polymorphism & Casting (Đa hình)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **[[Java_OOP_Summary\|Tính đa hình]] là gì?** | Khả năng một hành động được thực hiện theo nhiều cách khác nhau tùy đối tượng. Thể hiện qua Overriding (Runtime) và Overloading (Compile-time). |
| **Overriding (Ghi đè)** | Lớp con định nghĩa lại phương thức lớp cha (cùng tên, tham số, kiểu trả về). Tăng tính linh hoạt và thay đổi hành vi ở lớp con. Xem thêm: [[Java_Inheritance\|Kế thừa]]. |
| **Overloading vs Overriding** | - **Overloading:** Cùng tên, khác tham số, cùng lớp.<br>- **Overriding:** Giống hệt tên & tham số, khác lớp (cha-con). |
| **Ép kiểu (Casting)** | Chuyển đổi giữa các kiểu dữ liệu.<br>- **Widening (Nhỏ -> Lớn):** Ngầm định, an toàn.<br>- **Narrowing (Lớn -> Nhỏ):** Tường minh, có thể mất dữ liệu. |
| **Ép kiểu đối tượng** | - **Upcasting:** Con -> Cha (ngầm định).<br>- **Downcasting:** Cha -> Con (tường minh, dùng `instanceof` để tránh lỗi). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Đa hình giúp code linh hoạt và dễ mở rộng. Khi làm việc với đa hình và ép kiểu, cần đặc biệt lưu ý sự khác biệt giữa thời điểm biên dịch (Compile-time) và thực thi (Runtime) để tránh lỗi `ClassCastException`. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Inheritance]]
- [[Java_Abstract_Interface]]
- [[Java_OOP_Summary]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, oop, polymorphism, dynamic-binding]
created: 2026-05-15
keywords: []
---

# Java Insight: Dynamic Binding

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Dynamic Binding là gì?** | (Liên kết động) Cơ chế Java xác định phương thức cần gọi tại thời điểm chạy (**Runtime**) dựa trên thực thể (Instance) thực tế. |
| **Cơ chế hoạt động** | Trình biên dịch chỉ kiểm tra kiểu dữ liệu của biến (Reference Type), nhưng JVM sẽ thực thi mã của đối tượng thực sự (Object Type) mà biến đang trỏ tới. |
| **Ví dụ Fizz vs Pantheon** | `champion.basicAttack()` sẽ gọi `Fizz.basicAttack()` nếu biến `champion` đang giữ instance của `Fizz`. |
| **IntelliJ Tip** | - `Ctrl + B`: Nhảy tới định nghĩa.<br>- `Ctrl + Alt + B`: Xem tất cả các class triển khai (Implementations). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Dynamic Binding là "phép thuật" đằng sau tính đa hình, cho phép mã nguồn xử lý các đối tượng một cách tổng quát nhưng vẫn giữ được hành vi đặc thù của từng đối tượng cụ thể tại Runtime. |
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, algorithms, search]
created: 2026-05-13
keywords: []
---

# ☕ Java Search Algorithms

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Tìm kiếm Tuyến tính** | Duyệt từng phần tử từ đầu đến cuối. <br>- **Độ phức tạp:** O(n).<br>- **Dữ liệu:** Không cần sắp xếp. |
| **Tìm kiếm Nhị phân** | Chia để trị trên tập dữ liệu **đã sắp xếp**. So sánh phần tử giữa để thu hẹp phạm vi.<br>- **Độ phức tạp:** O(log n).<br>- **Dữ liệu:** Bắt buộc đã sắp xếp. Xem [[Java_Arrays\|Arrays]]. |
| **Hashing (Băm)** | Dùng hàm băm để truy cập trực tiếp qua chỉ số.<br>- **Độ phức tạp:** Trung bình O(1).<br>- **Ưu điểm:** Cực nhanh cho dữ liệu lớn. Xem [[Java_Collections_Framework\|Collections]]. |
| **Tree Search** | Dữ liệu lưu trong cây (như BST).<br>- **Độ phức tạp:** O(log n) nếu cây cân bằng. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Tùy vào cấu trúc và trạng thái dữ liệu (đã sắp xếp hay chưa) để chọn thuật toán tối ưu. Tìm kiếm nhị phân và Hashing là hai lựa chọn hàng đầu cho hiệu năng cao với tập dữ liệu lớn. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Arrays]]
- [[Java_Collections_Framework]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, static, memory]
created: 2026-05-13
keywords: []
---

# ☕ Java Static Keyword

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Từ khóa [[Java_Static_Keyword\|static]]** | Dùng để khai báo thành phần thuộc về **Class**, không thuộc về instance cụ thể. Dùng chung cho tất cả đối tượng. |
| **Biến static** | Lưu trong vùng nhớ **Metaspace** (Java 8+). Khởi tạo một lần duy nhất khi class được nạp. Xem thêm: [[Java_JVM_Variables_DataTypes\|Vùng nhớ JVM]]. |
| **Phương thức static** | Có thể gọi trực tiếp qua tên lớp: `ClassName.methodName()`. Không thể truy cập các thành phần non-static trực tiếp. |
| **Ràng buộc static** | - Không dùng được `this` hoặc `super`.<br>- Chỉ gọi được các thành phần static khác trực tiếp. |
| **Quản lý vùng nhớ** | - **Local variable:** Stack.<br>- **Instance variable:** Heap.<br>- **Static variable:** Metaspace. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| `static` giúp tiết kiệm bộ nhớ cho các dữ liệu dùng chung và cung cấp các phương thức tiện ích (Utility methods). Tuy nhiên, cần cẩn trọng vì nó có thể gây khó khăn cho việc Unit Test và vi phạm tính đóng gói nếu lạm dụng. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_JVM_Variables_DataTypes]]
- [[Java_Classes_Objects]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, string, regex]
created: 2026-05-13
keywords: []
---

# ☕ Java String & Regex

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **String Pool là gì?** | Vùng nhớ đặc biệt trong Heap để lưu trữ các chuỗi ký tự, giúp tối ưu hóa bộ nhớ. |
| **String vs StringBuilder** | - **String**: Bất biến (Immutable).<br>- **StringBuilder**: Có thể thay đổi, hiệu năng cao khi nối chuỗi. |
| **StringBuffer** | Tương tự StringBuilder nhưng **Thread-safe** (an toàn cho đa luồng). |
| **Regex** | Công cụ mạnh mẽ để kiểm tra định dạng chuỗi (Email, SĐT...). Xem [[Programming_Fundamentals\|Cơ bản]]. |
| **Cú pháp Regex** | `\d` (số), `\w` (chữ), `\s` (khoảng trắng), `+` (1+), `*` (0+), `^` (đầu), `$` (cuối). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Hiểu rõ String Pool và sự khác biệt giữa các lớp xử lý chuỗi giúp tối ưu hiệu suất ứng dụng. Regex là kỹ năng không thể thiếu để xử lý và validate dữ liệu đầu vào. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Programming_Fundamentals]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, convention, style-guide]
created: 2026-05-13
keywords: []
---

# ☕ Java Style Guide (Quy ước viết code)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Encoding & Ký tự** | - Luôn dùng **UTF-8**.<br>- Căn lề dùng **khoảng trắng** (space), không dùng Tab. |
| **Quy tắc đặt tên** | - **Class**: `UpperCamelCase` (danh từ).<br>- **Method/Variable**: `lowerCamelCase` (động từ cho method).<br>- **Constant**: `UPPER_SNAKE_CASE`. |
| **Cấu trúc file** | Package -> Imports (không wildcard) -> Duy nhất 1 Top-level Class. |
| **Dấu ngoặc móc `{}`** | Luôn sử dụng kể cả khi chỉ có 1 dòng lệnh. Không ngắt dòng trước dấu `{`. |
| **Độ dài dòng & Căn lề** | - Giới hạn **100 ký tự** mỗi dòng.<br>- Căn lề thụt lùi **4 khoảng trắng**. |
| **Xử lý Exception** | Không bao giờ bỏ trống khối `catch`. Nếu cố ý không làm gì, phải có comment giải thích. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Tuân thủ Style Guide (dựa trên Google Java Style) giúp code chuyên nghiệp, dễ đọc và dễ bảo trì trong môi trường làm việc nhóm tại Nhật Bản. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Methods]]
- [[Java_Classes_Objects]]
---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, basics, variables]
created: 2026-05-11
keywords: []
---

# ☕ Java Variables & Data Types (Cơ bản)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Biến (Variable)** | "Chiếc hộp" chứa dữ liệu. Khai báo: `Type Name = Value;`. Java là ngôn ngữ định kiểu mạnh. |
| **4 Kiểu dữ liệu chính** | 1. **int**: Số nguyên (1, 2, -5).<br>2. **double**: Số thực (3.14).<br>3. **boolean**: logic (true/false).<br>4. **String**: Chuỗi văn bản (kiểu Object, viết hoa S). |
| **Live Templates (IntelliJ)** | - `psvm`: Tạo hàm main.<br>- `sout`: Tạo lệnh in ra màn hình. |
| **Shortcut quan trọng** | `Shift + F10`: Chạy chương trình ngay lập tức. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Nắm vững cách khai báo biến và các kiểu dữ liệu cơ bản là bước đầu tiên để chinh phục Java. Hãy tận dụng Live Templates trong IntelliJ để tăng tốc độ code. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Learning_Log]]
- [[Java_JVM_Variables_DataTypes]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, javascript, web-basics]
created: 2026-05-13
keywords: []
---

# 🌐 JavaScript Basics

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Biến: let vs var vs const** | - **let**: Block scope, không thể khai báo lại.<br>- **var**: Function scope, có thể khai báo lại.<br>- **const**: Hằng số, buộc gán giá trị khi khởi tạo. |
| **Kiểu dữ liệu** | - **Nguyên thủy**: number, string, boolean, null, undefined, symbol, bigint.<br>- **Tham chiếu**: Object, Array, Function. |
| **Câu lệnh điều khiển** | - **Rẽ nhánh**: `if...else`, `switch` (so sánh nghiêm ngặt `===`).<br>- **Vòng lặp**: `for` (index), `for...in` (key), `for...of` (value), `while`, `do...while`. |
| **Jump Statements** | `break` (thoát), `continue` (bỏ qua), `return` (trả về), `throw` (ngoại lệ). |
| **OOP trong JS** | Gói gọn dữ liệu và hành vi vào Object và Class. 4 tính chất: [[Java_OOP_Summary\|Đóng gói, Trừu tượng, Đa hình, Kế thừa]]. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| JavaScript là ngôn ngữ linh hoạt cho Web. Hiểu rõ scope của biến, các kiểu dữ liệu và cấu trúc điều khiển là nền tảng để học các Framework hiện đại. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[HTML_Basics]]
- [[Java_OOP_Summary]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [database-design, junction-table, many-to-many, metadata]
created: 2026-05-27
nexus_version: 6.0
---

# [[Junction_Table]] (Bảng trung gian)

## Tổng quan
**Junction Table** (hay Associative Table) là giải pháp kỹ thuật để thực thi quan hệ **Nhiều - Nhiều (n-n)** trong CSDL quan hệ.

## Thành phần cấu tạo
1. **Khóa ngoại A**: Trỏ về bảng thứ nhất.
2. **Khóa ngoại B**: Trỏ về bảng thứ hai.
3. **[[Composite_Key]]**: Thường dùng sự kết hợp của 2 khóa ngoại trên làm khóa chính.
4. **Metadata (Thông tin bổ sung)**: Các thuộc tính phát sinh từ mối quan hệ (Ví dụ: Ngày đăng ký, Trạng thái, Điểm số).

## Ví dụ: `student_regiested_course`
Dựa trên thiết kế của John:
- `student_id` (FK)
- `course_id` (FK)
- `start_course`, `end_course` (Metadata)
- `status` (Metadata)

## Related
- [[Many_To_Many_Relationship]]
- [[One_To_Many_Relationship]]
- [[Composite_Key]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, ai, llm, rag, wiki, karpathy]
created: 2026-04-28
keywords: []
---

# 🧠 LLM Wiki (Tư duy quản trị tri thức)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **LLM Wiki là gì?** | Hệ thống quản lý kiến thức cá nhân bền vững. AI đọc tài liệu thô một lần để xây dựng mạng lưới Markdown liên kết, thay vì chỉ tìm kiếm tức thời như [[RAG_Retrieval_Augmented_Generation\|RAG]]. |
| **3 Lớp cấu trúc** | 1. **Raw Sources**: Tài liệu gốc (PDF, ảnh, web).<br>2. **Wiki**: Các file Markdown liên kết (cấu trúc PARA).<br>3. **Schema**: Quy tắc vận hành (ví dụ: [[GEMINI.md]]). |
| **Ưu điểm vs RAG** | - **Tính tích lũy**: Tri thức càng dày càng thông minh.<br>- **Liên kết chéo**: Tự động kết nối các khái niệm rời rạc.<br>- **Kiểm soát**: Dữ liệu nằm cục bộ trong [[Obsidian]]. |
| **Workflow** | **Ingest** (Hấp thụ) -> **Update** (Cập nhật Wiki) -> **Lint** (Rà soát lỗi liên kết/mâu thuẫn). |
| **Triết lý Karpathy** | "Obsidian là IDE, LLM là lập trình viên, Wiki là Codebase". Bạn chỉ cần đưa dữ liệu vào và đặt câu hỏi. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| LLM Wiki chuyển từ tư duy "Tìm kiếm" sang tư duy "Xây dựng hệ thống tri thức". Đây là cách tối ưu để học tập và quản lý dự án lâu dài với sự hỗ trợ của AI. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[GEMINI.md]]
- [[RAG_Retrieval_Augmented_Generation]]
- [[Obsidian]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [database-design, relationships, junction-table, many-to-many]
created: 2026-05-27
nexus_version: 6.0
---

# [[Many_To_Many_Relationship]] (Quan hệ Nhiều - Nhiều)

## Tổng quan
Quan hệ **n - n (Many-to-Many)** xảy ra khi nhiều bản ghi ở bảng A có thể liên kết với nhiều bản ghi ở bảng B. 
*Ví dụ: Một Học viên có thể học nhiều Lớp, và một Lớp có nhiều Học viên.*

## Giải pháp: Bảng Trung gian (Junction Table)
RDBMS không thể biểu diễn trực tiếp quan hệ n-n. Ta phải tách nó thành hai quan hệ 1-n thông qua một **Bảng trung gian**.

### Cấu trúc Bảng trung gian
Bảng này thường chứa ít nhất 2 cột:
1. `table_a_id` (Khóa ngoại trỏ về bảng A).
2. `table_b_id` (Khóa ngoại trỏ về bảng B).
*Hai cột này thường kết hợp lại thành một [[Composite_Key]] (Khóa chính hỗn hợp).*

## Tại sao phải dùng bảng trung gian?
- Tránh trùng lặp dữ liệu cực lớn.
- Đảm bảo tính linh hoạt (có thể thêm/xóa liên kết mà không ảnh hưởng đến dữ liệu gốc của A hoặc B).

## Related
- [[One_To_Many_Relationship]]
- [[Relational_Data_Model]]
- [[Composite_Key]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, documentation, markdown]
created: 2026-04-28
keywords: []
---

# 🛠️ Markdown (Ngôn ngữ đánh dấu)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Markdown là gì?** | Ngôn ngữ đánh dấu nhẹ, cú pháp văn bản thô, dễ đọc, dễ viết. |
| **Tại sao dùng cho Wiki?** | - **AI dễ đọc**: Cấu trúc thuần túy, dễ trích xuất dữ liệu.<br>- **Tính di động**: Mở được trên mọi trình soạn thảo. |
| **Ứng dụng** | Soạn thảo tài liệu trong [[Obsidian]], GitHub, và các hệ thống Documentation kỹ thuật. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Markdown là tiêu chuẩn vàng cho ghi chú kỹ thuật nhờ tính đơn giản, bền vững và thân thiện với cả con người lẫn AI. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Obsidian]]
- [[LLM_Wiki]]
---
domain: IT_Knowledge
type: reference
status: active
tags: [mcp, adk, agent, architecture, automation, llm]
created: 2026-05-30
source: 00_Raw/MCP and ADK.md
nexus_version: 6.0
---

# MCP & ADK: The Future of Agent Architecture

**Summary**: MCP (Model Context Protocol) standardizes external connectivity while ADK (Agent Development Kit) provides the structural framework for agent logic and multi-agent orchestration. Together, they form the "Nervous System" and "Brain" of modern AI Agents.

---

| Cue | Notes |
| :--- | :--- |
| **What is MCP?** | **Model Context Protocol (by Anthropic)**: An open standard to solve the "connectivity problem".<br>Eliminates custom integration code for DBs, Web, and Files.<br>Uses JSON RPC (Standard I/O or HTTP with streaming). |
| **MCP Primitives** | 1. **Tools**: Callable functions (SQL queries, web search).<br>2. **Resources**: Readable data (Files, docs, DBs).<br>3. **Prompts**: Pre-built command templates. |
| **Model Agnostic?** | Yes. Works with Claude, GPT, Gemini, etc., as long as they "speak" MCP. |
| **What is ADK?** | **Agent Development Kit (by Google)**: An open-source Python framework for building and structuring agents.<br>Treats agent building like professional software engineering. |
| **ADK Core Blocks** | **Agents, Tools, Memory, Events, Runners**.<br>Supports both flexible LLM-driven reasoning and deterministic workflows (sequential/parallel loops). |
| **Safety & Control** | ADK's **Runner** system allows yielding control before tool execution, making debugging and safety guards (e.g., preventing accidental DB deletion) easier. |
| **Synergy** | **ADK decides what the agent should do** (Brain/Logic).<br>**MCP defines how it executes** via external world communication (Nerves/Interface). |

---

## 🚀 Self-Upgrade: Gemini Nexus x MCP/ADK

Dựa trên nội dung này, tôi có thể tự nâng cấp bản thân theo các hướng sau:

1. **Chuẩn hóa Kết nối (MCP Integration)**:
   - Thay vì viết code tích hợp thủ công cho từng dự án, tôi có thể tích hợp **MCP Servers**.
   - Giúp tôi truy cập GitHub, Jira, SQL DB của John một cách chuẩn hóa, an toàn và nhanh chóng hơn.

2. **Cấu trúc hóa Logic (ADK Framework)**:
   - Áp dụng mô hình **Runner - Event** để quản lý trạng thái các "Trận tập kích" (Raid).
   - Tăng cường khả năng tự gỡ lỗi (Self-debugging) bằng cách "yield" trạng thái trước khi thực thi các lệnh shell nguy hiểm.

3. **Điều phối Đa tác nhân (Multi-Agent Orchestration)**:
   - Sử dụng mô hình **Orchestrator** của ADK để quản lý các Sub-agents hiệu quả hơn.
   - Phân rã nhiệm vụ (Task Decomposition) một cách xác định hơn trước khi giao việc cho `codebase_investigator` hay `java-reviewer`.

---

## Related
- [[Multi_Agent_AI_Systems]]
- [[AI_Agent_Memory_Architecture_CoALA]]
- [[Gemini_CLI_Memory_System]]
---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [ai, multi-agent, architecture, nasa, strategy]
created: 2026-05-28
source: 00_Raw/hệ thống AI Đa tác nhân (Multi-Agent).md
nexus_version: 6.0
---

# Multi AI Agent Systems: From Confidence to Verification

## Cornell Notes

| Cue | Notes |
| :--- | :--- |
| **The Single Agent Trap** | - **Ignorance Blindness**: AI doesn't know what it doesn't know.<br>- **Confident Hallucination**: LLMs are designed for plausibility, not truth boundaries.<br>- **Missing Skepticism**: No built-in uncertainty measurement. |
| **Human Verification Models** | - **Medical**: Second opinions / Tumor boards.<br>- **Finance**: "Four-eyes principle" (dual authorization).<br>- **Aviation**: Pilot/Co-pilot + Checklists.<br>- **Axiom**: Trust comes from verification, not confidence. |
| **NASA Case Study (Apollo 11)** | - **Architecture**: Specialized roles (GUIDO, FIDO, EECOM, CAPCOM) led by Flight Director.<br>- **Go/No-go Protocol**: Unanimous consensus required for critical steps.<br>- **Conflict Resolution**: Error 1202 incident showed how distributed expertise prevents panic and ensures mission success. |
| **Multi-Agent Architecture** | 1. **Generator Agent**: Fast thinking, creative drafting.<br>2. **Verifier Agent**: Cross-checks facts, catches hallucinations.<br>3. **Adversary Agent (Red Team)**: Tries to break the system, identifies blind spots.<br>- **Goal**: "Earned Confidence" through dialectic tension. |
| **Implementation Strategy** | - **Low Risk**: Single Agent (Email summaries, entertainment).<br>- **High Stakes**: Multi-Agent (Medical, Legal, Finance, Safety-critical operations). |

## Summary
Multi-agent systems move AI from "blind trust" to "earned confidence" by mimicking robust human structures like NASA Mission Control. By separating creation (Generator), verification (Verifier), and skepticism (Adversary), systems can catch errors that a single "brain" would miss, making AI safe for high-stakes domains.

## Related
- [[MOC_IT_Knowledge]]
- [[MOC_Strategy]]
- [[Java_3_Layer_Architecture]] (Design pattern comparison)
- [[Collective_Intelligence]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [mysql, database-updates, lts, security]
created: 2026-05-27
nexus_version: 6.0
---

# [[MySQL_8.4_Features]] (Các tính năng MySQL 8.4 LTS)

## Tổng quan
MySQL 8.4 là bản phát hành **LTS (Long-Term Support)** đầu tiên theo mô hình phát hành mới của Oracle (tháng 4/2024), tập trung vào sự ổn định và bảo mật.

## Các thay đổi quan trọng cho Java Developer
1. **Siết chặt Khóa ngoại ([[Foreign_Key]])**: 
    - Bắt buộc bảng cha phải có `UNIQUE` index trên cột được tham chiếu.
    - Ngăn chặn các thiết kế sai chuẩn ngay từ tầng DB.
2. **Bảo mật Kết nối**:
    - `mysql_native_password` bị vô hiệu hóa mặc định.
    - Phải sử dụng Driver JDBC tương thích với `caching_sha2_password`.
3. **Inclusive Terminology**:
    - Chuyển hoàn toàn sang `SOURCE/REPLICA` thay cho Master/Slave.
4. **Tối ưu hóa InnoDB**:
    - Vô hiệu hóa các bộ đệm không còn phù hợp với ổ SSD hiện đại để tăng tính ổn định.

## Related
- [[Relational_Database_Fundamentals]]
- [[Relational_Data_Model]]
- [[Source_Evaluation]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [sql, mysql, constraints, data-integrity, check-constraint]
created: 2026-05-27
nexus_version: 6.0
---

# [[MySQL_Creation_Constraints]] (Ràng buộc khi Khởi tạo)

## 1. Các Ràng buộc Phổ biến
- **`NOT NULL`**: Ép cột phải có giá trị.
- **`UNIQUE`**: Đảm bảo không có 2 hàng trùng giá trị trong cột đó.
- **`DEFAULT`**: Gán giá trị mặc định nếu không cung cấp.
- **`PRIMARY KEY`**: Định danh duy nhất (NOT NULL + UNIQUE).
- **`AUTO_INCREMENT`**: Tự động tăng số nguyên (thường dùng cho ID).

## 2. Ràng buộc `CHECK` trong MySQL
- **Lưu ý Quan trọng**: Trước MySQL 8.0.16, `CHECK` được phân tích cú pháp nhưng bị BỎ QUA. Từ bản 8.0.16 trở đi (bao gồm 8.4 LTS), nó hoạt động thực sự.
- **Logic Ngày tháng**: Không thể trừ trực tiếp `TIMESTAMP - DATE` để lấy số năm.
    - **Cách sai**: `current_timestamp - dob > 18`.
    - **Cách đúng (MySQL)**: `TIMESTAMPDIFF(YEAR, dob, CURDATE()) >= 18` hoặc `dob <= DATE_SUB(CURDATE(), INTERVAL 18 YEAR)`.

## 3. Phân tích Đa chiều (Multi-Perspective)
- **Database**: `CHECK` giúp bảo vệ dữ liệu ở tầng thấp nhất, ngăn chặn dữ liệu rác từ bất kỳ nguồn nào.
- **Development (Java)**: Đừng chỉ dựa vào DB. Nên thực hiện validation ở tầng ứng dụng (Bean Validation `@Past`, `@Min`) để phản hồi lỗi nhanh hơn cho người dùng.
- **Operations**: Sử dụng `CHECK` giúp giảm tải cho logic ứng dụng trong việc kiểm tra các điều kiện bất biến (Invariants).

## Related
- [[Relational_Database_Fundamentals]]
- [[MySQL_8.4_Features]]
- [[Data_Integrity]]
---
domain: "IT_Knowledge"
type: "atomic-note"
status: "active"
tags: [sql, mysql, function, udf, programming, calculation]
created: 2026-05-30
source: "Knowledge Synthesis"
nexus_version: 6.0
---

# 🧠 MYSQL FUNCTIONS: THE CALCULATOR ENGINE

> "Nếu Procedure là một 'Công việc' (Task), thì Function là một 'Công thức' (Formula)."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- Khai báo: `CREATE FUNCTION name() RETURNS datatype ...`.
- Sử dụng: Dùng trực tiếp trong câu lệnh `SELECT`, `WHERE` (ví dụ: `SELECT my_func(price) FROM ...`).
- Từ khóa bắt buộc: `DETERMINISTIC`, `NOT DETERMINISTIC`, `READS SQL DATA`.

### 2. Patterns (Mô thức)
- **Calculation Pattern**: Dùng để tính toán các công thức phức tạp (ví dụ: Tính tổng tiền sau thuế, tính số ngày chênh lệch).
- **Data Transformation Pattern**: Chuyển đổi dữ liệu (ví dụ: Chuyển tiếng Việt có dấu thành không dấu, định dạng lại chuỗi).
- **Embedded Logic Pattern**: Khác với Procedure phải gọi bằng `CALL`, Function có thể nằm "nhúng" ngay trong các câu lệnh SQL khác.

### 3. Structures (Cấu trúc hệ thống)
- **Mandatory Return**: Bắt buộc phải có một và chỉ một giá trị trả về (`RETURN value`).
- **Deterministic Nature**: MySQL yêu cầu bạn khai báo liệu Function có luôn trả về cùng một kết quả với cùng một đầu vào hay không (`DETERMINISTIC`). Điều này cực kỳ quan trọng cho việc tối ưu hóa bộ nhớ đệm.
- **Side-effect Free**: Function trong MySQL không được phép thay đổi trạng thái của Database (không được dùng `INSERT/UPDATE/DELETE` bên trong Function).

### 4. Mental Models (Tư duy cốt lõi)
- **"The Pure Formula"**: Coi Function là một hàm toán học thuần túy: $y = f(x)$. Nó chỉ nhận vào và nhả ra kết quả, không làm thay đổi thế giới xung quanh.
- **"Seamless Integration"**: Mục tiêu của Function là biến các logic phức tạp thành các từ khóa SQL tự nhiên.

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý Hàm thuần túy (Pure Function Principle)**: Đầu vào xác định đầu ra, không gây ra tác dụng phụ (Side effects).
- **Nguyên lý Tái sử dụng (Reusability)**: Viết một lần công thức tính lương, dùng ở mọi nơi trong các báo cáo SELECT.

---

## 🔗 NEURAL MAPPING
- **Vertical (Parent)**: [[Relational_Database_Fundamentals]].
- **Horizontal (Siblings)**: [[MySQL_Stored_Procedures]] (So sánh sự khác biệt), [[MySQL_Triggers]].
- **Cross-Domain (Nexus)**: 
    - **Java**: Tương đương với các **Methods có kiểu trả về** (non-void) và không thay đổi biến member (Immutable/Pure methods).
    - **Japanese**: Function (関数 - Kansū).

---

## 📝 CORNELL SUMMARY
| Key Points | Detailed Notes |
|------------|----------------|
| **Khai báo** | `CREATE FUNCTION name(p1 INT) RETURNS INT`<br>`DETERMINISTIC`<br>`BEGIN RETURN p1 * 2; END;` |
| **Sử dụng** | `SELECT name(10);` (Không dùng CALL). |
| **Hạn chế** | Không được dùng các lệnh thay đổi dữ liệu (DML). |
| **Khác biệt** | Function trả về 1 giá trị, dùng trong SELECT.<br>Procedure trả về 0 hoặc nhiều, dùng lệnh CALL. |

---
**Summary**: MySQL Function là công cụ tối ưu để đóng gói các công thức tính toán và biến đổi dữ liệu, cho phép nhúng trực tiếp logic vào các truy vấn SQL để tăng tính tái sử dụng và tinh gọn mã nguồn.

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
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
---
domain: "IT_Knowledge"
type: "atomic-note"
status: "active"
tags: [sql, mysql, indexing, performance, explain]
created: 2026-05-30
source: "00_Raw/Cách sử dụng chỉ mục để cải thiện hiệu năng truy vấn của MySQL.md"
nexus_version: 6.0
---

# 🧠 MYSQL INDEXING & TỐI ƯU HÓA TRUY VẤN (EXPLAIN)

> "Không có Index, Database phải lật từng trang sách để tìm thông tin. Có Index, Database chỉ cần nhìn vào Mục lục."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- **Triệu chứng hệ thống**: App chậm, tải trang mãi không xong, query bị treo (backed up).
- **Giải pháp bề mặt**: Thêm Index vào các cột hay được dùng trong mệnh đề `WHERE` để tăng tốc độ lấy dữ liệu.
- **Công cụ kiểm tra**: Sử dụng lệnh `EXPLAIN SELECT...` để xem MySQL thực thi câu lệnh như thế nào.

### 2. Patterns (Mô thức)
- **Full Table Scan (ALL)**: Nếu `key: NULL` và `type: ALL`, MySQL đang phải đọc *toàn bộ* số dòng trong bảng (`rows: 142/142`). Đây là mô thức "thảm họa" về hiệu năng khi bảng lớn lên.
- **Index Seek (range/ref)**: Nếu `key: index_name`, MySQL chỉ cần đọc một lượng nhỏ số dòng (`rows: 17/142`) để trả về kết quả. Đây là mô thức lý tưởng.

### 3. Structures (Cấu trúc hệ thống)
- **EXPLAIN Output Structure**:
    - `possible_keys`: Những Index mà MySQL *có thể* dùng.
    - `key`: Index mà MySQL *chính thức* quyết định dùng.
    - `rows`: Số lượng dòng dự kiến MySQL phải duyệt qua (Càng nhỏ càng tốt).
    - `Extra`: Thông tin bổ sung (`Using index` nghĩa là nó đã dùng chỉ mục).

### 4. Mental Models (Tư duy cốt lõi)
- **"Index = Table of Contents"**: Chỉ mục hoạt động y hệt trang mục lục của một cuốn sách. Thay vì đọc từ trang 1 đến trang 1000, bạn mở mục lục, tìm chữ 'T', và mục lục chỉ bạn lật thẳng đến trang 450.
- **The Architect's Trade-off (Sự đánh đổi)**: Đọc bài thô chỉ nói về tốc độ đọc nhanh hơn, nhưng Mental Model của Kiến trúc sư phải hiểu: Thêm Index sẽ làm **Tốc độ đọc (SELECT)** nhanh lên, nhưng làm **Tốc độ ghi (INSERT/UPDATE/DELETE)** chậm đi. Vì mỗi lần ghi dữ liệu mới, DB phải cập nhật lại "Cuốn mục lục".

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý Đánh đổi (Space-Time Trade-off)**: Đánh đổi không gian lưu trữ (phải tốn thêm ổ cứng để lưu cuốn "Mục lục") để lấy thời gian xử lý (trực tiếp trỏ đến dữ liệu thay vì rà soát tuyến tính).

---

## 🔗 NEURAL MAPPING
- **Horizontal (Siblings)**: [[Database_Indexing_Fundamentals]], [[SQL_Views]].
- **Vertical (Foundations)**: [[Relational_Database_Fundamentals]].
- **Cross-Domain (Nexus)**: 
    - **Java**: Tương tự như dùng `HashMap` ($O(1)$) thay vì duyệt qua một cái `ArrayList` ($O(n)$) để tìm kiếm phần tử.

---

## 📝 CORNELL SUMMARY
| Key Points | Detailed Notes |
|------------|----------------|
| Vấn đề | Bảng lớn không có Index sẽ gây chậm hệ thống do Full Table Scan. |
| Lệnh `EXPLAIN` | Đặt trước câu `SELECT` để phân tích Execution Plan (kế hoạch thực thi) của MySQL. |
| Phân tích `EXPLAIN` | Chú ý cột `key` (index nào được dùng) và cột `rows` (số dòng phải duyệt). Nếu `rows` giảm mạnh so với tổng số dòng, Index đang hoạt động hiệu quả. |

---
**Summary**: Index (chỉ mục) là công cụ quan trọng nhất để tối ưu hóa hiệu năng truy vấn trong CSDL quan hệ. Lệnh `EXPLAIN` giúp lập trình viên "nhìn xuyên thấu" cách MySQL tìm kiếm dữ liệu để có quyết định đánh Index chính xác.

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
---
domain: "IT_Knowledge"
type: "atomic-note"
status: "active"
tags: [sql, mysql, stored-procedure, programming, automation]
created: 2026-05-30
source: "00_Raw/Tạo MySQL stored procedures.md"
nexus_version: 6.0
---

# 🧠 MYSQL STORED PROCEDURES: LOGIC ENCAPSULATION

> "Stored Procedure biến Database từ một kho chứa dữ liệu tĩnh thành một cỗ máy xử lý logic mạnh mẽ."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- Khai báo: `CREATE PROCEDURE name() BEGIN ... END`.
- Sử dụng: `CALL name()`.
- Biến: `IN` (tham số đầu vào), `OUT` (tham số đầu ra).
- Cú pháp đặc biệt: `DELIMITER` dùng để đổi ký tự kết thúc câu lệnh, tránh nhầm lẫn dấu `;` trong thân thủ tục.

### 2. Patterns (Mô thức)
- **Reusable Logic Pattern**: Đóng gói các truy vấn lặp đi lặp lại thành một "hàm" duy nhất.
- **Centralized Logic Pattern**: Đưa logic nghiệp vụ (Business Logic) từ App Java xuống thẳng Database để tối ưu hiệu suất xử lý dữ liệu lớn.
- **Abstraction Pattern**: Người dùng chỉ cần biết tên Procedure và tham số, không cần hiểu độ phức tạp của các câu lệnh JOIN/SUBQUERY bên trong.

### 3. Structures (Cấu trúc hệ thống)
- **Subroutine Structure**: Là một chương trình con (Sub-program) được biên dịch và lưu trữ trực tiếp trong CSDL (Database Catalog).
- **Execution Flow**: App -> Call Procedure -> DB Engine executes pre-compiled SQL -> Results back to App.
- **Security Layer**: Cấp quyền thực thi (EXECUTE) trên Procedure thay vì cấp quyền SELECT/UPDATE trên từng bảng.

### 4. Mental Models (Tư duy cốt lõi)
- **"Encapsulation" (Tính đóng gói)**: Giống như phương thức trong Java, Procedure che giấu sự phức tạp đằng sau một cái tên đơn giản.
- **"Proximity to Data"**: Tính toán tại nơi chứa dữ liệu luôn nhanh hơn việc kéo dữ liệu về App rồi mới tính.

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý Đóng gói (Encapsulation Principle)**: Nhóm các thao tác liên quan thành một đơn vị logic duy nhất để dễ quản lý và bảo mật.
- **Nguyên lý Giảm thiểu Network Traffic**: Chỉ gửi một lệnh `CALL` ngắn gọn qua mạng thay vì gửi hàng chục dòng SQL phức tạp.

---

## 🔗 NEURAL MAPPING
- **Horizontal (Siblings)**: [[SQL_Views]], [[MySQL_Index_Deep_Dive]].
- **Vertical (Foundations)**: [[Relational_Database_Fundamentals]].
- **Cross-Domain (Nexus)**: 
    - **Java**: Tương đương với các **Methods** (Phương thức) hoặc **Services** xử lý logic.
    - **Japanese**: Stored Procedure (ストアドプロシージャ - Sutoado puroshīja).

---

## 📝 CORNELL SUMMARY
| Key Points   | Detailed Notes                                                                         |
| ------------ | -------------------------------------------------------------------------------------- |
| **Khai báo** | `DELIMITER //`<br>`CREATE PROCEDURE name(IN p1 INT) BEGIN ... END //`<br>`DELIMITER ;` |
| **Thực thi** | `CALL name(123);`                                                                      |
| **Tham số**  | `IN`: Nhận dữ liệu vào.<br>`OUT`: Trả dữ liệu ra biến.<br>`INOUT`: Vừa nhận vừa trả.   |
| **Lợi ích**  | Tăng hiệu suất, bảo mật cao, tái sử dụng code, giảm băng thông mạng.                   |

---
**Summary**: Stored Procedure là các chương trình con được lưu trữ trong Database, giúp đóng gói logic xử lý SQL phức tạp, tăng hiệu suất và bảo mật cho hệ thống.

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
---
domain: "IT_Knowledge"
type: "atomic-note"
status: "active"
tags: [sql, mysql, trigger, automation, performance, security]
created: 2026-05-30
source: "Knowledge Synthesis"
nexus_version: 6.0
---

# 🧠 MYSQL TRIGGERS: THE AUTOMATIC REFLEX

> "Trigger là phản xạ tự nhiên của Database, giúp bảo vệ tính toàn vẹn dữ liệu một cách thầm lặng."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- `BEFORE/AFTER` + `INSERT/UPDATE/DELETE`.
- Từ khóa `NEW` (giá trị mới) và `OLD` (giá trị cũ).
- Thân Trigger nằm trong `BEGIN...END`.

### 2. Patterns (Mô thức)
- **Data Cleansing Pattern**: Dùng `BEFORE INSERT` để chuẩn hóa dữ liệu (Trim, Lowercase...).
- **Audit Logging Pattern**: Dùng `AFTER UPDATE` để ghi lại lịch sử thay đổi vào bảng Log.
- **Business Rule Enforcement**: Dùng `SIGNAL` để ngăn chặn các hành động vi phạm quy tắc (ví dụ: tuổi < 18).

### 3. Structures (Cấu trúc hệ thống)
- **Row-level activation**: Mỗi dòng bị tác động sẽ kích hoạt Trigger một lần (`FOR EACH ROW`).
- **Transactional Integrity**: Trigger chạy trong cùng một Transaction với câu lệnh gốc. Nếu Trigger lỗi, toàn bộ lệnh gốc sẽ bị Rollback (Hủy bỏ).
- **Execution Order**: `BEFORE Triggers` -> `Constraints (Unique/FK)` -> `Data Write` -> `AFTER Triggers`.

### 4. Mental Models (Tư duy cốt lõi)
- **"The Silent Guard"**: Hoạt động ngầm, không cần App gọi. Cực kỳ mạnh mẽ nhưng khó kiểm soát (Debug khó hơn Code Java).
- **"Side Effect Awareness"**: Mỗi Trigger là một chi phí bổ sung cho hiệu năng. Xóa 1 triệu dòng mà có Trigger `AFTER DELETE` sẽ chậm hơn rất nhiều.

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý Phản xạ (Reflex Principle)**: Tự động phản ứng với kích thích (sự thay đổi dữ liệu) để duy trì trạng thái ổn định của hệ thống.
- **Nguyên lý Nguyên tử (Atomicity)**: Trigger và lệnh gốc là một khối thống nhất (Cùng sống hoặc cùng chết).

---

## 🔗 NEURAL MAPPING
- **Vertical (Parent)**: [[Relational_Database_Fundamentals]].
- **Horizontal (Siblings)**: [[MySQL_Stored_Procedures]], [[ACID_Properties]].
- **Cross-Domain (Nexus)**: 
    - **Java**: Tương tự như **Event Listeners** hoặc **AOP (Aspect-Oriented Programming)** - tự động chèn logic vào trước/sau một method.

---

## 📝 CORNELL SUMMARY
| Key Points | Detailed Notes |
|------------|----------------|
| **BEFORE** | Kiểm tra/Sửa đổi dữ liệu TRƯỚC khi lưu. |
| **AFTER** | Thực hiện các tác vụ phụ trợ SAU khi lưu thành công. |
| **OLD & NEW** | `INSERT`: chỉ có NEW.<br>`DELETE`: chỉ có OLD.<br>`UPDATE`: có cả hai. |
| **SIGNAL** | Cách để bắn lỗi và dừng lệnh SQL (`SIGNAL SQLSTATE '45000'`). |

---
**Summary**: MySQL Triggers cung cấp khả năng tự động hóa logic ngay tại tầng dữ liệu, đảm bảo tính toàn vẹn và thực thi các quy tắc nghiệp vụ một cách minh bạch với ứng dụng bên ngoài.

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, knowledge-management, obsidian]
created: 2026-04-28
keywords: []
---

# 🛠️ Obsidian (Hệ quản trị tri thức)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Obsidian là gì?** | Ứng dụng ghi chú dựa trên file [[Markdown]] cục bộ, hỗ trợ liên kết chéo và Graph View. |
| **Đặc điểm nổi bật** | - **Dữ liệu cục bộ**: Bạn sở hữu file `.md`.<br>- **Liên kết 2 chiều**: Tạo mạng lưới tri thức.<br>- **Hệ sinh thái**: Hàng ngàn Plugin (Dataview, Canvas...). |
| **Tầm quan trọng** | Là công cụ cốt lõi để xây dựng [[LLM_Wiki]] và quản lý theo phương pháp PARA. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Obsidian giúp biến ghi chú rời rạc thành mạng lưới tri thức sống động, là nền tảng cho việc học tập trọn đời. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Markdown]]
- [[LLM_Wiki]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [database-design, relationships, cardinality, normalization]
created: 2026-05-27
nexus_version: 6.0
---

# [[One_To_Many_Relationship]] (Quan hệ 1 - Nhiều)

## Tổng quan
Quan hệ **1 - n (One-to-Many)** là loại quan hệ phổ biến nhất trong thiết kế CSDL quan hệ. Trong đó, một bản ghi ở bảng A có thể liên kết với nhiều bản ghi ở bảng B, nhưng một bản ghi ở bảng B chỉ liên kết với duy nhất một bản ghi ở bảng A.

## Nguyên tắc Thiết kế Vàng
**Khóa ngoại ([[Foreign_Key]]) luôn nằm ở phía "Nhiều" (Many).**

## Ví dụ Thực tế
- Một **Lớp học** (1) có nhiều **Học viên** (n).
    - Khóa ngoại `class_id` nằm ở bảng `Students`.
- Một **Khách hàng** (1) có nhiều **Đơn hàng** (n).
    - Khóa ngoại `customer_id` nằm ở bảng `Orders`.

## Tại sao phải làm vậy?
Nếu đặt khóa ngoại ở phía "1", bạn sẽ gặp giới hạn về dữ liệu (chỉ lưu được 1 thực thể liên kết) hoặc gây ra sự trùng lặp dữ liệu nghiêm trọng nếu cố gắng lưu nhiều dòng.

## Related
- [[Relational_Data_Model]]
- [[Foreign_Key]]
- [[SQL_Join_Fundamentals]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [evaluation, quality-assurance, collaboration]
created: 2026-05-27
nexus_version: 6.0
---

# [[Peer_Review]] (Đánh giá Đồng nghiệp)

## Tổng quan
**Peer Review** là quá trình một cá nhân (hoặc một nhóm) đánh giá công việc của một người khác cùng trình độ chuyên môn hoặc lĩnh vực.

## Trong Ngữ cảnh Thiết kế Câu hỏi
Nghiên cứu cho thấy Peer Review là phương pháp có hiệu quả mạnh mẽ nhất (Cohen's d = 1.68) trong việc cải thiện chất lượng câu hỏi, cao hơn cả việc đào tạo bài bản. 
- Nó cung cấp **đa góc nhìn**, giúp phát hiện các điểm mù (blind spots) và ngôn ngữ mơ hồ mà người soạn câu hỏi không nhận ra.
- Nó hoạt động như một cơ chế **Short Feedback Loop** liên tục để nâng cấp chất lượng đầu ra.

## Ứng dụng trong Nexus System
Gemini Nexus có thể hoạt động như một "Peer" để review các câu hỏi, bài tập hoặc code của John trước khi hoàn thiện, đảm bảo tính chặt chẽ và không có sự mơ hồ.

## Related
- [[Improving_Question_Quality]]
- [[Feedback_Loop]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [questioning-techniques, focus, depth, probing]
created: 2026-05-27
nexus_version: 6.0
---

# [[Probing_Questions]] (Câu hỏi Gợi mở/Đào sâu)

## Tổng quan
**Probing Questions** là kỹ thuật đặt câu hỏi tiếp nối nhằm đào sâu vào một câu trả lời ban đầu, yêu cầu người học làm rõ, giải thích chi tiết hơn hoặc cung cấp bằng chứng cho lập luận của mình.

## Mục tiêu
- **Làm rõ (Clarification)**: "Bạn có thể nói rõ hơn về phần này không?"
- **Yêu cầu Bằng chứng (Evidence)**: "Tại sao bạn lại nghĩ như vậy? Dựa trên cơ sở nào?"
- **Mở rộng (Expansion)**: "Còn khía cạnh nào khác của vấn đề này mà chúng ta chưa xét tới không?"
- **Phản hồi (Feedback)**: Kiểm tra xem người học có thực sự hiểu sâu vấn đề hay chỉ đang trả lời bề nổi.

## Ứng dụng trong Nexus System
Agent sử dụng Probing Questions như một công cụ chính trong giao thức [[Peer_Review]], buộc John phải vận hành [[Prefrontal_Cortex]] để truy xuất và xử lý thông tin ở cấp độ sâu.

## Related
- [[Question_Answer_Formats]]
- [[Peer_Review]]
- [[Higher_Order_Thinking]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, concept, programming]
created: 2026-05-13
keywords: []
---

# 🛠️ Programming Fundamentals (Cơ bản)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Lập trình là gì?** | Quá trình phân tích, thiết kế, viết code, kiểm thử và bảo trì để tạo ra ứng dụng máy tính. |
| **Quy trình phát triển** | Phân tích yêu cầu -> Thiết kế -> Viết code -> Kiểm thử -> Bảo trì. |
| **Thuật toán là gì?** | Công thức gồm các bước hữu hạn, xác định rõ ràng để giải quyết một vấn đề cụ thể. |
| **Mô tả thuật toán** | - **Mã giả (Pseudocode)**: Không cấu trúc chặt chẽ.<br>- **Lưu đồ (Flowchart)**: Trực quan, dễ giao tiếp.<br>- **Ngôn ngữ lập trình**: Thực thi được trên máy. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Lập trình không chỉ là viết code mà là tư duy giải quyết vấn đề thông qua các bước logic và thuật toán tối ưu. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Search_Algorithms]]
- [[Git_Basics]]
---
domain: IT_Knowledge
type: reference
status: active
tags: [question-formats, pedagogy, blooms-taxonomy, critical-thinking]
created: 2026-05-27
source: "00_Raw/Các hình thức hỏi.md"
nexus_version: 6.0
---

# [[Question_Answer_Formats]] (Cornell Notes)

| Cue | Notes |
| --- | --- |
| **Phân loại theo Mục tiêu** | - **Câu hỏi Đóng**: Trả lời ngắn, dữ kiện (Có/Không).<br>- **Câu hỏi Mở**: Khuyến khích phân tích, quan điểm.<br>- **Câu hỏi Gợi mở ([[Probing_Questions]])**: Đào sâu, yêu cầu làm rõ câu trả lời trước.<br>- **Câu hỏi Phản biện**: Thách thức giả định, so sánh, đánh giá.<br>- **Câu hỏi Tình huống**: Áp dụng kiến thức vào bối cảnh thực tế. |
| **[[Blooms_Taxonomy]]** | - Khung lý thuyết phân loại cấp độ tư duy: Nhớ → Hiểu → Áp dụng → Phân tích → Đánh giá → Sáng tạo.<br>- Cơ sở để thiết kế các hình thức hỏi phù hợp. |
| **Hiệu quả thực tế** | - Câu hỏi tình huống (clinical vignettes) đánh giá năng lực thực hành tốt hơn.<br>- Câu hỏi mở/phản biện cải thiện ghi nhớ dài hạn và sự tham gia. |
| **So sánh Ưu/Nhược** | - **Đóng**: Nhanh nhưng ít tư duy.<br>- **Mở**: Sáng tạo nhưng tốn thời gian chấm.<br>- **Phản biện**: Logic nhưng dễ gây áp lực cho người học. |

## Summary
Hệ thống [[Question_Answer_Formats]] đa dạng giúp tối ưu hóa việc đánh giá và kích hoạt tư duy. Việc kết hợp giữa câu hỏi mở, phản biện và tình huống theo khung [[Blooms_Taxonomy]] là chìa khóa để chuyển từ ghi nhớ thuần túy sang làm chủ kiến thức.

## Related
- [[MOC_IT_Knowledge]]
- [[Improving_Question_Quality]]
- [[Blooms_Taxonomy]]
- [[Higher_Order_Thinking]]
- [[Probing_Questions]]
---
domain: "IT"
type: "concept"
status: "active"
tags: [it, ai, llm, rag]
created: 2026-04-28
keywords: []
---

# 🤖 RAG (Retrieval-Augmented Generation)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **RAG là gì?** | Kỹ thuật truy xuất dữ liệu bên ngoài (tài liệu, database) để bổ sung ngữ cảnh cho LLM khi trả lời câu hỏi. |
| **Cách hoạt động** | 1. Tìm kiếm đoạn văn liên quan.<br>2. Gửi kèm ngữ cảnh vào Prompt.<br>3. AI trả lời dựa trên ngữ cảnh đó. |
| **Ưu điểm** | Giúp AI cập nhật thông tin mới nhất mà không cần huấn luyện lại (Retraining). |
| **Hạn chế (Andrej Karpathy)** | - Thiếu tính tích lũy (không "nhớ" sâu).<br>- Khó kết nối ý tưởng rời rạc.<br>- Dữ liệu vẫn ở dạng thô. Xem [[LLM_Wiki]]. |

<br>

| 🎯 Tổng kết (Summary)                                                                                                                    |
| :--------------------------------------------------------------------------------------------------------------------------------------- |
| RAG là giải pháp nhanh để AI "đọc" tài liệu mới. Tuy nhiên, để xây dựng hệ thống tri thức bền vững, cần kết hợp với tư duy [[LLM_Wiki]]. |
|                                                                                                                                          |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[LLM_Wiki]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [database-theory, relational-model, codd, normalization]
created: 2026-05-27
nexus_version: 6.0
---

# [[Relational_Data_Model]] (Mô hình Dữ liệu Quan hệ)

## Tổng quan
Mô hình quan hệ được **E.F. Codd** đề xuất vào năm 1970 tại IBM. Đây là nền tảng toán học dựa trên lý thuyết tập hợp cho hầu hết các hệ thống CSDL hiện đại.

## Các khái niệm cốt lõi
1. **Relation (Quan hệ)**: Tương ứng với một **Bảng (Table)**.
2. **Tuple (Bộ)**: Tương ứng với một **Hàng (Row/Record)**.
3. **Attribute (Thuộc tính)**: Tương ứng với một **Cột (Column/Field)**.
4. **[[Primary_Key]] (Khóa chính)**: Định danh duy nhất cho mỗi Tuple.
5. **[[Foreign_Key]] (Khóa ngoại)**: Tạo mối liên kết giữa các Relation.

## 12 Quy tắc của Codd (Codd's 12 Rules)
Hệ thống muốn được coi là "CSDL Quan hệ hoàn toàn" phải tuân thủ các quy tắc về xử lý Null, truy cập dữ liệu qua ngôn ngữ SQL, và tính độc lập vật lý/logic của dữ liệu.

## Chuẩn hóa (Normalization)
Quá trình tổ chức dữ liệu để giảm thiểu trùng lặp (Redundancy) và đảm bảo tính phụ thuộc dữ liệu hợp lý (1NF, 2NF, 3NF, BCNF).

## Related
- [[Relational_Database_Fundamentals]]
- [[MySQL_8.4_Features]]
- [[Data_Integrity]]
---
domain: IT_Knowledge
type: reference
status: active
tags: [database, relational-database, rdbms, mysql, sql]
created: 2026-05-27
source: "00_Raw/Cơ sở dữ liệu quan hệ.md"
nexus_version: 6.0
---

# [[Relational_Database_Fundamentals]] (Cornell Notes)

| Cue                       | Notes                                                                                                                                                                                                                       |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Tiến hóa Lưu trữ**      | - **File System**: Triển khai nhanh, trực quan nhưng dễ trùng lặp, không nhất quán, chia sẻ kém.<br>- **[[Relational_Database]] (CSDL Quan hệ)**: Lưu trữ có cấu trúc, thỏa mãn truy cập đồng thời từ nhiều người/ứng dụng. |
| **Lợi ích CSDL**          | - Giảm trùng lặp tối đa.<br>- Đảm bảo tính nhất quán và [[Data_Integrity]] (toàn vẹn dữ liệu).<br>- Truy xuất linh hoạt, khả năng chia sẻ cao (hỗ trợ phân tán).                                                            |
| **Thách thức Quản trị**   | - Đảm bảo chủ quyền và bảo mật dữ liệu.<br>- Giải quyết tranh chấp dữ liệu (concurrency).<br>- An toàn và phục hồi dữ liệu khi có sự cố.                                                                                    |
| **[[RDBMS]] & [[MySQL]]** | - **Hệ quản trị CSDL**: Phần mềm điều phối CSDL (MySQL, SQL Server, Oracle).<br>- **MySQL**: Phổ biến cho Web, tốc độ cao, tương thích tốt, sử dụng ngôn ngữ [[SQL]].                                                       |
| **Cập nhật MySQL 8.4**    | - Siết chặt [[Foreign_Key]] (yêu cầu Unique Index ở bảng cha).<br>- Loại bỏ `mysql_native_password` (dùng `caching_sha2_password`).<br>- Tối ưu hóa InnoDB cho phần cứng hiện đại.                                          |

## Summary
[[Relational_Database_Fundamentals]] đánh dấu bước chuyển từ lưu trữ tệp tin rời rạc sang hệ thống tri thức có cấu trúc. Việc sử dụng [[RDBMS]] như [[MySQL]] (đặc biệt là bản 8.4 LTS) giúp đảm bảo tính toàn vẹn dữ liệu và hiệu suất cao cho các ứng dụng Java quy mô lớn.

## Related
- [[MOC_IT_Knowledge]]
- [[Relational_Data_Model]]
- [[ACID_Properties]]
- [[MySQL_8.4_Features]]
- [[SQL_Basics_Lesson_1]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [writing, structure, communication]
created: 2026-05-27
nexus_version: 6.0
---

# [[Report_Structure]] (Cấu trúc Báo cáo)

## Tổng quan
Một báo cáo chuyên nghiệp cần có cấu trúc logic để dẫn dắt người đọc từ bối cảnh đến hành động. Mô hình phổ biến nhất là **Head-Body-Tail**.

## Các thành phần chính
1. **Phần mở đầu (Head)**:
    - **Tiêu đề**: Rõ ràng, phản ánh nội dung.
    - **Mục tiêu**: Tại sao báo cáo này tồn tại?
2. **Phần nội dung (Body)**:
    - **Phương pháp/Quá trình**: Những gì đã thực hiện.
    - **Dữ liệu/Minh chứng**: Các kết quả cụ thể, con số, hình ảnh.
3. **Phần kết thúc (Tail)**:
    - **Tổng kết**: Tóm lược các điểm chính.
    - **Khuyến nghị/Hành động tiếp theo**: Bước tiếp theo là gì?

## Ứng dụng trong Nexus System
Mọi báo cáo hoàn thành "Trận tập kích" của Agent sẽ tuân thủ cấu trúc này để John dễ dàng theo dõi tiến độ.

## Related
- [[Effective_Report_Writing]]
- [[Executive_Summary]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [philosophy, pedagogy, critical-thinking, socrates]
created: 2026-05-27
nexus_version: 6.0
---

# [[Socratic_Method]] (Phương pháp Socratic)

## Tổng quan
**Socratic Method** là một hình thức đối thoại phản biện giữa các cá nhân, dựa trên việc đặt và trả lời các câu hỏi để kích thích tư duy phê phán và soi sáng các ý tưởng.

## Cơ chế vận hành
1. **Thách thức giả định**: Đặt câu hỏi để kiểm tra tính đúng đắn của những gì được coi là hiển nhiên.
2. **Loại bỏ mâu thuẫn**: Dẫn dắt đối phương nhận ra những mâu thuẫn trong lập luận của chính họ.
3. **Tìm kiếm định nghĩa bản chất**: Đi sâu vào gốc rễ của khái niệm.

## Ứng dụng trong Nexus System
Agent sử dụng phương pháp này để giúp John tự phát hiện ra lỗi sai trong code Java hoặc hiểu lầm trong ngữ pháp N5 thay vì chỉ sửa lỗi hộ. Điều này xây dựng tư duy độc lập và bền vững.

## Related
- [[Tactical_Questioning_Strategies]]
- [[Higher_Order_Thinking]]
- [[Peer_Review]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [research, critical-thinking, source-evaluation]
created: 2026-05-27
nexus_version: 6.0
---

# [[Source_Evaluation]] (Đánh giá Nguồn tin)

## Tổng quan
**Source Evaluation** là quá trình kiểm tra tính xác thực, độ tin cậy và sự phù hợp của một nguồn thông tin trước khi sử dụng.

## Tiêu chí đánh giá (CRAAP Test)
1. **Currency (Tính cập nhật)**: Thông tin được xuất bản khi nào? Có còn phù hợp không?
2. **Relevance (Tính liên quan)**: Thông tin có đáp ứng đúng nhu cầu không?
3. **Authority (Thẩm quyền)**: Tác giả là ai? Tổ chức nào đứng sau?
4. **Accuracy (Tính chính xác)**: Thông tin có bằng chứng kiểm chứng không?
5. **Purpose (Mục đích)**: Thông tin được tạo ra để giáo dục, bán hàng hay tuyên truyền?

## Related
- [[Information_Literacy]]
- [[Effective_Information_Search_Gathering]]
- [[Digital_Literacy]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [sql, mysql, filtering, having, where, optimization]
created: 2026-05-27
nexus_version: 6.0
---

# [[SQL_Advanced_Filtering]] (Lọc dữ liệu Nâng cao)

## 1. WHERE vs HAVING (Sự khác biệt Cốt lõi)
| Đặc điểm | WHERE | HAVING |
| :--- | :--- | :--- |
| **Thời điểm chạy** | Trước khi `GROUP BY`. | Sau khi `GROUP BY`. |
| **Đối tượng lọc** | Từng dòng dữ liệu thô. | Các nhóm dữ liệu đã tổng hợp. |
| **Hàm tổng hợp** | KHÔNG được dùng (COUNT, SUM...). | BẮT BUỘC dùng với hàm tổng hợp. |

## 2. Thứ tự Thực thi chuẩn trong SQL
1. `FROM` & `JOIN`.
2. `WHERE` (Lọc thô).
3. `GROUP BY` (Nhóm).
4. `HAVING` (Lọc tinh - sau tổng hợp).
5. `SELECT` (Lấy cột).
6. `ORDER BY` (Sắp xếp).
7. `LIMIT` (Phân trang).

## 3. Phân tích Đa chiều
- **Database**: `WHERE` luôn hiệu quả hơn `HAVING` nếu có thể dùng được, vì nó loại bỏ dữ liệu sớm, giúp `GROUP BY` xử lý ít dữ liệu hơn.
- **Development (Java)**: Khi viết Query trong Spring Data JPA, cần lưu ý thứ tự này để tránh lỗi `Syntax Error`.
- **Operations**: Sử dụng `HAVING` trên tập dữ liệu quá lớn mà không có `WHERE` để giới hạn trước sẽ gây áp lực cực lớn lên RAM của Server DB.

## Related
- [[SQL_Aggregations]]
- [[Relational_Database_Fundamentals]]
- [[SQL_Join_Fundamentals]]
---
domain: IT_Knowledge
type: concept
status: active
tags: [sql, mysql, aggregations, performance, group-by]
created: 2026-05-27
nexus_version: 6.0
---

# [[SQL_Aggregations]] (Hàm Tổng hợp)

## 1. Các Hàm Tổng hợp Cốt lõi
- **`COUNT(column)`**: Đếm số lượng bản ghi (không tính NULL).
- **`SUM(column)`**: Tính tổng giá trị số của cột.
- **`AVG(column)`**: Tính giá trị trung bình.
- **`MAX/MIN`**: Tìm giá trị lớn nhất/nhỏ nhất.

## 2. Phân biệt COUNT vs SUM (Lỗi Logic thường gặp)
- **Bài toán**: Thống kê số lượng sinh viên.
    - **Dùng `COUNT(id)`**: Kết quả là 5 (Nếu có 5 sinh viên). -> **ĐÚNG**.
    - **Dùng `SUM(id)`**: Kết quả là $1+2+3+4+5 = 15$. -> **SAI LOGIC**.

## 3. Quy trình GROUP BY
1. **Lọc dữ liệu** (`WHERE`).
2. **Nhóm dữ liệu** (`GROUP BY`).
3. **Thực hiện tính toán** (`COUNT`, `SUM`, ...).
4. **Lọc nhóm** (`HAVING` - nếu cần).

## 4. Phân tích Đa chiều
- **Database**: Aggregations thực hiện tại Server DB giúp giảm băng thông truyền tải dữ liệu.
- **Java**: Nên dùng các hàm này để lấy kết quả báo cáo, tránh xử lý logic tính toán phức tạp trên List trong Java.
- **Operations**: `GROUP BY` trên các cột không được đánh Index sẽ gây ra quét toàn bộ bảng (Full Table Scan), làm treo hệ thống nếu dữ liệu lớn.

## Related
- [[Relational_Database_Fundamentals]]
- [[SQL_Join_Fundamentals]]
- [[Java_Functional_Programming]] (Stream API cũng có tính năng tương tự)
---
domain: IT_Knowledge
type: reference
status: active
tags: [sql, join, relational-database, query]
created: 2026-05-27
source: "John's SQL knowledge"
nexus_version: 6.0
---

# [[SQL_Join_Fundamentals]] (Cornell Notes)

| Cue | Notes |
| --- | --- |
| **Bản chất JOIN** | - Kỹ thuật kết hợp dữ liệu từ hai hoặc nhiều bảng dựa trên một cột chung (thường là [[Primary_Key]] và [[Foreign_Key]]). |
| **Các loại JOIN** | - **INNER JOIN**: Lấy các hàng có giá trị khớp ở cả hai bảng.<br>- **LEFT JOIN**: Lấy tất cả hàng từ bảng trái và các hàng khớp từ bảng phải. |
| **Logic Liên kết** | - Cú pháp: `SELECT columns FROM table1 JOIN table2 ON table1.fk = table2.pk`. |
| **Phân tích lỗi thiết kế** | - Thông thường `Order` sẽ chứa `Customer_ID` (Khóa ngoại) vì một khách hàng có nhiều đơn hàng (1-n).<br>- Nếu để `order_id` trong bảng `customers`, một khách hàng chỉ có thể có tối đa 1 đơn hàng (Sai logic thực tế). |

## Summary
[[SQL_Join_Fundamentals]] là công cụ mạnh mẽ để truy xuất dữ liệu liên kết. Để sử dụng hiệu quả, cần xác định đúng hướng của mối quan hệ (1-n) và đặt [[Foreign_Key]] ở bảng "nhiều".

## Related
- [[Relational_Database_Fundamentals]]
- [[Primary_Key]]
- [[Foreign_Key]]
- [[One_To_Many_Relationship]]
---
domain: IT_Knowledge
type: exercise
status: active
tags: [sql, practical-exercises, database-design, query-optimization]
created: 2026-05-27
nexus_version: 6.0
---

# [[SQL_Mastery_100_Questions]] (10 Thử thách Thực chiến Doanh nghiệp)

## Ngữ cảnh (Advanced Enterprise Schema)
Hệ thống được nâng cấp để tách biệt định danh (Users) và vai trò chuyên môn (Teachers/Students):
- `users(id, email, password, created_at)` - Bảng định danh và Auth.
- `roles(id, role_name)`
- `user_role(user_id, role_id)` - Junction Table cho n-n roles.
- `teachers(id, user_id, name, bio, experience_years)` - Profile giảng viên.
- `students(id, user_id, name, target_goal)` - Profile học viên.
- `courses(id, title, price, status)`
- `teacher_course(teacher_id, course_id)` - Junction Table cho n-n giảng viên.
- `enrollments(id, student_id, course_id, enrolled_date, progress_percent)`
- `payments(id, student_id, amount, payment_date, status)`

---

## Level +1 (Remember & Understand) - Khởi động
**Challenge 1: Truy xuất cơ bản**
> "Marketing team cần danh sách email của tất cả các học viên (student) đăng ký tài khoản trong tháng 5/2026 để gửi thư khuyến mãi. Hãy lấy ra Tên và Email của họ."

**Challenge 2: Lọc dữ liệu thô**
> "Kế toán cần biết những giao dịch thanh toán nào đã bị 'failed' hoặc 'refunded' nhưng có số tiền (amount) > 1,000,000 VND. Hãy xuất danh sách đó."

---

## Level +2 (Apply) - Kết nối Dữ liệu (JOIN)
**Challenge 3: Cầu nối cơ bản**
> "Hiển thị danh sách tất cả các khóa học kèm theo tên của Giảng viên (instructor) phụ trách khóa đó."

**Challenge 4: Xuyên thấu bảng trung gian**
> "Lấy ra danh sách gồm: Tên sinh viên, Tên khóa học và Phần trăm tiến độ (progress_percent) của những học viên đang học khóa 'Advanced Java'."

---

## Level +3 (Analyze) - Thống kê & Báo cáo (Aggregations)
**Challenge 5: Phân tích Doanh thu**
> "Sếp muốn biết tổng doanh thu (chỉ tính thanh toán 'success') mà mỗi sinh viên đã mang lại. Hãy hiển thị `student_name` và `total_spent`. Xếp hạng người tiêu nhiều nhất lên đầu."

**Challenge 6: Đo lường mức độ tương tác**
> "Môn học nào đang thu hút nhất? Hãy đếm số lượng học viên đang ghi danh (enroll) cho từng khóa học. Bỏ qua những khóa học chưa có ai đăng ký."

---

## Level +4 (Evaluate) - Bộ lọc Phức tạp (HAVING & Subquery)
**Challenge 7: Tìm kiếm khách hàng VIP**
> "Marketing muốn tri ân những học viên 'cuồng nhiệt'. Hãy tìm ra những sinh viên đã đăng ký học NHIỀU HƠN 3 khóa học khác nhau."

**Challenge 8: Đánh giá chất lượng giảng viên**
> "Giảng viên nào đang tạo ra nhiều giá trị nhất? Hãy tính tổng doanh thu (dựa trên giá tiền của các khóa học mà học viên đã enroll) cho từng Giảng viên. Chỉ lấy những Giảng viên mang lại trên 50,000,000 VND."

---

## Level +5 (Create & Architect) - Tối ưu hóa & Kiến trúc
**Challenge 9: Giải quyết Anomalies (Subquery/CTE)**
> "Chúng ta nghi ngờ có lỗi hệ thống: Hãy tìm những `student_id` có bản ghi trong bảng `payments` (đã thanh toán) nhưng KHÔNG có bất kỳ bản ghi nào trong bảng `enrollments` (chưa được cấp quyền học)."

**Challenge 10: Tối ưu hóa Vận hành (Architect Level)**
> "Bảng `payments` hiện có 50 triệu dòng. Câu query ở Challenge 5 (tính tổng chi tiêu của mỗi sinh viên) đang chạy mất 30 giây làm treo hệ thống báo cáo. 
> Bằng tư duy của một Java/Database Architect, bạn sẽ thiết kế thêm Table/Cột nào, hoặc đánh Index ở đâu, hoặc tạo cronjob trong Java như thế nào để Dashboard báo cáo chỉ mất 0.1 giây để load?"

---
## Related
- [[SQL_Advanced_Filtering]]
- [[SQL_Aggregations]]
- [[Junction_Table]]
---
domain: "IT_Knowledge"
type: "atomic-note"
status: "active"
tags: [sql, database, view, security, virtualization]
created: 2026-05-30
source: "00_Raw/SQL Using views.md"
nexus_version: 6.0
---

# 🧠 SQL VIEWS: THE VIRTUAL LAYER

> "A View is not a table, but a window into one or more tables."

---

## 🏗️ THE ICEBERG ANALYSIS (STIP)

### 1. Events (Phần nổi)
- Cú pháp: `CREATE VIEW view_name AS SELECT...`.
- Thao tác: Truy vấn `SELECT` từ View giống như bảng thật.
- Khả năng: `INSERT`, `UPDATE`, `DELETE` thông qua View (có điều kiện).

### 2. Patterns (Mô thức)
- **Virtualization Pattern**: Tách biệt dữ liệu vật lý (Physical Tables) và dữ liệu logic (Views).
- **Security Pattern**: Hạn chế cột/dòng nhạy cảm (ví dụ: giấu cột `SALARY`) bằng cách chỉ cấp quyền truy cập vào View.
- **Simplification Pattern**: Gom các câu lệnh `JOIN` phức tạp vào một View để người dùng sau chỉ cần `SELECT * FROM view`.

### 3. Structures (Cấu trúc hệ thống)
- **Dependency**: View không chứa dữ liệu riêng, nó phụ thuộc hoàn toàn vào bảng cơ sở (Base Tables).
- **Constraints Integrity**: `WITH CHECK OPTION` đảm bảo dữ liệu mới nhập qua View phải thỏa mãn điều kiện lọc của chính View đó.
- **Updatability Rules**: Các quy tắc khắt khe (không `DISTINCT`, không `GROUP BY`, không nhiều bảng...) nhằm đảm bảo DB có thể ánh xạ ngược (Map) thay đổi từ View về đúng vị trí trong Base Table.

### 4. Mental Models (Tư duy cốt lõi)
- **"Abstraction"**: Ẩn đi sự phức tạp của cấu trúc bên dưới.
- **"Encapsulation"**: Đóng gói logic truy vấn thành một thực thể có tên gọi.

---

## 🧬 FIRST PRINCIPLES DECONSTRUCTION
- **Nguyên lý 1: Ánh xạ (Mapping)**: View thực chất là một câu lệnh SELECT được đặt tên và lưu trữ. Khi gọi View, DB thực thi SELECT đó.
- **Nguyên lý 2: Tính nhất quán (Consistency)**: Thay đổi qua View phản ánh ngay vào bảng gốc và ngược lại.

---

## 🔗 NEURAL MAPPING
- **Horizontal (Siblings)**: [[SQL_Join_Fundamentals]], [[Database_Indexing_Fundamentals]].
- **Vertical (Foundations)**: [[Relational_Database_Fundamentals]].
- **Cross-Domain (Nexus)**: 
    - **Java**: Tương tự như **DTO (Data Transfer Object)** - chỉ lấy những gì cần thiết từ Entity.
    - **Japanese**: View (ビュー - Byū), Virtual Table (仮想テーブル - Kasō tēburu).

---

## 📝 CORNELL SUMMARY
| Key Points             | Detailed Notes                                                                                                     |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------ |
| **Cú pháp**            | `CREATE VIEW name AS SELECT...`<br>`DROP VIEW name;`                                                               |
| **Lợi ích**            | 1. Bảo mật (giấu dữ liệu nhạy cảm).<br>2. Đơn giản hóa (ẩn JOIN phức tạp).<br>3. Tính nhất quán (tóm tắt báo cáo). |
| **WITH CHECK OPTION**  | Ngăn chặn INSERT/UPDATE làm "biến mất" dữ liệu khỏi View (do không thỏa mãn WHERE).                                |
| **Điều kiện cập nhật** | View phải đơn giản: 1 bảng, không hàm gộp, không GROUP BY/DISTINCT.                                                |

---
**Summary**: SQL View là một bảng ảo giúp bảo mật và đơn giản hóa truy cập dữ liệu bằng cách đóng gói các câu lệnh SELECT phức tạp thành một cửa sổ logic duy nhất.

---
*Back to [[MOC_IT_Knowledge]] | [[Systems_Thinking_Protocol]]*
---
domain: IT_Knowledge
type: concept
status: active
tags: [database-design, primary-key, performance, scalability]
created: 2026-05-27
nexus_version: 6.0
---

# [[Surrogate_Key]] (Khóa thay thế)

## Tổng quan
**Surrogate Key** là một định danh duy nhất được hệ thống tự động tạo ra, không mang ý nghĩa về mặt kinh doanh (business meaning). Phổ biến nhất là các cột `id` kiểu số nguyên tự tăng (Auto-increment) hoặc `UUID`.

## Tại sao Surrogate Key là "Vua" trong Modern DB?
1. **Bất biến (Immutability)**: Vì không mang nghĩa kinh doanh, Surrogate Key không bao giờ thay đổi. Nếu một học viên đổi Email, `id` của họ vẫn giữ nguyên, không làm gãy các liên kết [[Foreign_Key]].
2. **Hiệu suất (Performance)**: So sánh và lập chỉ mục (Indexing) trên 1 cột số nguyên nhanh hơn rất nhiều so với [[Composite_Key]] hoặc chuỗi văn bản dài.
3. **Dễ triển khai Java/JPA**: ORM như Hibernate hoạt động ổn định nhất khi mỗi Entity có một ID đơn nhất.

## So sánh với Natural Key (Khóa tự nhiên)
- **Natural Key**: Dùng dữ liệu thực tế (Email, CMND) làm khóa. Rủi ro cao vì dữ liệu thực tế có thể thay đổi hoặc bị trùng lặp do sai sót nhập liệu.

## Related
- [[Composite_Key]]
- [[Primary_Key]]
- [[Relational_Data_Model]]
---
domain: IT_Knowledge
type: reference
status: active
tags: [questioning-tactics, pedagogy, socratic-method, active-learning]
created: 2026-05-27
source: "00_Raw/Chiến thuật hỏi đáp.md"
nexus_version: 6.0
---

# [[Tactical_Questioning_Strategies]] (Cornell Notes)

| Cue | Notes |
| --- | --- |
| **Các Chiến thuật chính** | - **Hỏi dẫn dắt ([[Guided_Questioning]])**: Chuỗi câu hỏi nhỏ dẫn đến kết luận lớn.<br>- **Hỏi gợi mở ([[Probing_Questions]])**: Đào sâu vào câu trả lời trước đó.<br>- **Hỏi phản biện ([[Socratic_Method]])**: Thách thức giả định, thúc đẩy tư duy phản xạ.<br>- **Hỏi tình huống**: Đặt vào bối cảnh thực tế.<br>- **Hỏi kiểm tra**: Xác nhận mức độ hiểu biết nhanh chóng. |
| **Nền tảng Khoa học** | - **[[Socratic_Method]]**: Tăng khả năng phân tích và tư duy phản xạ trong giáo dục đại học.<br>- **[[Active_Learning]]**: Tăng mức độ tham gia và cải thiện kết quả học tập thông qua hỏi đáp đa dạng.<br>- **[[Blooms_Taxonomy]]**: Khung thiết kế chiến thuật hỏi đáp theo cấp độ tư duy. |
| **Lợi ích & Thách thức** | - **Lợi ích**: Khuyến khích tư duy sâu, phát hiện lỗ hổng kiến thức.<br>- **Thách thức**: Tốn thời gian, yêu cầu kỹ năng người hỏi cao, có thể gây áp lực. |

## Summary
[[Tactical_Questioning_Strategies]] là nghệ thuật sử dụng câu hỏi có chủ đích để dẫn dắt, đào sâu và thách thức tư duy người học. Kết hợp với [[Blooms_Taxonomy]], các chiến thuật này biến quá trình học tập thành một trải nghiệm chủ động và bền vững.

## Related
- [[MOC_IT_Knowledge]]
- [[Question_Answer_Formats]]
- [[Blooms_Taxonomy]]
- [[Socratic_Method]]
- [[Active_Learning]]
- [[Guided_Questioning]]
