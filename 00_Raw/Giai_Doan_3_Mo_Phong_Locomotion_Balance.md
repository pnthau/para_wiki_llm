---
domain: IT_Knowledge
type: project_stage
status: active
stage: 3
timeline: Tuần 8 - Tuần 12 (5 tuần)
assigned_roles: [Robotics Control Lead, Algorithm Engineer]
tags: [robotics, locomotion, ik, zmp, moveit2, pinocchio, stage-3]
created: 2026-07-21
nexus_version: 8.4
---

# [[Giai_Doan_3_Mo_Phong_Locomotion_Balance]] — Giai đoạn 3: Thuật toán Dáng đi (Locomotion) & Cân bằng

> **Tóm tắt:** Lập trình giải thuật Động học ngược (Inverse Kinematics), thuật toán thăng bằng ZMP (Zero Moment Point) và chu kỳ bước đi (Gait cycle) giúp Robot Humanoid đi lại được trên địa hình nông nghiệp ảo.

---

## ⏱️ Quản lý Thời gian & Nhân sự
- **Thời lượng dự kiến:** 5 tuần (Tuần 8 – Tuần 12).
- **Phụ trách chính:**
  - `Robotics Control Lead`: Lập trình Động học ngược (IK), giải thuật cân bằng ZMP.
  - `Algorithm Engineer`: Xây dựng ROS 2 Node điều khiển chu kỳ bước đi (Gait Generator) & thử nghiệm mang tải.

---

## 📋 Danh sách Tác vụ Chi tiết (Micro-Task Breakdown)

### 🔹 Task 3.1: Động học ngược (Inverse Kinematics - IK) (Tuần 8 – 9)
- Cấu hình **MoveIt 2** hoặc tích hợp thư viện **Pinocchio** để tính IK cho 6-DoF 2 chân.
- Đảm bảo tính toán quỹ đạo bàn chân (Footstep trajectory) mượt mà không bị lặp nghiệm hay chạm điểm dị biệt (Singularity).

### 🔹 Task 3.2: Thuật toán Thăng bằng ZMP & IMU Feedback (Tuần 10)
- Lập trình thuật toán thăng bằng dựa trên Zero Moment Point (ZMP).
- Kết hợp bộ lọc Kalman (EKF) xử lý dữ liệu từ IMU và cảm biến lực bàn chân để tự động điều chỉnh độ nghiêng cột sống khi mất thăng bằng.

### 🔹 Task 3.3: Gait Cycle Controller Node (Tuần 11)
- Viết ROS 2 Node sinh chu kỳ bước đi (Single Support Phase vs Double Support Phase).
- Thử nghiệm cho robot bước đi từ từ trên đất nông nghiệp phẳng $\rightarrow$ gồ ghề.

### 🔹 Task 3.4: Thử nghiệm Tải trọng 5kg (Tuần 12)
- Gán thêm khối lượng 5kg trên mỗi tay của robot.
- Đánh giá khả năng giữ thăng bằng và điều chỉnh lực nhún khớp gối/cổ chân khi mang tải trọng di chuyển.

---

## 🎯 KPI & Cột mốc Đánh giá (Checkpoints)
- [x] **Checkpoint 3.1:** Giải Động học ngược (IK) chu kỳ bước đi & điều chỉnh Cadence / Step Height realtime (100 Hz Loop).
- [x] **Checkpoint 3.2:** Thuật toán Điểm thăng bằng ZMP (Zero Moment Point) hoạt động liên tục với vòng tròn chỉ thị ZMP trên mặt đất ($98\%\text{ Stable}$).
- [x] **Checkpoint 3.3:** Kiểm thử thành công 2 mô hình dáng đi: Bước đi ZMP tiêu chuẩn & Bước đi mang tải trọng $5\text{kg}$.


---

## 🔗 Liên kết Hệ thống
- ⏪ **Giai đoạn trước:** [[Giai_Doan_2_Mo_Phong_Dynamics_ROS2_Control]]
- 🗺️ [[Ke_Hoach_Mo_Phong_Robot_Humanoid]]: Kế hoạch tổng thể 5 giai đoạn mô phỏng.
- ⏩ **Giai đoạn tiếp theo:** [[Giai_Doan_4_Mo_Phong_Teleop_VR_Haptic]]
