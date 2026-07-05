---
domain: IT_Knowledge
type: concept
status: active
tags: [java, cloudinary, inputstream, servlet, exception]
created: 2026-07-05
nexus_version: 8.4
---

# ☁️ Lỗi Upload InputStream Trên Cloudinary Java SDK

| 💡 Từ khóa / Cue | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Lỗi Unrecognized file parameter là gì?** | - Xảy ra khi truyền trực tiếp một đối tượng `InputStream` (cụ thể là `sun.nio.ch.ChannelInputStream` được sinh ra từ `Part.getInputStream()` dưới Tomcat 10) vào phương thức `uploader().upload(file, options)` của Cloudinary SDK.<br>- Cloudinary Java SDK không thể nhận dạng trực tiếp các lớp con đặc thù của `InputStream` như `ChannelInputStream` làm nguồn dữ liệu upload, dẫn đến ném ra ngoại lệ `IllegalArgumentException`. |
| **Giải pháp chuyển đổi mảng byte (byte[])** | - Giải pháp trực tiếp và nhanh nhất cho các file dung lượng nhỏ là chuyển đổi `InputStream` thành `byte[]` trước khi upload.<br>- Trong Java 9+ (bao gồm Java 17), ta sử dụng phương thức native có sẵn: `byte[] imageBytes = filePart.getInputStream().readAllBytes();`.<br>- Cloudinary SDK hỗ trợ đầy đủ `byte[]` làm tham số tải lên và tự động đóng gói nó thành Multipart request gửi lên server Cloudinary. |
| **Giải pháp file tạm thời (Large Files)** | - Đối với các file dung lượng lớn, việc nạp toàn bộ dữ liệu vào mảng `byte[]` trong bộ nhớ RAM có thể gây ra lỗi tràn bộ nhớ `java.lang.OutOfMemoryError: Java heap space`.<br>- Giải pháp an toàn là copy luồng dữ liệu vào một file tạm thời trên đĩa cứng bằng `Files.copy(inputStream, tempFile.toPath(), StandardCopyOption.REPLACE_EXISTING)`. Sau đó, truyền đối tượng `File` này cho Cloudinary và thực hiện xóa file tạm sau khi upload thành công. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Khi làm việc với Cloudinary Java SDK trong môi trường Web Container (Tomcat), tránh truyền trực tiếp `InputStream` thu được từ file Part vì SDK có thể ném lỗi không nhận dạng. Giải pháp tối ưu là chuyển luồng dữ liệu thành `byte[]` bằng `readAllBytes()` đối với ảnh/file nhỏ, hoặc ghi ra `File` tạm thời trên đĩa cứng đối với file lớn để đảm bảo tính an toàn bộ nhớ và tính tương thích cao. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Web_Tomcat_Artifact_Resolution]]
- [[Java_Servlet_Case_Sensitive_Parameters]]
