cũng giống như con người, các AI agent cần nhiều loại trí nhớ khác nhau để hoạt động hiệu quả. Dựa trên khung CoALA (Cognitive Architectures for Language Agents), có bốn loại trí nhớ chính: **working, semantic, procedural và episodic**. Mỗi loại đảm nhận một vai trò riêng giúp agent xử lý nhiệm vụ, lưu giữ kiến thức và học hỏi từ kinh nghiệm. Điểm nhấn là trí nhớ chính là yếu tố phân biệt chatbot đơn giản với AI agent thực thụ, vì nó cho phép xây dựng kiến thức lâu dài và cải thiện theo thời gian.

## Điểm nổi bật

**Working Memory (Bộ nhớ làm việc)**

- Giống như RAM, lưu giữ thông tin ngắn hạn.
    
- Chứa hội thoại hiện tại, hướng dẫn và tệp đang mở.
    
- Nhanh nhưng dễ mất và dung lượng hạn chế.
    
 **Semantic Memory (Bộ nhớ ngữ nghĩa)**

- Lưu trữ sự kiện, quy tắc, kiến thức.
    
- Có thể triển khai bằng vector database, knowledge graph hoặc file Markdown.
    
- Giúp duy trì kiến thức lâu dài, tránh lặp lại sai lầm.
    

**Procedural Memory (Bộ nhớ thủ tục/kỹ năng)**

- Chứa hướng dẫn cách thực hiện nhiệm vụ.
    
- Dùng các file skill.md với bước cụ thể.
    
- Chỉ nạp kỹ năng liên quan khi cần (progressive disclosure).
    

 **Episodic Memory (Bộ nhớ kinh nghiệm)**

- Ghi lại các tương tác và quyết định trước đây.
    
- Chắt lọc bài học hữu ích thay vì lưu toàn bộ transcript.
    
- Giúp agent cải thiện theo thời gian, nhưng cần cơ chế quản lý việc “quên” hợp lý không thì sẻ gây rắt rối cho hệ thống 

 **Tùy loại agent, nhu cầu trí nhớ khác nhau**

- Agent phản xạ đơn giản (như thermostat) chỉ cần working memory.
    
- Bot hỗ trợ khách hàng cần working + procedural memory.
    
- Agent phức tạp (ví dụ coding agent) thường cần cả bốn loại.
    

**Tại sao trí nhớ quan trọng**

- Trí nhớ phân biệt chatbot với agent.
    
- Cho phép phản hồi dựa trên kiến thức và kinh nghiệm.
    
- Giúp tránh lặp lại sai lầm và hỗ trợ học hỏi liên tục.