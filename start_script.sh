#!/bin/bash

source /opt/ros/humble/setup.bash

# Env variables with defaults
CAMERA_ID=${CAMERA_ID:-"1"}

RGB_PROFILE=${RGB_PROFILE:-"1280x720x5"}
DEPTH_PROFILE=${DEPTH_PROFILE:-"424x240x5"}

DO_POINTCLOUD=${DO_POINTCLOUD:-"true"}
STREAM_FILTER=${stream_filter:-"2"}
DO_SPATIAL_FILTER=${DO_SPATIAL_FILTER:-"true"}
DO_TEMPORAL_FILTER=${DO_TEMPORAL_FILTER:-"true"}
DO_HOLE_FILLING_FILTER=${DO_HOLE_FILLING_FILTER:-"true"}

ros2 launch realsense2_camera rs_launch.py \
    camera_namespace:=realsense_$CAMERA_ID \
    camera_name:=D455_$CAMERA_ID \
    rgb_camera.color_profile:=$RGB_PROFILE \
    depth_module.depth_profile:=$DEPTH_PROFILE \
    depth_module.infra_profile:=$DEPTH_PROFILE \
    pointcloud.enable:=$DO_POINTCLOUD \
    pointcluod.stream_filter:=$STREAM_FILTER \
    spatial_filter.enable:=$DO_SPATIAL_FILTER \
    temporal_filter.enable:=$DO_TEMPORAL_FILTER \
    hole_filling_filter.enable:=$DO_HOLE_FILLING_FILTER \
