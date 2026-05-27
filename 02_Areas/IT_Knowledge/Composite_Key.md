---
domain: IT_Knowledge
type: concept
status: active
tags: [database-design, java, jpa, hibernate, surrogate-key, composite-key]
created: 2026-05-27
nexus_version: 6.0
---

# [[Composite_Key]] vs [[Surrogate_Key]] (Phân tích Đa chiều)

## 1. Góc nhìn Database (Logic & Integrity)
- **Composite Key (Khóa chính hỗn hợp)**:
    - **Ưu điểm**: Đảm bảo tính toàn vẹn dữ liệu ở mức quan hệ (ví dụ: một sinh viên không thể đăng ký một môn học 2 lần). Không cần tạo cột ID "giả".
    - **Nhược điểm**: Làm cho các câu lệnh JOIN trở nên phức tạp và dài dòng. Khóa ngoại ở các bảng khác cũng phải chứa nhiều cột, gây tốn tài nguyên lưu trữ và chỉ mục (index).

## 2. Góc nhìn Development (Java / JPA / Hibernate)
- **Độ phức tạp**: Trong Java (JPA), việc triển khai Composite Key BẮT BUỘC phải tạo thêm class `EmbeddedId` hoặc `IdClass`. Bạn phải override `equals()` và `hashCode()` một cách thủ công và chính xác.
- **Rủi ro**: Dễ phát sinh lỗi trong quá trình quản lý vòng đời Entity (Persistence Context). Code trở nên rườm rà, khó bảo trì (Boilerplate code).
- **Giải pháp ưu tiên**: Sử dụng một cột `id` duy nhất (thường là `Long` hoặc `UUID`) làm **[[Surrogate_Key]]**.

## 3. Góc nhìn Operations & Modern Industry
- **Tiêu chuẩn công nghiệp**: Hầu hết các hệ thống hiện đại ưu tiên dùng **Surrogate Key (ID tự tăng hoặc UUID)**.
- **Lý do**:
    - **Performance**: Index trên 1 cột số nguyên luôn nhanh hơn index trên nhiều cột (đặc biệt là cột chuỗi).
    - **Refactoring**: Dễ dàng thay đổi logic kinh doanh mà không ảnh hưởng đến cấu trúc khóa (ví dụ: nếu sau này cho phép đăng ký lại môn học, Composite Key sẽ bị gãy).
    - **Integration**: Dễ dàng tích hợp với các hệ thống khác qua REST API (trình bày `/students/1/courses/10` dễ hơn là truyền một bộ khóa phức tạp).

## 💡 Kết luận (Architect Decision)
Dùng **Surrogate Key (ID)** để làm khóa chính cho thực thể Java, và dùng **Unique Constraint** trên bộ các cột quan trọng để đảm bảo tính toàn vẹn dữ liệu phía Database. Đây là mô thức "vẹn cả đôi đường".

## Related
- [[Junction_Table]]
- [[Relational_Data_Model]]
- [[Java_Maven_Lombok]]
