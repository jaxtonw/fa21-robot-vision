# There was some previous errors with linking with python3 that this seemed to have helped solve
# Then something else happened and it didn't seem to need this fix anymore...
# So yeah, I'm just going to leave this here temporarily in case the issue pops up again
# catkin config -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so
# catkin config --install
source /opt/ros/melodic/setup.bash
rosdep install --from-paths src --ignore-src -r -y
catkin_make
