---
domain: IT_Knowledge
type: concept
status: active
tags: [gradle, intellij, build-tools, build-delegation, source-of-truth]
created: 2026-07-04
nexus_version: 8.4
---

# 🐘 Ủy Quyền Trình Biên Dịch Cho Gradle (Build Delegation)

| 💡 Từ khóa / Cue | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Nguyên lý Source of Truth** | - Trong môi trường doanh nghiệp chuyên nghiệp, mọi thiết lập dự án (thư viện, tài nguyên, quy trình build) phải được khai báo tập trung trong file cấu hình của Build Tool (`build.gradle` hoặc `pom.xml`).<br>- Tránh tuyệt đối việc thiết lập thủ công các thuộc tính trên giao diện IDE (UI) của từng cá nhân để đảm bảo mọi lập trình viên khi clone code về đều chạy giống nhau. |
| **Cấu hình sourceSets trong Gradle** | - Để khai báo tường minh thư mục tài nguyên cho Gradle (và ép các IDE tự động đồng bộ theo), ta sử dụng khối `sourceSets` trong `build.gradle`:<br>```groovy<br>sourceSets {<br>    main {<br>        resources {<br>            srcDirs = ['src/main/resources']<br>        }<br>    }<br>}<br>``` |
| **Ủy quyền Build sang Gradle** | - Mặc định, IntelliJ sử dụng trình biên dịch nội bộ của riêng mình. Để đồng bộ chuẩn doanh nghiệp, ta cần bắt IntelliJ chuyển giao quyền hạn biên dịch và kiểm thử hoàn toàn cho Gradle:<br>1. Vào `Settings` (`Ctrl + Alt + S`).<br>2. Chọn `Build, Execution, Deployment` -> `Build Tools` -> `Gradle`.<br>3. Thay đổi mục **Build and run using** và **Run tests using** sang thành **Gradle**. |
| **Môi trường CI/CD** | - Việc ủy quyền biên dịch cho Gradle đảm bảo mã nguồn chạy local trên IDE hoạt động hoàn toàn đồng nhất với các Server tự động hóa tích hợp liên tục (CI/CD) như Jenkins hay GitHub Actions - vốn chỉ sử dụng các câu lệnh build thông qua CLI (như `./gradlew build`). |

> [!TIP]
> **Delegate to Gradle** là thiết lập bắt buộc tại các dự án Java thực tế. Nó giúp loại bỏ hoàn toàn các lỗi đặc thù do IDE biên dịch sai lệch so với Build Tool chính thống.

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Thiết lập Gradle làm "Source of Truth" bằng cách định nghĩa tường minh `sourceSets` trong tệp cấu hình Gradle và ủy quyền biên dịch (Build Delegation) trong IntelliJ là tiêu chuẩn bắt buộc tại doanh nghiệp. Điều này đảm bảo tính nhất quán của sản phẩm từ máy cá nhân lên môi trường kiểm thử tự động CI/CD. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Learning_Log]]
- [[Java_Web_Classpath_Resource_Loading]]
- [[IntelliJ_Artifact_Resource_Mapping]]
