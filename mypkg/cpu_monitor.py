#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Takumi Kobayashi
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import Float32
import psutil


rclpy.init()
node = Node("cpu_monitor")
pub = node.create_publisher(Float32, "cpu_load", 10)



def cb():
    cpu_load = psutil.cpu_percent(interval=None)
    msg = Float32()
    msg.data = cpu_load
    pub.publish(msg)
    
    node.get_logger().info(f"Publishing CPU load: {cpu_load:.2f}%")



def main():
    node.create_timer(0.5, cb)
    rclpy.spin(node)

    node.destroy_node()
    rclpy.shutdown()

