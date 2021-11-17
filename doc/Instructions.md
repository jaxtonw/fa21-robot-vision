# Setup Instructions

How to get the system running.

## Ensure ROS is properly installed with OpenCV stuff
The system we worked with had ROS1 Melodic on the system. While troubleshooting, I found [this YouTube tutorial](https://www.youtube.com/watch?v=2l913YwWYe4) incredibly helpful in ensuring OpenCV was properly installed and the ROS Image Publisher node was working correctly.

## Create `cv_basics` example ROS package 
Follow tutorial in https://automaticaddison.com/working-with-ros-and-opencv-in-ros-noetic/

### TUTORIAL MODIFICATIONS
Had to slightly modify the suggested "automatic addison" tutorial in one main way. Instead of using cv_bridge's img_to_cv2 function in `image_sub.py`, I had to add `ros_numpy` and use `ros_numpy.numpify(data)` to translate the image to be viewed by numpy. This was suggested by this comment on Github https://github.com/ros-perception/vision_opencv/issues/207#issuecomment-931526796

I also had to add `ros_numpy` as argument to `catkin_create_pkg`. This can be manually added as a dependency later, but it's easiest done at this step.

This *shouldn't* be needed, but for some reason, it doesn't appear that `cv_bridge` works properly on Melodic. There has to be a better way that should only need `cv_bridge` instead of `ros_numpy` too.


## Troubleshooting

### Boost 1.71+ installed manually
Had to manuall remove apt installed boost

*   Note: I actually changed to boost 1.77 in my implementation, but it should work with 1.71 fine

### OpenCV3 instead of OpenCV4
If you start having OpenCV issues...

* 	Check version: `apt list -a libopencv-dev`
*   Install 3.2.0 with apt: `sudo apt install libopencv-dev=3.2.0+dfsg-4ubuntu0.1`

Alternatively, can build OpenCV from source. To do so, I removed all opencv stuff pre-installed, and did a cmake and make build of OpenCV. Had to use a special invokation of CMake to connect it to Python3.
```
$ sudo cmake -D CMAKE_BUILD_TYPE=RELEASE     -D INSTALL_PYTHON_EXAMPLES=ON     -D INSTALL_C_EXAMPLES=OFF     -D BUILD_NEW_PYTHON_SUPPORT=ON     -D BUILD_opencv_python3=ON     -D HAVE_opencv_python3=ON     -D PYTHON_DEFAULT_EXECUTABLE=$(which python3)     -D PYTHON_EXECUTABLE=$(which python3)     -D BUILD_opencv_python2=OFF     -D CMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)")     -D PYTHON3_EXECUTABLE=$(which python3)     -D PYTHON3_INCLUDE_DIRS=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")\
    -D PYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") ..
```

### Building Project
**When building** be sure to source /opt/ros/melodic/setup.bash before running any build/make commands!


### Dependencies
Use `rosdep` to install all dependencies *before* trying to invoke catkin_make
* 	`rosdep update`
    * 	From workspace root: `rosdep install --from-paths src --ignore-src -r -y`
    * 	Troubleshoot:
	    *   If needs to be initialized: `sudo rosdep init`
	    *   Link: http://wiki.ros.org/rosdep

### Possible `apt` helpful dependencies/tools
*   `sudo apt install ros-melodic-desktop-full ros-melodic-rostopic ros-melodic-cv-bridge` to get rostopic and rqt_image_view (to view the publisher node) and `cv-bridge`. 
