---
title: "Database Fundamentals: Chapter 1 - Databases and Database Users"
tags: [database, dbms, fundamentals, IT_Knowledge]
created: 2026-05-21
---

# Database Fundamentals: Chapter 1 - Databases and Database Users

## 1. Các Khái niệm Cơ bản (Introduction)
*   **Data (Dữ liệu):** Là những sự thật đã biết, có thể ghi chép lại và mang một ý nghĩa ngầm định nào đó.
*   **Database (CSDL):** Tập hợp các dữ liệu có liên quan, có tính thống nhất, có ý nghĩa và được thiết kế cho một mục đích cụ thể.
*   **DBMS (Hệ quản trị CSDL):** Hệ thống phần mềm máy tính giúp người dùng tạo, thao tác và bảo trì Database.
*   **Database System (Hệ CSDL):** Bao gồm cả Database (dữ liệu) và DBMS (phần mềm).

## 2. Đặc điểm của Phương pháp Database (Characteristics)
Thay vì dùng file truyền thống (File processing), DBMS mang lại 4 đặc tính cốt lõi:
1.  **Tính tự mô tả (Self-Describing):** Chứa sẵn định nghĩa về cấu trúc dữ liệu (meta-data/catalog). Nhờ đó giúp cho việc cập nhật hay thay đổi được dễ dàng thực hiện.
2.  **Độc lập Dữ liệu - Chương trình (Program-data independence) & Trừu tượng hóa (Data abstraction):** Đổi cấu trúc DB không cần viết lại code phần mềm. 
3.  **Hỗ trợ nhiều View (Góc nhìn):** Mỗi người dùng thấy một phần dữ liệu phù hợp với vai trò của họ.
4.  **Chia sẻ & Xử lý giao dịch (Sharing & Multiuser Transaction):** Cho phép nhiều người truy cập cùng lúc an toàn thông qua *Concurrency Control* và đảm bảo tính nguyên tử (Atomicity) của giao dịch.

## 3. Các "Diễn viên" tương tác với Database (Actors on the Scene)
*   **Database Administrators (DBA):** Quản trị viên, cấp quyền, theo dõi hệ thống.
*   **Database Designers:** Kiến trúc sư thiết kế cấu trúc DB trước khi triển khai.
*   **System Analysts & Application Programmers:** Lập trình viên viết code (VD: dùng Java) tạo ra các tính năng tương tác với DB.
*   **End Users (Người dùng cuối):**
    *   *Casual:* Dùng không thường xuyên, truy vấn phức tạp.
    *   *Naive / Parametric:* Dùng thường xuyên qua các nút/form đã lập trình sẵn (canned transactions). VD: Nhân viên giáo vụ.
    *   *Sophisticated:* Dùng công cụ DBMS tự viết truy vấn.
    *   *Standalone:* Dùng phần mềm cá nhân đóng gói sẵn.

## 4. Những người "sau cánh gà" (Workers behind the Scene)
Họ không thao tác trên dữ liệu thực tế mà xây dựng hệ thống:
*   **DBMS system designers:** Viết ra phần mềm như MySQL, Oracle...
*   **Tool developers:** Tạo phần mềm phụ trợ (vẽ sơ đồ, test).
*   **Operators:** Bảo trì phần cứng, server.

## 5. Các Lợi ích bổ sung của DBMS
*   **Kiểm soát Dư thừa (Controlling Redundancy):** Thông qua thiết kế **Data Normalization** để tránh lặp dữ liệu và sai lệch (Inconsistent).
*   **Hạn chế quyền (Restricting Unauthorized Access).**
*   **Lưu trữ bền vững (Persistent Storage):** Rất tốt cho các Object phức tạp trong Java/C++.
*   **Tối ưu tìm kiếm:** Dùng Indexes, Caching.
*   **Backup & Recovery:** Chống mất dữ liệu khi sập nguồn/phần mềm.
*   **Ép buộc Ràng buộc Toàn vẹn (Enforcing Integrity Constraints):** Ngăn chặn tạo dữ liệu sai luật (VD: Ngăn tạo mã SV trùng - Uniqueness constraint).

## 6. Khi nào KHÔNG NÊN dùng DBMS?
(Tránh "chi phí chìm" về phần cứng, nhân lực, tốc độ xử lý chậm do cồng kềnh)
*   Ứng dụng cực kỳ đơn giản, không bao giờ thay đổi cấu trúc.
*   Yêu cầu thời gian thực (Real-time) cực nhanh.
*   Hệ thống nhúng (Embedded systems) dung lượng quá hẹp.
*   Không có nhu cầu chia sẻ nhiều người dùng.
