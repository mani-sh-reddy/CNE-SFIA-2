#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@3.10.171.127 << EOF

rm -f /home/ubuntu/CNE-SFIA-2/backend/Dockerfile
cp ~/Dockerfile /home/ubuntu/CNE-SFIA-2/backend/Dockerfile

EOF