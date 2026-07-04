---
domain: IT_Knowledge
type: concept
status: active
tags: [java, tomcat, intellij, gradle, classpath, config, defensive-coding]
created: 2026-07-04
nexus_version: 8.4
---

# ☕ Java Web Classpath & IntelliJ Tomcat Artifact Resolution

| 💡 Từ khóa / Câu hỏi (Cue)       | 📝 Nội dung ghi chú (Notes)                                                                                                                                                                                                                                                                                                                                                                                         |
| :------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Bản chất của Classpath trong Web** | - Trong Java Web (Servlet/JSP), mọi file cấu hình (.properties, .xml) đặt tại `src/main/resources` khi biên dịch sẽ được đưa vào `WEB-INF/classes` trong gói WAR.<br>- Đây gọi là **Classpath Root**. Tomcat sử dụng các ClassLoader riêng biệt để cô lập ứng dụng. Do đó, việc nạp file phải sử dụng ClassLoader thay vì đọc File I/O thông thường. |
| **Vấn đề "Mất file" do IntelliJ** | - Khi chạy bằng Tomcat nội bộ qua IntelliJ, IDE tự động tạo ra một Artifact dạng "exploded war" để triển khai (deploy).<br>- Nếu cấu hình Artifact bị thiếu hoặc lỗi, IntelliJ chỉ copy code Java biên dịch (`.class`) mà quên không copy thư mục `resources`. Kết quả là `application.properties` biến mất khỏi classpath của Tomcat, dẫn đến lỗi kết nối Database (URL/User/Password bị null). |
| **Phòng thủ Đa tầng (Defensive Coding)** | - Để tránh sập hệ thống khi chạy ở các môi trường khác nhau, class `ConfigLoader` được thiết kế với **3 tầng nạp file**:<br>1. **Chiến lược 1**: Thử `Thread.currentThread().getContextClassLoader().getResourceAsStream()` (chuẩn web).<br>2. **Chiến lược 2**: Thử `Class.getResourceAsStream("/application.properties")` (chuẩn core fallback).<br>3. **Chiến lược 3**: Sử dụng đường dẫn tương đối `new File("src/main/resources/...")` (IDE fallback, tuyệt đối không hardcode ổ đĩa dạng `C:\Users\...` để đảm bảo code chạy được trên mọi máy). |
| **Sửa tận gốc cấu hình Artifact** | - Khi IntelliJ bị lỗi đồng bộ, cách sửa tận gốc là chỉnh sửa file XML cấu hình của Artifact tại `.idea/artifacts/fengshui_jewelry_main_war_exploded.xml`.<br>- Cần đảm bảo trong thư mục `classes` có dòng chỉ thị copy tài nguyên từ Gradle/thư mục nguồn:<br>```xml<br><element id="directory-content" path="$PROJECT_DIR$/src/main/resources" /><br>``` |
| **Delegate to Gradle (Chuẩn Doanh nghiệp)** | - Để đảm bảo tính đồng nhất giữa máy cá nhân và hệ thống CI/CD (Jenkins, GitHub Actions), doanh nghiệp luôn ép IntelliJ chạy thông qua Gradle:<br>- Vào `Settings` -> `Build, Execution, Deployment` -> `Build Tools` -> `Gradle` -> Chuyển cả `Build and run using` và `Run tests using` sang **Gradle**.<br>- Khai báo tường minh `sourceSets` trong `build.gradle` để tự động hóa việc đánh dấu `resources` cho mọi thành viên khi clone dự án. |

> [!TIP]
> **💡 Hint cho Java Developer:** 
> Việc sử dụng đường dẫn tuyệt đối (Absolute Path) kiểu `C:\Users\dc130\Desktop\...` trong code Java là lỗi sơ đẳng nghiêm trọng. Nó phá vỡ triết lý "Write Once, Run Anywhere" của Java vì code sẽ sập ngay lập tức khi chạy trên server Linux (không có ổ đĩa C).
> Luôn ưu tiên dùng ClassLoader hoặc đường dẫn tương đối (Relative Path) từ thư mục gốc của project để đảm bảo tính di động cao nhất.

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Khi chạy Java Web trên Tomcat, các file cấu hình nằm ở `src/main/resources` phải được tải thông qua ClassLoader từ `WEB-INF/classes`. Để phòng thủ lỗi cấu hình IDE, `ConfigLoader` nên triển khai 3 chiến lược nạp (Web ClassLoader -> Core ClassLoader -> Relative File Fallback). Để sửa triệt để lỗi mất tài nguyên trên IntelliJ, ta phải bổ sung thẻ chỉ thị copy `<element id="directory-content">` vào file XML cấu hình Artifact của dự án hoặc chuyển toàn bộ cơ chế build sang cấu hình ủy quyền Gradle (Delegate to Gradle). |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Learning_Log]]
- [[JSP_vs_Servlet]]
- [[Java_Maven_Lombok]]
