---
domain: IT_Knowledge
type: project-spec
status: active
tags: [java, spring-boot, ai, llm, speech-to-text, text-to-speech, video-marching, n5, roleplay-engine]
created: 2026-08-14
updated: 2026-08-14
nexus_version: 8.5
related_notes:
  - "[[plan_board_video_call_marching]]"
  - "[[Video_Call_Match_Architecture]]"
  - "[[Java_Learning_Log]]"
  - "[[Japanese_N5_Study_Plan]]"
---

# 🎯 Kế Hoạch Tích Hợp "AI Tutor: Interactive Roleplay Engine"

> **Định hướng mới (Real Video Call + Scripted AI):** Khác với chatbot thông thường, AI Tutor sẽ tham gia vào giao diện Video Call 1-1. Học viên sẽ thực hành các **Kịch bản Roleplay (Scripts)** do Admin soạn sẵn. AI đóng vai trò như một cỗ máy trạng thái (State Machine): nếu học viên nói đúng ý, AI lập tức tiếp nối mạch truyện; nếu sai, AI sẽ thoát vai để sửa lỗi và hướng dẫn.

---

## 📐 Kiến Trúc Tổng Quan (Script Execution Engine)

```
┌──────────────────────────────────────────────────────────────────┐
│                    TRÌNH DUYỆT HỌC VIÊN                          │
│                                                                  │
│  ┌──────────┐      Giao diện y hệt phòng gọi người thật          │
│  │ Webcam   │      (Không dùng giao diện chat)                   │
│  │ (Local)  │                                                    │
│  └──────────┘                                                    │
│      │ Audio Blob (qua WebSocket)                                │
│      ▼                                                           │
├──────────────────────────────────────────────────────────────────┤
│              SPRING BOOT BACKEND (Roleplay Engine)               │
│                                                                  │
│  ┌──────────────────┐    ┌───────────────────────────────────┐  │
│  │ SttService       │───►│  State Machine (AiRoomSession)    │  │
│  │ (Deepgram Free)  │    │  - Kịch bản đang học: Combini     │  │
│  └──────────────────┘    │  - Bước hiện tại: Line 2          │  │
│                          └─────────┬─────────────────────────┘  │
│                                    │ Xác định mục tiêu cần nói   │
│                                    ▼                             │
│  ┌──────────────────┐    ┌───────────────────────────────────┐  │
│  │ TtsService       │◄───│  LLM Evaluator (Gemini/Groq/...)  │  │
│  │ (Edge-TTS Free)  │    │  Đánh giá câu nói của học viên:   │  │
│  └──────────────────┘    │  • ĐÚNG → Bỏ qua khen, đi tiếp    │  │
│                          │  • SAI  → Thoát vai, sửa lỗi      │  │
│                          └───────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────┘
```

---

## 📋 Phân Chia Chức Năng Thành Các Task Nhỏ

### 🟢 PHASE 1: Quản Lý Kịch Bản (Admin Panel & DB)
> **Mục tiêu:** Xây dựng cấu trúc dữ liệu để định nghĩa các bước Roleplay.

#### Task 1.1 — Tạo Entity `RoleplayScript` và `ScriptLine`
- **⏱️ Thời gian:** ~20 phút
- **Nội dung:**
  - `RoleplayScript`: Quản lý bộ kịch bản (id, title, topicTag, targetLevel, description).
  - `ScriptLine`: Chi tiết từng câu thoại (id, scriptId, lineOrder, roleType [AI_ROLE/USER_ROLE], expectedMeaning, aiResponseText, hintForUser).

#### Task 1.2 — Trạng thái Phòng học (`AiRoomSession`)
- **⏱️ Thời gian:** ~15 phút
- **Nội dung:**
  - Entity `AiRoomSession`: (id, userId, scriptId, currentLineIndex, status).
  - Backend phải biết học viên đang ở câu số mấy của kịch bản để LLM chấm đúng mục tiêu.

---

### 🟡 PHASE 2: LLM Evaluator & Speech Pipeline
> **Mục tiêu:** Tích hợp STT, TTS và Engine chấm điểm tự động.

#### Task 2.1 — LLM Fallback Service (Engine Xử lý)
- **⏱️ Thời gian:** ~30 phút
- **Nội dung:** Tạo `LlmFallbackService` hỗ trợ BYOK (Gemini, Groq, Cerebras, OpenRouter) như đã thiết kế.

#### Task 2.2 — Cấu hình Prompt Đánh giá Kịch bản (Core Logic)
- **⏱️ Thời gian:** ~30 phút
- **Nội dung:** Tạo hàm sinh Prompt động gửi cho LLM.
- **Quy tắc Thép (Do John định nghĩa):**
  - **Nếu ĐÚNG:** LLM KHÔNG được khen ngợi. LLM phải lập tức nhập vai nhân vật và trả về câu thoại tiếp theo của kịch bản. Trả mã `[PASS]`.
  - **Nếu SAI / QUÊN:** LLM thoát vai nhân vật, chuyển sang vai Giáo viên. Giải thích nhẹ nhàng lỗi sai và gợi ý cách nói. Trả mã `[RETRY]`.

