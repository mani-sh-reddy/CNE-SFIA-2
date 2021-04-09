#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@3.10.171.127 << EOF

cd ~

sudo rm -rf CNE-SFIA-2

git clone https://github.com/mani-sh-reddy/CNE-SFIA-2

cd CNE-SFIA-2 && git checkout jenkins/DEVOPS-11

EOF