# planner_images
Dockerfiles and entrypoints scripts

[More details](https://docs.google.com/document/d/1dprwyMjqmDyEw7cEfc84zHTsl0dri4PhaRQ7pEyIIu0/edit?usp=sharing)

This repository includes the collaterals needed in order to create a docker image.
There are two relevant images: planner-src and planner-img

- planner-src doesn't include the python code of the agent.
- planner-img is self contained and doesn't need anything from the host.

The brain-image is there for historical reasons.

In order to run the image:
 - planner-img:
    docker run --net=host -v $HOME/data/$ROS_DOMAIN_ID:/tmp/$ROS_DOMAIN_ID  --env ROS_DOMAIN_ID="$ROS_DOMAIN_ID" -it planner-img:latest
    This command mounts the host file system on the docker filesystem and allows to retrieve the data
    
 - planner-src:
    docker run --net=host -v $HOME/git/ros2ws:/home/iaiai/git/ros2ws  -v $HOME/data/$ROS_DOMAIN_ID:/tmp/$ROS_DOMAIN_ID  --env ROS_DOMAIN_ID="$ROS_DOMAIN_ID" -it planner-src:latest
    This command mounts two areas of the file system on the host: 
        - /tmp/$ROS_DOMAIN_ID for the data
        - /home/iaiai/git/ros2ws for the code
       
Note that each type of image includes two collaterals:
1. The Dockerfile used to create it
2. A script for-docker-entrypoint.bash that is located on the root of the docker file system and that is run automatically
