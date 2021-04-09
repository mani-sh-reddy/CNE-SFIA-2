#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

if [ -e network_current.txt ]
then
    cat network_current.txt | xargs sudo docker network rm
    rm network_current.txt
fi

sudo docker network create my-network --subnet 99.12.0.0/16 >> network_current.txt

cd ~/CNE-SFIA-2/frontend

sudo docker run --network my-network -d -p 5000:5000 --name cne_flask_frontend cne_flask_frontend

cd ~/CNE-SFIA-2/backend

sudo sh ~/docker_run_script.sh

EOF