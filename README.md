# Sample ROS Image Publisher/Subscriber

The following code was implementable on the Jetson Nano DOFBOT Arm Robot. This system uses Ubuntu 18.04, and had ROS Melodic installed. 

## Instructions
To view some of the instructions of *how* this ROS package was built on the Jetson Nano DOFBOT Arm Robot (and some citations and resources), see [`doc/Instructions.md`](doc/Instructions.md). 

## Building ROS Package
Execute `build.sh` to build the ROS package. It should be prebuild for you though, and you should really only need to run `source devel/setup.bash`, and maybe `rosdep install --from-paths src --ignore-src -r -y` to install dependencies.

## Run Nodes
After correctly setting everything up by following `Instructions.md` and running `source devel/setup.bash`, you can launch the provided `.launch` file. 

```
roslaunch cv_basics cv_basics_py.launch
``` 

You should then see an image window opened, as well as messages on the terminal noting the publisher/subscriber nodes sending/receiving data.

Alternatively, you can just run `./launch.sh` to source the setup and launch the launch file. Please note, you will need your ROS environment previously setup before running this script.
