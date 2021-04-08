#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

sudo docker stop cne_flask_backend cne_flask_frontend
sudo docker rmi -f cne_flask_backend:latest cne_flask_frontend:latest 

EOF