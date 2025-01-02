#!/bin/bash


dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
timeout 30 ros2 launch mypkg cpu_monitor.launch.py > /tmp/mypkg.log

cat /tmp/mypkg.log |
grep -E 'Publishing CPU load' /tmp/mypkg.log || { echo "Expected output not found"; exit 1; }
