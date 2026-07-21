---
domain: IT_Knowledge
type: project_stage
status: active
stage: 2
timeline: Tuần 4 - Tuần 7 (4 tuần)
assigned_roles: [Control Engineer, Simulation Engineer]
tags: [robotics, gazebo, ros2-control, pid, sensors, stage-2]
created: 2026-07-21
nexus_version: 8.4
---

# [[Giai_Doan_2_Mo_Phong_Dynamics_ROS2_Control]] — Giai đoạn 2: Tích hợp Động lực học & ROS 2 Control

> **Tóm tắt:** Giai đoạn nạp mô hình vào môi trường vật lý ảo Gazebo, cấu hình bộ điều khiển khớp `ros2_control`, tinh chỉnh PID và gắn các cảm biến ảo (IMU, Camera, LiDAR, Force/Torque).

---

## ⏱️ Quản lý Thời gian & Nhân sự
- **Thời lượng dự kiến:** 4 tuần (Tuần 4 – Tuần 7).
- **Phụ trách chính:**
  - `Control Engineer`: Cấu hình `ros2_control`, nạp mô hình động cơ Servo Brushless, tune PID.
  - `Simulation Engineer`: Xây dựng môi trường địa hình nông nghiệp Gazebo, cấu hình cảm biến ảo.

---

## 📋 Danh sách Tác vụ Chi tiết (Micro-Task Breakdown)

### 🔹 Task 2.1: Dựng Môi trường Nông nghiệp Ảo (Tuần 4)
- Tạo file Gazebo World (`agri_farm.world`): Mặt đất phẳng $\rightarrow$ Đất bùn gồ ghề $\rightarrow$ Độ dốc 10°.
- Thêm cây trồng ảo (cây ăn quả, luống rau) để phục vụ test va chạm và tầm nhìn sau này.

### 🔹 Task 2.2: Cấu hình `ros2_control` (Tuần 5)
- Viết file `ros2_control.xacro` khai báo các hardware interface (Position/Velocity/Effort).
- Khởi tạo `JointTrajectoryController` cho cánh tay và `EffortController` cho chân.

### 🔹 Task 2.3: Tinh chỉnh PID & Test Độ ổn định Vật lý (Tuần 6)
- Tinh chỉnh các hệ số PID ($P, I, D$) cho từng khớp Servo.
- Đảm bảo robot chịu được lực trọng trường ($g = 9.81\text{ m/s}^2$) mà không bị đổ gập khớp hay biến dạng vật lý trong Gazebo.

### 🔹 Task 2.4: Gắn Cảm biến Ảo (Sensors Plugin) (Tuần 7)
- Gắn plugin **IMU** tại trọng tâm thân robot.
- Gắn **Force/Torque Sensors** ở 2 lòng bàn chân để đo lực tiếp xúc mặt đất.
- Gắn **Depth Camera (Stereo)** và **LiDAR VLP-16** trên cabin điều khiển.

---

## 🎯 KPI & Cột mốc Đánh giá (Checkpoints)
- [x] **Checkpoint 2.1:** Dựng 3 loại Môi trường Nông nghiệp Gazebo (Đất Bằng, Đất Bùn Gồ Ghề, Độ Dốc 10°).
- [x] **Checkpoint 2.2:** Mô phỏng Động lực học Trọng trường ($g = 9.81\text{ m/s}^2$), Tải trọng Tay ($0 - 10\text{ kg}$) và phản ứng nhún gối PID.
- [x] **Checkpoint 2.3:** Tích hợp Cảm biến ảo & Luồng Telemetry Real-time (IMU Pitch/Roll, Lực bàn chân F/T, LiDAR PointCloud 30FPS, Depth Camera).


---

## 🔗 Liên kết Hệ thống
- ⏪ **Giai đoạn trước:** [[Giai_Doan_1_Mo_Phong_CAD_URDF]]
- 🗺️ [[Ke_Hoach_Mo_Phong_Robot_Humanoid]]: Kế hoạch tổng thể 5 giai đoạn mô phỏng.
- ⏩ **Giai đoạn tiếp theo:** [[Giai_Doan_3_Mo_Phong_Locomotion_Balance]]
