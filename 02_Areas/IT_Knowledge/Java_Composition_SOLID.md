---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, dsa, solid, lsp, isp, composition]
created: 2026-05-16
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
