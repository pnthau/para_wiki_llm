---
domain: IT_Knowledge
type: project_stage
status: active
stage: 1
timeline: Tuần 1 - Tuần 3 (3 tuần)
assigned_roles: [CAD Mechanical Engineer, ROS 2 Engineer]
tags: [robotics, cad, urdf, fusion360, rviz2, stage-1]
created: 2026-07-21
nexus_version: 8.4
---

# [[Giai_Doan_1_Mo_Phong_CAD_URDF]] — Giai đoạn 1: Dựng Mô hình Khung 3D & Xuất URDF

> **Tóm tắt:** Giai đoạn đầu tiên xây dựng mô hình hình học và cấu trúc vật lý của Robot Humanoid 6-DoF trên phần mềm CAD và xuất thành gói tài nguyên URDF/SDF sẵn sàng cho mô phỏng ROS 2.

---

## ⏱️ Quản lý Thời gian & Nhân sự
- **Thời lượng dự kiến:** 3 tuần (Tuần 1 – Tuần 3).
- **Phụ trách chính:**
  - `CAD Mechanical Engineer`: Thiết kế khung 3D, phân bổ khớp, gắn khối lượng & inertia.
  - `ROS 2 Engineer`: Export file URDF/SDF, tạo gói `agri_robot_description` và kiểm tra trên Rviz2.

---

## 📋 Danh sách Tác vụ Chi tiết (Micro-Task Breakdown)

### 🔹 Task 1.1: Thiết kế CAD Khung 3D (Tuần 1)
- Thiết kế khung xương 2 tay, 2 chân, cột sống và khoang người ngồi lái.
- Định vị chính xác 6 khớp (6-DoF) mỗi chi đảm bảo dải chuyển động linh hoạt.
- Công cụ: Fusion 360 / SolidWorks.

### 🔹 Task 1.2: Phân bổ Thông số Vật lý thực tế (Tuần 2)
- Gán vật liệu nhôm nhẹ / carbon-fiber cho khung.
- Định nghĩa thông số khối lượng ($m$), Tâm khối (Center of Mass - CoM) và Ma trận quán tính (Inertia Matrix $I_{xx}, I_{yy}, I_{zz}$) cho từng link.

### 🔹 Task 1.3: Export sang URDF / SDF (Tuần 2.5)
- Sử dụng plugin `fusion2urdf` hoặc `solidworks2urdf` để tự động hóa quá trình xuất.
- Chuẩn hóa cấu trúc cây khớp (Joint tree: Parent-Child relations).
- Phân tách Mesh hình học thành: `visual mesh` (render đẹp) và `collision mesh` (đơn giản hóa cho vật lý).

### 🔹 Task 1.4: Khởi tạo ROS 2 Package & Visualize (Tuần 3)
- Tạo gói ROS 2: `ros2 pkg create --build-type ament_cmake agri_robot_description`.
- Viết `display.launch.py` để load robot model lên **Rviz2** với `joint_state_publisher_gui`.

---

## 🎯 KPI & Cột mốc Đánh giá (Checkpoints)
- [x] **Checkpoint 1.1:** Khung Robot 3D hoàn chỉnh 12-DoF (Thân, Đầu, 2 Tay, 2 Chân, Cùi chỏ, Đầu gối).
- [x] **Checkpoint 1.2:** File URDF & Web Viewer 3D load mượt mà trên trình duyệt, thanh trượt GUI điều khiển đủ 12-DoF từng chi.
- [x] **Checkpoint 1.3:** Tích hợp nút Tự động Demo Cử động Dáng đi & Tay mượt mà trên `view_robot.html`.


---

## 🔗 Liên kết Hệ thống
- 🗺️ [[Ke_Hoach_Mo_Phong_Robot_Humanoid]]: Kế hoạch tổng thể 5 giai đoạn mô phỏng.
- 📄 [Robot_humanic.md](file:///D:/data/para_wiki_llm/00_Raw/Inbox/Robot_humanic.md): Thiết kế tổng quan robot humanoid.
- ⏩ **Giai đoạn tiếp theo:** [[Giai_Doan_2_Mo_Phong_Dynamics_ROS2_Control]]
