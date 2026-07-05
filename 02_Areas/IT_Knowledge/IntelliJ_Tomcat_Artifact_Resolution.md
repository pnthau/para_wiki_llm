---
domain: IT_Knowledge
type: concept
status: active
tags: [intellij, tomcat, artifact, deployment, 404-error]
created: 2026-07-05
nexus_version: 8.4
---

# 🚀 Xử Lý Lỗi Tomcat Artifact Not Available 404 Trong IntelliJ

| 💡 Từ khóa / Cue | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Lỗi Not Available 404 là gì?** | - Xuất hiện khi máy chủ Tomcat khởi động thành công, nhưng không thể ánh xạ (map) được Servlet hoặc tài nguyên do ứng dụng Web bị sập lúc khởi tạo (startup crash).<br>- Lỗi sập này thường là `NoClassDefFoundError` hoặc `ClassNotFoundException` do các file cấu hình hoặc file class biên dịch bị mất, hoặc do Tomcat đang chạy mã nguồn cũ được lưu trong cache. |
| **Cơ chế dọn dẹp cache của IntelliJ & Tomcat** | - Khi thực hiện các thay đổi lớn trong cấu hình dự án (như xóa bỏ tệp tin `.java`), IntelliJ hoặc Tomcat có thể không tự động cập nhật thư mục triển khai đầu ra của Artifact (`out/artifacts/`).<br>- Quy trình làm sạch cache triệt để:<br>1. **Rebuild Project** (`Build -> Rebuild Project`) để biên dịch lại toàn bộ class.<br>2. **Rebuild Artifact** (`Build -> Build Artifacts... -> Chọn Artifact -> Rebuild`) để xóa sạch và tạo mới thư mục triển khai của Tomcat.<br>3. **Restart Tomcat** để nạp lại toàn bộ ứng dụng sạch. |
| **Bài toán làm việc nhóm và Gradle Artifact** | - Việc cấu hình thủ công tệp tin XML trong thư mục ẩn `.idea/artifacts/` sẽ gây lỗi cho đội nhóm, vì thư mục `.idea` bị bỏ qua bởi `.gitignore`. Các thành viên khác khi clone code về sẽ bị thiếu cấu hình và gặp lỗi 404.<br>- **Giải pháp triệt để**: Chuyển cấu hình Deployment của Tomcat trong IntelliJ sang sử dụng **Gradle Artifact** (bắt đầu bằng tiền tố `Gradle : ...`). Đồng thời cấu hình *Settings -> Build Tools -> Gradle -> Build and run using: Gradle* để Gradle tự động đồng bộ hóa cấu hình đóng gói dựa trên tệp `build.gradle` dùng chung. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Lỗi 404 "not available" trên Tomcat thường do không khớp hoặc thiếu tài nguyên biên dịch (cache cũ). Ta giải quyết cục bộ bằng cách Rebuild Project và Rebuild Artifact. Để giải quyết triệt để cho làm việc nhóm, cần sử dụng **Gradle Artifact** để mọi cấu hình đóng gói được quản lý tập trung thông qua `build.gradle` thay vì cấu hình IDE cục bộ. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Web_Classpath_Resource_Loading]]
- [[IntelliJ_Artifact_Resource_Mapping]]
- [[Cloudinary_Java_InputStream_Upload_Error]]
