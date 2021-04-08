#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

sudo docker run -d -p 5000:5000 --name frontend frontend

sudo sh ~/docker_run_script.sh

EOF