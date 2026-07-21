Phần 1: Context Engineering là gì?

- **Vấn đề cốt lõi:** 80% lập trình viên thấy AI sinh ra code không dùng được không phải vì AI kém, mà vì AI thiếu ngữ cảnh (context). AI mặc định không có bộ nhớ, không biết về dự án, công nghệ, hay quy tắc của đội ngũ; mỗi yêu cầu của bạn chỉ như một "tờ giấy trắng".
- **Định nghĩa:** Context Engineering là kỹ thuật xây dựng và quản lý toàn bộ thông tin đưa vào _context window_ của AI để tối ưu hóa đầu ra cho một tình huống cụ thể. Khác với Prompt Engineering chỉ tối ưu câu hỏi đơn lẻ, Context Engineering quản lý toàn bộ quá trình AI làm việc.
- **4 Lớp (Layers) của Context Window:**
    1. **L1 - Instructions:** Là System Prompt định nghĩa AI là ai, làm gì, luật lệ và định dạng trả về.
    2. **L2 - Memory:** Bộ nhớ ngắn hạn (lịch sử chat) và dài hạn (Database, Vector).
    3. **L3 - Tools:** Các công cụ và hàm (functions) mà AI được phép gọi để lấy dữ liệu.
    4. **L4 - State:** Trạng thái hiện tại của ứng dụng (ví dụ: người dùng đang ở trang nào, lỗi gì vừa xảy ra).
- **Ví dụ minh họa:** Việc cung cấp context cho AI giống như "onboard" nhân viên mới. Nếu không có tài liệu, nhân viên (AI) sẽ phải đoán mò và làm sai. Nếu cung cấp đầy đủ tài liệu hệ thống và quy tắc, họ sẽ làm đúng ngay từ đầu.

Phần 2: Áp dụng thực chiến & Vai trò của `rules.md`

Tài liệu minh họa cách sử dụng IDE Antigravity trong dự án "sandbox-linehaul" (quản lý logistics). Khi không có ngữ cảnh, AI viết code chung chung, tạo ra nhiều file rác và thiếu bắt lỗi.

Giải pháp là tạo file **rules.md** để cấu hình System prompt tự động, bao gồm các thành phần:

1. **Tổng quan dự án:** Định vị bản chất hệ thống (VD: quản lý vận tải đường dài).
2. **Cấu trúc dự án:** Phân chia rõ ràng thư mục để AI biết nên sửa file ở đâu (entity, repository, service, controller).
3. **Coding Conventions:** Các chuẩn mực chung để mã nguồn đồng nhất, ví dụ bắt buộc dùng Lombok, constructor injection.
4. **Mô hình kiến trúc:** Bắt buộc luồng dữ liệu (Repository → Service → Controller), không cho phép vượt cấp, không phơi bày Entity trực tiếp mà phải dùng DTO.
5. **Response Style:** Đảm bảo code AI sinh ra là "Ready to use", không đứt gãy, không tự ý thêm thư viện ngoài.
6. **Quy trình (Workflows):** Đọc context trước khi code, phân loại luồng cho task dễ và khó.
7. **Quy tắc nghiệp vụ đặc thù:** Đưa ra các giới hạn vận hành thực tế (ví dụ: yêu cầu đối với tài xế) và bắt buộc giao tiếp bằng chuỗi JSON cấu trúc.

Các tính năng hữu ích khác trên Antigravity IDE để đưa context vào AI:

- **@codebase**: Đọc toàn bộ file trong project để hiểu luồng ứng dụng.
- **@file**: Trỏ trực tiếp vào một file cụ thể để AI tập trung hơn.

Phần 3: Patterns (Khuôn mẫu tốt) & Anti-patterns (Những lỗi cần tránh)

**3 Mẫu chuẩn (Patterns) nên dùng:**

1. **Structured Output:** Luôn yêu cầu AI trả về định dạng có cấu trúc rõ ràng (như JSON) thay vì văn xuôi để hệ thống dễ dàng phân tích (parse).
2. **RAG với Domain Knowledge:** Truy vấn dữ liệu thực tế từ Database để nhúng vào ngữ cảnh, giúp AI có dữ liệu thật để suy luận.
3. **Context Compression:** Vì giới hạn token (chữ), hãy yêu cầu AI tự tóm tắt lịch sử trò chuyện cuối mỗi session (đã làm gì, đã chốt quyết định nào) để tiết kiệm lên đến 97% lượng token mà AI vẫn giữ được mạch công việc.

**3 Lỗi sai (Anti-patterns) cần tránh:**

1. **Context Stuffing:** Nhồi nhét quá nhiều dữ liệu không cần thiết (hàng chục ngàn dòng code) khiến AI bị nhiễu và chậm chạp.
2. **Vague Instructions:** Lời nhắc mơ hồ như "viết code tốt". Cần phải chỉ định rõ rệt như: "phương thức < 20 dòng, có @Transactional".
3. **No Error Handling:** AI thường chỉ viết kịch bản tốt đẹp (happy path). Phải bắt buộc AI có try-catch, log error, và fallback mock khi gọi API mạng.

Phần 4: Tổng kết 5 bài học cốt lõi

1. Mỗi request AI nhận được đều là một tờ giấy trắng, bạn phải chủ động cung cấp ngữ cảnh.
2. Context có 4 lớp: Instructions, Memory, Tools, và State. Thiếu bất cứ lớp nào cũng làm giảm hiệu quả.
3. Hãy dùng các lệnh `@file` thay vì chỉ dùng `@codebase` mù quáng, và hãy sử dụng `rules.md`.
4. Bắt buộc AI tạo cấu trúc đầu ra có định dạng (Structured Output).
5. Hãy bắt đầu xây dựng `rules.md` cho các dự án cá nhân ngay từ hôm nay để thấy sự khác biệt.