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
