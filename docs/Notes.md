# Notes

What did I have to do to get the system working?

*   Ensure ROS is properly installed with OpenCV stuff
    * 	ROS1 Melodic is currently on the system
*   Create cv_basics example ROS package 
*   Install vision_opencv repository inside package src directory
    * 	Git Repo : https://github.com/ros-perception/vision_opencv.git
	* Branch : `melodic` 
*   Boost 1.71+ installed manually=
*   OpenCV3 instead of OpenCV4
    * 	Check version: `apt list -a libopencv-dev`
    *   Install 3.2.0: `sudo apt install libopencv-dev=3.2.0+dfsg-4ubuntu0.1`
*   **When building** be sure to source /opt/ros/melodic/setup.bash before running any build/make commands!
*   Configure catkin with python3 with the following commands 
```
catkin config -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so
catkin config --install
catkin_make
```
