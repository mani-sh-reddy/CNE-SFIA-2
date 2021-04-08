#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

sudo service docker stop
sudo rm /var/lib/docker/network/files/local-kv.db
sudo service docker start

sudo docker stop backend cne_flask_frontend
sudo docker rm backend cne_flask_frontend
sudo docker rmi -f backend:latest cne_flask_frontend:latest 

EOF