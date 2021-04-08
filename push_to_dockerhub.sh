#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

sudo docker logout
cat ~/docker_password.txt | sudo docker login --username manishreddy1 --password-stdin

sudo docker tag cne_flask_frontend:latest manishreddy1/cne_flask_frontend:latest
sudo docker tag backend:latest manishreddy1/backend:latest

sudo docker push manishreddy1/cne_flask_frontend:latest
sudo docker push manishreddy1/backend:latest

EOF
