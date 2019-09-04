#!/bin/bash

# Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# Update package index
sudo apt update

# ROS Desktop install (not full)
sudo apt install ros-melodic-desktop

# Find available packages: apt search ros-melodic

# Initialize rosdep
sudo rosdep init
rosdep update

# Setup environment
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Dependencies for building packages
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential



