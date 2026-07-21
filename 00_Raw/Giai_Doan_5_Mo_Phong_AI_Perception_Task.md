---
domain: IT_Knowledge
type: project_stage
status: active
stage: 5
timeline: Tuần 17 - Tuần 20 (4 tuần)
assigned_roles: [AI/Vision Engineer, Product/Behavior Lead]
tags: [robotics, ai, yolov8, behavior-tree, simulation-demo, stage-5]
created: 2026-07-21
nexus_version: 8.4
---

# [[Giai_Doan_5_Mo_Phong_AI_Perception_Task]] — Giai đoạn 5: Tích hợp Nhận diện AI & Kịch bản Nhiệm vụ

> **Tóm tắt:** Huấn luyện mô hình AI thị giác máy tính (YOLOv8), xây dựng Cây hành vi (Behavior Tree) tự động hóa nhiệm vụ nông nghiệp và xuất Video Demo mô phỏng End-to-End phục vụ Investor Pitch Deck.

---

## ⏱️ Quản lý Thời gian & Nhân sự
- **Thời lượng dự kiến:** 4 tuần (Tuần 17 – Tuần 20).
- **Phụ trách chính:**
  - `AI/Vision Engineer`: Huấn luyện mô hình YOLOv8, tích hợp ROS 2 image pipeline & 3D Bounding Box từ LiDAR.
  - `Product/Behavior Lead`: Lập trình Behavior Tree (`behaviortree_cpp_v3`), chạy kịch bản End-to-End & dựng Video Demo.

---

## 📋 Danh sách Tác vụ Chi tiết (Micro-Task Breakdown)

### 🔹 Task 5.1: Huấn luyện & Tích hợp YOLOv8 Perception (Tuần 17)
- Thu thập dataset hình ảnh cây trồng, trái cây, bệnh lá và cỏ dại trong Gazebo.
- Fine-tune mô hình **YOLOv8** và nhúng vào ROS 2 Node (`yolov8_ros2`).
- Kết hợp Depth Camera để xác định tọa độ 3D ($X, Y, Z$) của mục tiêu cần hái/xử lý.

### 🔹 Task 5.2: Xây dựng Behavior Tree Tự động hóa (Tuần 18 – 19)
- Sử dụng thư viện `behaviortree_cpp_v3` để xây dựng luồng kịch bản nông nghiệp:
  1. *Di chuyển tới vùng chỉ định (Navigation 2)*
  2. *Quét cảm biến phát hiện trái chín (YOLOv8)*
  3. *Điều khiển tay nhặt hái (MoveIt 2 IK)*
  4. *Đặt vào thùng chứa và quay lại vị trí ban đầu*

### 🔹 Task 5.3: End-to-End Test & Dựng Video Demo Pitch Deck (Tuần 20)
- Chạy thử nghiệm toàn bộ luồng hoạt động tự động trong 30 phút liên tục.
- Ghi hình Video Demo 3-5 phút (góc quay VR + góc nhìn toàn cảnh Gazebo) minh họa khả năng đa nhiệm của Robot.
- Đóng gói dữ liệu KPI năng suất làm tài liệu chứng minh cho Pitch Deck $1.5\text{M USD}$.

---

## 🎯 KPI & Cột mốc Đánh giá (Checkpoints)
- [x] **Checkpoint 5.1:** AI YOLOv8 nhận diện trái cà chua chín & xuất khung Bounding Box + Tọa độ 3D ($98.4\%\text{ Confidence}$).
- [x] **Checkpoint 5.2:** Cây hành vi Behavior Tree (`behaviortree_cpp_v3`) tự động rẽ nhánh điều phối nhiệm vụ 5 bước từ Navigation $\rightarrow$ Scan $\rightarrow$ Reach IK $\rightarrow$ Grasp $\rightarrow$ Deposit.
- [x] **Checkpoint 5.3:** Hoàn thành Bản Mô Phỏng End-to-End 3D Interactive Demo sẵn sàng cho Investor Pitch Deck gọi vốn $1.5\text{M USD}$.

---

## 🔗 Liên kết Hệ thống
- ⏪ **Giai đoạn trước:** [[Giai_Doan_4_Mo_Phong_Teleop_VR_Haptic]]
- 🗺️ [[Ke_Hoach_Mo_Phong_Robot_Humanoid]]: Kế hoạch tổng thể 5 giai đoạn mô phỏng.
- 📄 [Robot_humanic.md](file:///D:/data/para_wiki_llm/00_Raw/Inbox/Robot_humanic.md): Thiết kế tổng quan & Kế hoạch Series A $1.5\text{M USD}$.
