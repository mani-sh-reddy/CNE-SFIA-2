#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

cat ~/docker_password.txt | sudo docker login --username manishreddy1 --password-stdin

cd ~/CNE-SFIA-2/frontend
sudo docker push manishreddy1/cne_front_end:latest

cd ~/CNE-SFIA-2/backend
sudo docker push manishreddy1/backend:latest

EOF