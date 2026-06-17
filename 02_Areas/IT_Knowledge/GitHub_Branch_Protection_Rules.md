---
domain: "IT"
type: "atomic-note"
status: "active"
tags: [git, github, branch-protection, code-review, teamwork]
created: 2026-06-17
keywords: [branch protection, require reviews, github settings, peer review]
---

# 🛡️ Thiết Lập Bắt Buộc Review Chéo (Branch Protection) trên GitHub

> **Tóm tắt:** Hướng dẫn cấu hình luật bảo vệ nhánh chính (`master`/`main`) trên GitHub để bắt buộc đồng đội phải duyệt code (Approve) trước khi gộp (Merge), đảm bảo an toàn hệ thống.

---

| Cues (Từ khóa / Bước cấu hình) | Notes (Nội dung hướng dẫn chi tiết) |
| :--- | :--- |
| **Phần 1: Cấu hình trên GitHub (Chỉ chủ Repo làm)** | **Bước 1: Vào Cài đặt Repository**<br>Truy cập vào trang dự án của anh trên GitHub.com ➔ Chọn tab **`Settings`** (ở góc phải menu trên cùng).<br><br>**Bước 2: Chọn cấu hình Branches**<br>Ở menu thanh bên trái, tìm mục **`Code and automation`** ➔ Chọn **`Branches`**.<br><br>**Bước 3: Thêm luật bảo vệ nhánh**<br>Tại phần **Branch protection rules**, nhấn nút **`Add branch protection rule`** (hoặc **`Add rule`**).<br><br>**Bước 4: Nhập tên nhánh cần bảo vệ**<br>Ở ô **Branch pattern name**, nhập chính xác tên nhánh chính của anh:<br>➔ Nhập **`master`** (hoặc `main` tùy theo dự án).<br><br>**Bước 5: Kích hoạt luật bắt buộc duyệt PR**<br>1. Tích chọn vào ô **`Require a pull request before merging`** (Yêu cầu phải có Pull Request trước khi gộp).<br>2. Tích chọn tiếp vào ô **`Require approvals`** (Yêu cầu phê duyệt).<br>3. Ở ô **Required number of approvals before merging**, chọn số lượng đồng đội cần duyệt: chọn **`1`** (chỉ cần 1 người khác duyệt là được gộp - phù hợp cho nhóm nhỏ).<br><br>**Bước 6: Khóa tự duyệt (Tự kiểm soát chéo)**<br>*(Tùy chọn)* Tích chọn **`Dismiss stale pull request approvals when new commits are pushed`** (Nếu anh sửa thêm code mới sau khi đã được duyệt, lượt duyệt cũ sẽ tự hủy và bắt buộc đồng đội phải duyệt lại từ đầu).<br><br>**Bước 7: Tạo luật**<br>Cuộn xuống dưới cùng và nhấn **`Create`** (hoặc **`Save changes`**). Nhập mật khẩu GitHub của anh nếu được yêu cầu. |
| **Phần 2: Quy trình làm việc chéo hàng ngày của nhóm** | **Kịch bản thực tế khi làm việc:**<br><br>**Bước 1: Thành viên A gửi PR**<br>Thành viên A hoàn thành code trên nhánh `feature/quick-order` ➔ Gửi Pull Request lên GitHub.<br>➔ Lúc này, nút **Merge pull request** của Thành viên A sẽ bị khóa (màu xám) và hiện thông báo: *"At least 1 approval dreadfully required before merging" (Cần ít nhất 1 người phê duyệt)*.<br><br>**Bước 2: Thành viên B vào review code**<br>Thành viên B (đồng đội) truy cập vào Pull Request đó:<br>1. Chọn tab **`Files changed`** để xem các dòng code thành viên A đã viết.<br>2. Nếu code ổn, thành viên B nhấn nút **`Review changes`** ở góc phải.<br>3. Chọn tick vào ô **`Approve`** (Đồng ý) và viết thêm nhận xét (ví dụ: *"Code đẹp, đã test ok"*).<br>4. Nhấn **`Submit review`**.<br><br>**Bước 3: Gộp code vào master**<br>Ngay khi thành viên B nhấn gửi duyệt, giao diện PR của Thành viên A sẽ chuyển sang màu xanh sạch sẽ và nút **`Merge pull request`** sẽ sáng lên. Thành viên A (hoặc B) nhấp vào đó để chính thức gộp code vào `master`! |
| **Tại sao quy trình này cực kỳ quan trọng?** | 1. **Tránh lỗi ngớ ngẩn:** Đồng đội sẽ nhìn ra những lỗi chính tả, lỗi cấu hình, hoặc logic sót mà người viết không thấy (hiệu ứng "mù chữ ta tự viết").<br>2. **Học hỏi lẫn nhau:** Các thành viên trong nhóm sẽ đọc code của nhau, hiểu cách viết của nhau và nâng cao trình độ nhanh chóng.<br>3. **Đồng bộ kiến thức:** Cả nhóm luôn biết dự án đang có những tính năng gì mới được gộp vào. |

---

## 🎨 Minh Họa Giao Diện Review Chéo trên GitHub

```text
[ Pull Request #12: feature/quick-order ]
┌─────────────────────────────────────────────────────────────────┐
│  Hau-san wants to merge 5 commits into master                   │
├─────────────────────────────────────────────────────────────────┤
│  ⚠️ Review required                                             │
│  At least 1 approval from collaborators is required.            │
│  [Button: Merge Pull Request] -> ĐANG BỊ KHÓA (MÀU XÁM)          │
├─────────────────────────────────────────────────────────────────┤
│  (Đồng đội B click vào tab "Files changed" -> Click Approve)     │
├─────────────────────────────────────────────────────────────────┤
│  ✅ 1 approval from Teammate B                                  │
│  [Button: Merge Pull Request] -> ĐÃ SÁNG XANH (BẤM ĐỂ GỘP CODE!) │
└─────────────────────────────────────────────────────────────────┘
```
