#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@3.10.171.127 << EOF

cd ~/CNE-SFIA-2/frontend
sudo docker build -t cne_flask_frontend .

cd ~/CNE-SFIA-2/backend
sudo docker build -t backend .
EOF