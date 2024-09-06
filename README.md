# RealSense for Raspberry Pi 5 
Docker image for running RealSense depth cameras with ROS 2 Humble on a Raspberry Pi 5.

![WhatsApp Image 2024-09-05 at 21 47 54](https://github.com/user-attachments/assets/b9e0e8b0-b219-415e-9628-14c15e441e88)

![Screenshot from 2024-09-06 10-33-59](https://github.com/user-attachments/assets/0ea255c7-063e-4c69-a8f4-25becb7eb5c4)

Tested configuration:

- Raspberry Pi 5 running Ubuntu 24.04 server and Docker
- Intel RealSense D455 depth camera

Main ROS 2 topics published after running the docker image:

- `/realsense_1/D455_1/color/image_raw`: RGB image
- `/realsense_1/D455_1/depth/color/points`: Pointcloud
- `/realsense_1/D455_1/depth/image_rect_raw`: Depth image

Modify the start script (`start_script.sh`) parameters for changing resolution, filters, etc.

Ref: [realsense-ros](https://github.com/IntelRealSense/realsense-ros).

# Installation

0. Install Docker: https://docs.docker.com/engine/install/ubuntu/

1. Build Dockerimage in repository

```
docker build -t realsense_ros2 .
```

2. Run Docker image

```
sh run_realsense_ros2.sh
```

# Reference

Build Dockerfile following the *"Installation on Ubuntu"* instructions in [realsense-ros](https://github.com/IntelRealSense/realsense-ros).

1. Install the ROS2 distribution

```
FROM ros:humble
```

2. Install realsense2

```
 RUN apt-get update && apt-get install -y \
     ros-humble-librealsense2* \
     ros-humble-realsense2-* &&\
     rm -rf /var/lib/apt/lists/*
```
3. Start script (`start_script.sh`) launching the `realsense2_camera` node

```
 #!/bin/bash
 
 PROFILE=424x240x5
 PROFILE_HI=640x480x5
 
 ros2 launch realsense2_camera rs_launch.py \
     camera-namespace:=realsense_1 \
     camera_name:=D455_1 \
     rgb_camera.color_profile:=$PROFILE_HI \
     depth_module.depth_profile:=$PROFILE \
     depth_module.infra_profile:=$PROFILE \
     pointcloud.enable:=true \
     pointcluod.stream_filter:=2 \
     spatial_filter.enable:=true \
     temporal_filter.enable:=true \
     hole_filling_filter.enable:=true \
```
