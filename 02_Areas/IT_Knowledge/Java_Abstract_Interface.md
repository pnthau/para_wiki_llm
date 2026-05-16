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
