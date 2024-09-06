#!/bin/bash

source /opt/ros/humble/setup.bash

PROFILE=424x240x5
PROFILE_HI=640x480x5

ros2 launch realsense2_camera rs_launch.py \
    camera_namespace:=realsense_1 \
    camera_name:=D455_1 \
    rgb_camera.color_profile:=$PROFILE_HI \
    depth_module.depth_profile:=$PROFILE \
    depth_module.infra_profile:=$PROFILE \
    pointcloud.enable:=true \
    pointcluod.stream_filter:=2 \
    spatial_filter.enable:=true \
    temporal_filter.enable:=true \
    hole_filling_filter.enable:=true \