#### Task 2.3 — STT & TTS Services
- **⏱️ Thời gian:** ~30 phút
- **Nội dung:** Tích hợp Deepgram API (Speech to Text) và Edge-TTS (Text to Speech).

---

### 🔵 PHASE 3: WebSocket Controller & Xử lý Trạng thái
> **Mục tiêu:** Xử lý luồng âm thanh và điều hướng State Machine.

#### Task 3.1 — `AiChatController` (WebSocket)
- **⏱️ Thời gian:** ~40 phút
- **Nội dung:**
  - Nhận Audio Blob từ Client → Đưa qua STT lấy văn bản.
  - Query DB lấy `AiRoomSession` và `ScriptLine` hiện tại.
  - Đưa Text + ExpectedMeaning vào LLM.
  - Đọc kết quả LLM:
    - Nếu `[PASS]`: `currentLineIndex++`. Gọi TTS câu thoại tiếp theo → Gửi Audio về Client.
    - Nếu `[RETRY]`: Không tăng Index. Gọi TTS câu giải thích → Gửi Audio về Client.
  - Khi `currentLineIndex` vượt quá số lượng Line → Kết thúc kịch bản, cộng điểm nhiệm vụ (Mission).

---

### 🟣 PHASE 4: Frontend — Giao Diện Video Call Tương Tác
> **Mục tiêu:** Giữ nguyên giao diện Video Call, tích hợp AI âm thầm.

#### Task 4.1 — Clone UI từ `video_call.html`
- **⏱️ Thời gian:** ~30 phút
- **Nội dung:** Tạo `ai_video_call.html`. Giữ nguyên layout 2 camera.
  - Camera trái: Dùng `getUserMedia()` hiện Webcam local.
  - Camera phải: Hiển thị một Video vòng lặp (Looping Video) hoặc Avatar tĩnh mô phỏng AI đang online.

#### Task 4.2 — Client Audio Logic
- **⏱️ Thời gian:** ~30 phút
- **Nội dung:**
  - Thu âm Mic liên tục (hoặc dùng Voice Activity Detection - VAD) và gửi qua WebSocket `/app/ai/send-audio`.
  - Nhận Audio Base64 từ WebSocket và dùng Audio API phát ra loa (AI đang nói chuyện).

---

### ⚪ PHASE 5: Cấu Hình API Key (BYOK)
> **Mục tiêu:** Tránh chi phí Server bằng cách cho User tự nhập Key.

#### Task 5.1 — Settings UI & API
- **⏱️ Thời gian:** ~25 phút
- **Nội dung:** Trang `/settings/keys` cho phép user nhập và test Gemini/Groq API Key.

---

## ⏱️ Tổng Kết & Thứ Tự Thực Hiện

| Phase | Mô tả | Số Task | Thời gian |
| :---: | :--- | :---: | :---: |
| 1 | DB Kịch Bản & Trạng Thái | 2 | ~35 phút |
| 2 | LLM Evaluator & STT/TTS | 3 | ~90 phút |
| 3 | WebSocket State Machine | 1 | ~40 phút |
| 4 | Frontend UI & Audio Logic | 2 | ~60 phút |
| 5 | Settings BYOK | 1 | ~25 phút |
| **Tổng** | | **9 task** | **~250 phút (~4 giờ)** |

---

## 🧠 Minh Hoạ Prompt Evaluator (Task 2.2)

```text
Bạn là hệ thống điều phối Roleplay tiếng Nhật.
Trạng thái: Bước 2.
Mục tiêu học viên cần nói: "Hỏi giá tiền của món đồ này".
Học viên vừa nói: "{user_text}"

ĐÁNH GIÁ:
1. Nếu câu học viên đúng ngữ nghĩa và ngữ pháp N5:
   - Trả về dòng 1: [PASS]
   - Trả về dòng 2 (Nhập vai và nói tiếp): "これは500円です。" (Đây là 500 yên ạ).
   - TUYỆT ĐỐI KHÔNG KHEN NGỢI, không nói "Bạn làm tốt lắm", chỉ nói đúng câu thoại.

2. Nếu câu học viên sai hoặc không đúng mục tiêu:
   - Trả về dòng 1: [RETRY]
   - Trả về dòng 2 (Thoát vai, làm giáo viên hướng dẫn): "Câu em vừa nói chưa đúng ngữ pháp hỏi giá. Em dùng cấu trúc '...wa ikura desu ka' nhé. Thử lại nào!"
```
