. /opt/ros/eloquent/setup.bash
cd /home/iaiai/git/ros2ws/
colcon build
. install/setup.bash
cd /home/iaiai/git/ros2ws/src/planner
cp -r logic_simulator  /home/iaiai/git/ros2ws/install/planner/lib/python3.6/site-packages/
cp -r planner/envs  /home/iaiai/git/ros2ws/install/planner/lib/python3.6/site-packages/planner

cd planner/envs/plannerEnvs_dir
echo "STARTING with ROS_DOMAIN_ID=$ROS_DOMAIN_ID"
./v0_planner_env.py
