FROM ros:humble

# Install realsense2
RUN apt-get update && apt-get install -y \
    ros-humble-librealsense2* \
    ros-humble-realsense2-* &&\
    rm -rf /var/lib/apt/lists/*

COPY start_script.sh .
RUN chmod +x /start_script.sh

ENTRYPOINT ["/start_script.sh"]