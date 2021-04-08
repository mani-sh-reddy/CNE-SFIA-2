#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

cat ~/docker_password.txt | sudo docker login --username manishreddy1 --password-stdin

sudo docker push manishreddy1/cne_front_end:latest
sudo docker push manishreddy1/backend:latest

EOF