---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, design-principles, oop]
created: 2026-05-13
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
