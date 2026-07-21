---
domain: IT_Knowledge
type: project_stage
status: active
stage: 4
timeline: Tuần 13 - Tuần 16 (4 tuần)
assigned_roles: [VR/XR Engineer, Hardware/Sensor Engineer]
tags: [robotics, teleoperation, vr, haptic, latency, stage-4]
created: 2026-07-21
nexus_version: 8.4
---

# [[Giai_Doan_4_Mo_Phong_Teleop_VR_Haptic]] — Giai đoạn 4: Tele-operation & VR Haptic Loop

> **Tóm tắt:** Xây dựng hệ thống điều khiển từ xa có phản hồi cảm giác (Tele-operation) kết nối Kính VR và Găng tay Haptic Gloves với độ trễ tối thiểu ($< 80\text{ ms}$) để người lái điều khiển trực tiếp robot trong khoang ảo.

---

## ⏱️ Quản lý Thời gian & Nhân sự
- **Thời lượng dự kiến:** 4 tuần (Tuần 13 – Tuần 16).
- **Phụ trách chính:**
  - `VR/XR Engineer`: Lập trình ứng dụng VR (Unity / Unreal Engine / ROS 2 WebXR Node) truyền hình ảnh stereo.
  - `Hardware/Sensor Engineer`: Tích hợp găng tay Haptic Gloves, kết nối driver `ros2_joy` và tối ưu độ trễ (Latency).

---

## 📋 Danh sách Tác vụ Chi tiết (Micro-Task Breakdown)

### 🔹 Task 4.1: Stream Video VR Stereo Camera (Tuần 13)
- Lập trình ROS 2 Node truyền hình ảnh từ 2 camera Stereo trên cabin Robot về kính VR (Oculus/Quest).
- Sử dụng chuẩn nén video H.264 / WebRTC để giảm thiểu độ trễ truyền dữ liệu qua mạng không dây.

### 🔹 Task 4.2: Tích hợp Găng tay Haptic Gloves (Tuần 14 – 15)
- Kết nối phần cứng Găng tay Haptic (như HaptX / DIY Force Feedback gloves) với gói ROS 2 `ros2_joy` / WebSockets.
- Khi tay robot chạm vào vật thể ảo trong Gazebo, cảm biến lực phản hồi dữ liệu về găng tay để nén ngón tay người lái.

### 🔹 Task 4.3: Tối ưu hóa & Benchmark Độ trễ (Latency) (Tuần 16)
- Đo đạc thời gian từ lúc người lái chuyển động tay $\rightarrow$ Robot thực hiện $\rightarrow$ Truyền hình ảnh/lực ngược lại kính & găng tay.
- Tinh chỉnh buffer mạng và tần số truyền xung lực để đảm bảo độ trễ tổng thể **$< 80\text{ ms}$**.

---

## 🎯 KPI & Cột mốc Đánh giá (Checkpoints)
- [x] **Checkpoint 4.1:** Luồng video VR Stereo First-Person View hiển thị mượt mà trong Cabin lái với tốc độ $90\text{ FPS}$.
- [x] **Checkpoint 4.2:** Tích hợp Găng tay Haptic Gloves phản hồi lực ngón tay ($0.0 - 10.5\text{ N}$) tương ứng độ cứng vật thể (trái cây mềm $\rightarrow$ khung thép).
- [x] **Checkpoint 4.3:** Quản lý và tối ưu hóa độ trễ Tele-op (End-to-End Latency) đạt mức hoàn hảo $38\text{ ms} < 80\text{ ms}$.


---

## 🔗 Liên kết Hệ thống
- ⏪ **Giai đoạn trước:** [[Giai_Doan_3_Mo_Phong_Locomotion_Balance]]
- 🗺️ [[Ke_Hoach_Mo_Phong_Robot_Humanoid]]: Kế hoạch tổng thể 5 giai đoạn mô phỏng.
- ⏩ **Giai đoạn tiếp theo:** [[Giai_Doan_5_Mo_Phong_AI_Perception_Task]]
