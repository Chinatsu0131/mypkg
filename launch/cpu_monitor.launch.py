import launch
import launch.actions
import launch.substitutions
import launch_ros.actions


def generate_launch_description():

    cpu_monitor = launch_ros.actions.Node(
        package='mypkg',
        executable='cpu_monitor',
        )

    return launch.LaunchDescription([cpu_load])

