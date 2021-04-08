#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

docker stop $(docker ps -aq) # stop all containers
docker system prune --all

docker rm --force docker ps -qa || docker rmi --force docker images -qa

EOF