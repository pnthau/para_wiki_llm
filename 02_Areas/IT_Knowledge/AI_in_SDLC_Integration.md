---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [AI, SDLC, Gemini_Pro, Software_Engineering, TDD, Agile, Code_Review]
created: 2026-07-09
updated: 2026-07-09
nexus_version: 8.4
---

# Tích Hợp AI (Gemini Pro) Vào Vòng Đời Phát Triển Phần Mềm (SDLC)

> **Mục tiêu:** Áp dụng AI vào mọi khâu trong SDLC (không chỉ gõ code), phân biệt rõ khâu nào mang lại High ROI (AI cực tốt) và khâu nào cần sự can thiệp của con người (Low ROI).

## 🧠 Cornell Notes

| Cue (Gợi nhớ) | Notes (Nội dung chính) |
|---|---|
| **AI trong Pre-coding (Yêu cầu & Thiết kế)** | - **Khám phá (Discovery):** Bóc tách User Research thô thành User Stories chuẩn Agile cực nhanh.<br>- **Soạn ADR (Architecture Decision Record):** Dùng Agent Panel tự động tạo bảng đánh giá ưu/nhược điểm công nghệ.<br>⚠️ *Ranh giới:* AI tổng hợp, định dạng và trích xuất kiến thức rất tốt (Excellent Researcher), nhưng **không biết ngữ cảnh nội bộ/ngân sách công ty**. Quyết định cuối cùng (Decision) bắt buộc phải do con người chốt. |
| **Lựa chọn Chế độ Coding** | - **Autocomplete Mode (Ghost text/Inline Chat):** Phù hợp gõ nhanh Boilerplate, Utils đơn giản. Xử lý tác vụ cục bộ.<br>- **Agent Mode (Panel Cmd+Shift+I):** Dành cho Refactoring đa tầng, xử lý logic phức tạp toàn workspace, hoặc thiết kế dựa trên Spec.<br>🚀 *Khung quyết định:* Tác vụ thấp cục bộ -> Tự code/Autocomplete. Tác vụ cao/kiến trúc -> Agent Mode / Pair-programming cùng AI. Đừng dùng Agent cho boilerplate, đừng dùng Autocomplete cho kiến trúc. |
| **Code Review 2 Chiều** | 1. **Con người rà soát AI (Phát hiện Bug Chốt Chặn):** AI có thể tạo ra anti-patterns (Fat Controller, Hardcode, bỏ qua check null). Lập trình viên phải là chốt chặn cuối cùng kiểm duyệt logic nghiệp vụ và bảo mật.<br>2. **AI rà soát Con người (Tối ưu hóa Phức tạp):** Viết code xong nhờ AI phân tích Big O, rủi ro Edge Cases và tối ưu thuật toán (VD: từ $O(n^2)$ xuống $O(n)$ dùng HashMap/Stream). |
| **Automation Testing & TDD** | - Dùng AI phân tích Đặc tả (Spec) để tìm **Edge Cases** cực kỳ nhạy bén (âm, null, lỗi concurrency).<br>- **TDD-with-AI:** Nhờ AI viết Unit Test (JUnit/Mockito) trước khi viết code nghiệp vụ $\rightarrow$ Tạo "lưới bảo hiểm" cực nhanh.<br>- **Property-based testing:** Thay vì fixed example, nhờ AI viết code dùng thư viện như jqwik để tạo hàng ngàn dữ liệu ngẫu nhiên nã vào hàm. |
| **Debug, Refactor & Docs (High ROI)** | Đây là 3 khâu tiết kiệm 70% thời gian vì thao tác trên codebase có sẵn:<br>- **Debug:** Paste Stack Trace đỏ lòm $\rightarrow$ AI chỉ thẳng lỗi ở dòng nào và đề xuất fix. ⚠️ *Lưu ý an toàn:* Xóa/Ẩn PII, secrets trước khi paste log.<br>- **Refactor:** Kết hợp Multi-file editing + Spec file để tách Fat Controller thành Clean Architecture.<br>- **Documentation:** AI tự động sinh Javadoc và file README.md (API Docs) chuẩn chỉnh trong vài giây. |

## 🔄 Tổng kết (Summary)

**Khung Tóm Tắt Thực Chiến (3 Trụ Cột Chống Nợ Kỹ Thuật):**

1. **Phân biệt Mode (Vũ khí):** 
   - Dùng **Autocomplete Mode** (nhấn Tab) cho code cơ bắp, lặp lại.
   - Dùng **Agent Mode** (Panel) cho tư duy kiến trúc, sửa đa tệp, viết ADR.
   - *Luật ngầm:* AI phân tích, Con người chốt quyết định!
2. **Code Review 2 Chiều & High ROI:** 
   - **Con người soi AI:** Làm chốt chặn chặn lỗi nghiệp vụ/bảo mật.
   - **AI soi Con người:** Giảm độ phức tạp Big O (từ $O(n^2)$ xuống $O(n)$).
   - **High ROI:** Giao cho AI xử lý 3 khâu có sẵn: **Debug** (nhớ tẩy trắng PII), **Refactor**, và **Documentation**.
3. **Lưới bảo hiểm TDD-with-AI:** 
   - Sinh Đỏ 🔴 (Test trước) $\rightarrow$ Viết Xanh 🟢 (Code nghiệp vụ) $\rightarrow$ Refactor ✨ (Làm đẹp).
   - Bơm thêm **Property-based testing** (tạo số ngẫu nhiên) để diệt sạch bug ẩn.

> **Định luật sinh tồn:** Đừng mù quáng bấm Tab. Dùng đầu óc để rà soát chất lượng của AI, và dùng AI để nâng tầm tối ưu hóa cho tư duy của chính mình!

## 🔗 Liên kết mở rộng (Smart Linking)
- [[MOC_IT_Knowledge]]
- [[AI_CORAL_Architecture]]
- [[TDD_with_AI]]
- [[Clean_Architecture]]
