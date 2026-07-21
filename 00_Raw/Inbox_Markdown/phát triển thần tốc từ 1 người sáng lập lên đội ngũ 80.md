

**Giai đoạn 1: Khởi đầu và mở rộng lên 15 kỹ sư** Nền tảng này bắt đầu vào cuối năm 2024, cho phép bất kỳ ai xây dựng phần mềm theo phong cách "Vibe Coding". Đến năm 2025, sản phẩm có lãi và sau đó được Wix mua lại để tiếp tục duy trì tốc độ phát triển, khiến đội ngũ tăng nhanh từ 2 lên 15 người. Nhóm đối mặt với các thách thức:

- **Tối ưu hóa Onboarding (Đào tạo nhân sự mới):** Thay vì tạo các tài liệu hướng dẫn phức tạp và phải cập nhật liên tục, họ **yêu cầu kỹ sư mới sử dụng 2 câu lệnh prompt với Claude** để tự động xuất ra bản đồ tổng quan của tổ chức và sơ đồ hoạt động theo thời gian thực.
- **Mở rộng quy mô Code Review:** Mao (một nhân sự chủ chốt) không thể kiểm tra thủ công mọi đoạn mã đưa vào backend. Giải pháp là **cho Claude học từ kho dữ liệu các nhận xét PR (Pull Request)** trong quá khứ của Mao. Claude sẽ tự động rà soát và nhắc nhở kỹ sư về các điểm then chốt trước khi nộp mã. Nhờ đó, một tính năng phức tạp như tích hợp WhatsApp AI chỉ mất từ thứ Năm đến Chủ Nhật để hoàn thành.
- **Đo lường hiệu quả trên môi trường thực tế:** Thay vì xây dựng bộ công cụ đánh giá tự động phức tạp, họ sử dụng mô hình Claude Haiku để **phân tích "mức độ bực bội" của khách hàng** thông qua các đoạn chat (vì khi hệ thống lỗi, người dùng sẽ phàn nàn rất rõ ràng). Tín hiệu này giúp họ đánh giá xem các thay đổi về mô hình hay câu lệnh có thực sự hiệu quả không.

**Giai đoạn 2: Tăng trưởng nóng từ 40 lên 80 kỹ sư** Với việc tuyển mới, chuyển nhân sự từ Wix sang và tích hợp thêm một sản phẩm khác, đội ngũ tăng gấp đôi chỉ trong một đêm. Gabriel trình bày 3 thách thức mới:

- **Thử nghiệm trên quy mô lớn (A/B Testing):** Không phải nhân viên mới nào cũng biết cách thiết lập KPI hay thời gian test. Đội ngũ đã **kết nối Claude Code với công cụ PostHog**, cho AI học từ 100 thử nghiệm gần nhất để rút ra hướng dẫn. Họ tạo ra một con bot tự động bình luận trên GitHub để tư vấn xem một tính năng nên triển khai ngay hay cần A/B test trong bao lâu.
- **Đánh giá chất lượng tự động:** Để không lãng phí kỹ sư AI vào việc viết công cụ test, họ dùng **Stage Hand để mô phỏng hành vi của người dùng thực**. Khi có thay đổi, AI sẽ tự động tạo một phiên bản ứng dụng thực tế, chạy thử các bài "Smoke Test" cơ bản (như in ra dòng chữ Hello World) để đảm bảo giao diện và hệ thống không bị sập.
- **Tối ưu quy trình QA (Kiểm thử):** Việc kiểm tra các trường hợp biên (edge cases) rất tốn thời gian. Họ đã **đóng gói các quy trình thành "kỹ năng" cho Claude Code**. Claude có thể tự động truy cập cơ sở dữ liệu để ghi đè cài đặt ban đầu (setup môi trường test), sau đó điều khiển trình duyệt web để kiểm tra các luồng trải nghiệm người dùng, chụp ảnh màn hình và báo cáo kết quả ngay khi một PR được mở.

**Bài học cốt lõi rút ra:**

- **Luôn giữ mọi thứ đơn giản:** Không xây dựng hệ thống phức tạp khi chưa cần thiết.
- **Gu thẩm mỹ (Taste):** Có thể "mã hóa" cách vận hành của công ty bằng cách cho AI học hỏi từ chính những hành động và quyết định trong quá khứ của đội ngũ.
- **Tự dùng thử sản phẩm của mình (Dogfooding):** Việc dùng chính nền tảng của mình để xây dựng tool tạo ra một vòng lặp phản hồi kỳ diệu giúp nâng cao giá trị thực sự.

--------------------------------------------------------------------------------

**2. Các thuật ngữ nổi bật xuất hiện trong video**

- **Vibe Coding:** Một phong cách/thuật ngữ lập trình mới, chỉ một nền tảng cho phép bất kỳ ai (dù không chuyên hay đã có kinh nghiệm) cũng có thể xây dựng phần mềm.
- **Prompt (Câu lệnh):** Lệnh đầu vào được sử dụng để giao tiếp với các mô hình AI như Claude.
- **PR / Pull Request (Yêu cầu hợp nhất/kéo mã):** Quá trình đề xuất đưa đoạn mã mới (code) của kỹ sư vào kho mã nguồn chung của hệ thống để tiến hành review và phê duyệt.
- **A/B Test / Thử nghiệm AB:** Phương pháp thử nghiệm các phiên bản khác nhau của một tính năng trên người dùng để đo lường tỉ lệ chuyển đổi hoặc các chỉ số KPI.
- **PostHog:** Một sản phẩm/nền tảng công nghệ tuyệt vời chuyên được sử dụng để chạy và quản lý các thử nghiệm A/B.
- **Stage Hand:** Một công cụ được sử dụng để mô phỏng các hành động của người dùng thực tế trên giao diện, đóng vai trò như một kỹ sư QA tự động.
- **Smoke Test:** Một bài kiểm tra phần mềm cơ bản (ví dụ: tạo ứng dụng Hello World hiển thị văn bản) nhằm đảm bảo hệ thống không bị hỏng hóc hay sập hoàn toàn sau khi cập nhật.
- **Pipeline CI/CD:** Hệ thống/luồng tự động hóa nơi mọi thay đổi mã nguồn đều được xử lý ngay lập tức.
- **QA (Quality Assurance) / Kỹ sư QA:** Người (hoặc quy trình) thực hiện việc kiểm thử chất lượng phần mềm, đặc biệt là kiểm thử thủ công ở các trường hợp ngoại lệ.
- **Gu thẩm mỹ (Taste):** Được định nghĩa trong bối cảnh này là "pháo đài cuối cùng của con người trước máy móc", thể hiện qua việc bạn có thể dùng AI để mã hóa phong cách làm việc và các quyết định trong quá khứ của công ty thành luật lệ hiện tại.