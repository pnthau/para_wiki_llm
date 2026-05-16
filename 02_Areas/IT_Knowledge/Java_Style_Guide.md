---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, convention, style-guide]
created: 2026-05-13
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
