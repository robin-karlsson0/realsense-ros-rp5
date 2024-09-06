#!/bin/bash

docker run -it --rm --network=host --privileged \
    -v /dev/bus/usb:/dev/bus/usb \
    -v /tmp:/tmp \
    realsense_ros2