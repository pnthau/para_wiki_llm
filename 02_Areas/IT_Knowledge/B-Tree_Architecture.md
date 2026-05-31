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
