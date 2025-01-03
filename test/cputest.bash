#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Takumi Kobayashi
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build

source install/setup.bash
source $dir/.bashrc

ng() {
    echo "${1}行目が違う"
    res=1
}

res=0

timeout 30 ros2 launch mypkg cpu_monitor.launch.py

[ "$res" = 0 ] && echo OK
exit "$res"


