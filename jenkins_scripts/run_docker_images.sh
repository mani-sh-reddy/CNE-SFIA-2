#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@3.10.171.127 << EOF

sudo docker network create my-network

cd ~/CNE-SFIA-2/frontend

sudo docker run --network my-network -d -p 5000:5000 --name cne_flask_frontend cne_flask_frontend

cd ~/CNE-SFIA-2/backend

sudo sh ~/docker_run_script.sh

EOF