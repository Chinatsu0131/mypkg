import launch
import launch.actions
import launch.substitutions
import launch_ros.actions


def generate_launch_description():

    cpu_monitor_node = launch_ros.actions.Node(
        package='mypkg',
        executable='cpu_monitor',
        name='cpu_monitor_node',
        output='screen'
        )

    return launch.LaunchDescription([cpu_monitor_node])

