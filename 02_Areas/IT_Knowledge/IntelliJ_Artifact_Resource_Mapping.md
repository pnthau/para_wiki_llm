---
domain: IT_Knowledge
type: concept
status: active
tags: [intellij, tomcat, artifact, war-exploded, config]
created: 2026-07-04
nexus_version: 8.4
---

# 🛠️ Cấu Hình Artifact Ánh Xạ Tài Nguyên Trong IntelliJ

| 💡 Từ khóa / Cue | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Bản chất Exploded WAR Artifact** | - Khi chạy ứng dụng web Tomcat cục bộ, IntelliJ tạo ra một thư mục trung gian ảo gọi là `exploded-war` (trong thư mục `out/artifacts/`).<br>- Thư mục này cấu trúc theo chuẩn Java Web gồm `WEB-INF/classes` (chứa class và tài nguyên) và `WEB-INF/lib` (chứa thư viện jar). |
| **Nguyên nhân mất file cấu hình** | - Do lỗi cấu hình hoặc xung đột đồng bộ giữa IntelliJ và build tool, bản thiết kế Artifact của IntelliJ có thể chỉ chỉ định copy các tệp Java biên dịch (`module-output`) mà bỏ qua thư mục `resources`. Điều này làm file `.properties` bị thiếu tại thư mục chạy thực tế của Tomcat. |
| **Chỉnh sửa file XML Artifact** | - Cấu hình Artifact được lưu giữ trong tệp tin cấu hình nội bộ của IntelliJ tại đường dẫn `.idea/artifacts/fengshui_jewelry_main_war_exploded.xml`.<br>- Để khắc phục triệt để, cần chèn thẻ cấu hình ánh xạ tài nguyên thủ công vào bên dưới phần tử `<directory name="classes">`:<br>```xml<br><element id="directory-content" path="$PROJECT_DIR$/src/main/resources" /><br>``` |
| **Quy trình áp dụng (Rebuild)** | - Sau khi can thiệp vào file cấu hình Artifact, bắt buộc phải:<br>1. Restart/Reload IntelliJ để IDE nạp lại file cấu hình XML mới.<br>2. Thực hiện lệnh **Build -> Rebuild Project** để IntelliJ lắp ráp lại gói chạy với đầy đủ tài nguyên cấu hình. |

> [!NOTE]
> Khắc phục lỗi thông qua chỉnh sửa cấu hình XML của Artifact là phương án trực diện nhất khi các cấu hình tự động của IDE hoạt động không ổn định trên máy lập trình cá nhân.

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| IntelliJ Tomcat chạy ứng dụng dựa trên gói Exploded WAR được biên dịch. Nếu xảy ra lỗi thiếu file cấu hình, ta cần can thiệp trực tiếp vào file XML Artifact dưới thư mục `.idea/artifacts/` để bổ sung chỉ thị copy thư mục tài nguyên (`src/main/resources`) vào thư mục đích `WEB-INF/classes` của gói chạy Tomcat. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Learning_Log]]
- [[Java_Web_Classpath_Resource_Loading]]
- [[Gradle_Build_Delegation]]
