#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

rm -f /home/ubuntu/CNE-SFIA-2/backend/Dockerfile
cp ~/Dockerfile /home/ubuntu/CNE-SFIA-2/backend/Dockerfile

EOF