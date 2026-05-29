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
