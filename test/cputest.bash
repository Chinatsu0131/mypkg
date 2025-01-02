#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Takumi Kobayashi
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
timeout 30 ros2 launch mypkg cpu_monitor.launch.py > /tmp/mypkg.log

cat /tmp/mypkg.log | cut -d ']' -f 2 | grep -i 'cpu load' || { echo "Expected output not found"; exit 1; }
