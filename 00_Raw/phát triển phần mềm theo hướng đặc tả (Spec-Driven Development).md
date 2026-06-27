Dưới đây là tóm tắt nội dung của buổi học về quy trình phát triển phần mềm theo hướng đặc tả (Spec-Driven Development) cùng với AI:**Tư duy cốt lõi**

- **Vấn đề hiện tại:** Lập trình viên thường viết code tự phát cùng AI, dẫn đến tình trạng "AI-centric" (chăm chăm soi lỗi từng dòng code do AI sinh ra) thay vì kiểm soát ý định. Thống kê cho thấy khoảng 37% mã nguồn do AI tạo ra bị từ chối do không đúng yêu cầu hoặc lệch cấu trúc.
- **Giải pháp:** Chuyển dịch tư duy sang "Spec-Driven Development" (phát triển dựa trên đặc tả). Đây là bước ngoặt giúp nâng cao hiệu suất khi làm việc với AI bằng cách lập kế hoạch chi tiết trước khi bắt đầu gõ code.
- **Bản chất của Spec:** Là một bản mô tả chi tiết, ngắn gọn dưới định dạng Markdown, chứa đựng ý định của lập trình viên và đóng vai trò là "nguồn sự thật duy nhất" (Single Source of Truth) giữa con người và AI.

**Cấu trúc của một bản Spec chuẩn**

  

Một bản đặc tả kỹ thuật bao gồm 6 phần chính:

1. **Overview:** Mục tiêu và lý do thực hiện tính năng.
2. **Rules:** Các quy tắc nghiệp vụ và logic cần tuân thủ.
3. **Technical Design:** Thiết kế chi tiết về API, cấu trúc dữ liệu, database.
4. **Edge Cases:** Dự phòng các lỗi tiềm ẩn hoặc nợ kỹ thuật.
5. **Acceptance Criteria:** Tiêu chí xác định khi nào tính năng hoàn thành.
6. **Verification:** Kế hoạch kiểm thử (test plan) để xác thực tính năng.

**Quy trình làm việc 4 bước với AI**

1. **Explore:** Khám phá cấu trúc mã nguồn hiện tại (codebase) trước khi thực hiện thay đổi.
2. **Plan:** Viết bản đặc tả (Spec) dưới dạng file Markdown và thống nhất với AI.
3. **Code:** AI thực hiện thay đổi mã nguồn dựa trên các chỉ dẫn nghiêm ngặt trong Spec.
4. **Commit/Verify:** Xác nhận kết quả thông qua chạy thử nghiệm tự động hoặc kiểm thử thủ công.

**Các cấp độ triển khai Spec**

- **Cấp độ 1 (Spec First):** Viết Spec để hướng dẫn AI sinh code, sau đó xóa file Spec. Phù hợp cho các tác vụ nhỏ, đơn lẻ.
- **Cấp độ 2 (Lưu trữ Spec):** Lưu file Spec vào kho lưu trữ (repository). Đây là cấp độ phổ biến nhất, cho phép duy trì sự đồng bộ giữa Spec và code khi cần bảo trì hoặc cập nhật tính năng.
- **Cấp độ 3 (Spec-Only):** Con người chỉ tập trung chỉnh sửa Spec bằng ngôn ngữ tự nhiên, code hoàn toàn do AI thực thi. Đây là cấp độ cao nhất và là tầm nhìn tương lai của ngành phần mềm.

**Lưu ý quan trọng**

- Không nên lạm dụng viết Spec cho những tác vụ quá nhỏ (như đổi tên biến) để tránh quá tải tài liệu.
- **Luôn luôn có kiểm thử:** Spec không có kiểm thử là một rủi ro lớn.
- **Trách nhiệm cuối cùng:** Lập trình viên phải là người duyệt kế hoạch trước khi AI viết code; không nên "auto-accept" (tự động chấp nhận) mọi kết quả mà AI tạo ra.
- **Review:** Trong tương lai, quy trình "Code Review" sẽ chuyển dịch thành "Spec Review" (đánh giá bản thiết kế thay vì đánh giá dòng code).