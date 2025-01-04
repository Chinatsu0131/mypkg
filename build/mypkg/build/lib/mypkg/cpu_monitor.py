#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Takumi Kobayashi
# SPDX-License-Identifier: BSD-3-Clausefrom setuptools import setup

import rclpy
from rclpy.node import Node
from std_msgs.msg import String
import psutil


rclpy.init()
node = Node("cpu_monitor")
pub = node.create_publisher(String, "cpu_load", 10)



def cb():
    cpu_load = round(psutil.cpu_percent(interval=None), 2)

    message = f"現在のCPU負荷率 {cpu_load:.2f}%"
    
    if 10 <= cpu_load <= 90:
        threshold = int(cpu_load // 10) * 10
        if cpu_load > threshold:
            message += f"\nCPU負荷率が{threshold}%を超えました。"
            
    msg = String()
    msg.data = message
    pub.publish(msg)
    

def main():
    try:
        node.create_timer(1.0, cb)
        rclpy.spin(node)

    except KeyboardInterrupt:
        pass

    finally:
        node.destroy_node()
        rclpy.shutdown()

