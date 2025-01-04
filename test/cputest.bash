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

ros2 run mypkg cpu_monitor &
NODE_PID=$!

sleep 5

ros2 topic list | grep "/cpu_load" > /dev/null
if [ $? -ne 0 ]; then
    ng "cpu_load トピックが見つかりません"
fi

timeout 10 ros2 topic echo /cpu_load > output.log &
ECHO_PID=$!

sleep 10
kill "$ECHO_PID" 2>/dev/null

if [ -s output.log ]; then
    grep "現在のCPU負荷率" output.log > /dev/null
    if [ $? -ne 0 ]; then
	ng "CPU負荷率の出力が正しくありません"
    fi
else
    ng "トピックの出力がありません"
fi

rm -f output.log


[ "$res" = 0 ] && echo "OK"
exit "$res"


