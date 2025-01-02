#!/bin/bash


dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
timeout 10 ros2 launch mypkg cpu_monitor.launch.py > /tmp/mypkg.log

cat /tmp/mypkg.log |
grep 'Publishing CPU load' || { echo "Expected output not found"; exit 1; }
