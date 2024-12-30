import launch
import launch.actions
import launch.substitutions
import launch_ros.actions


def generate_launch_description():

    cpu_load = launch_ros.actions.Node(
        package='mypkg',
        executable='cpu_load',
        )

    return launch.LaunchDescription([cpu_load])

