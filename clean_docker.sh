#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

docker stop $(docker ps -aq) -y
docker system prune --all -y

docker rm --force docker ps -qa -y || docker rmi --force docker images -qa -y

EOF