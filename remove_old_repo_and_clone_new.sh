#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF
cd ~
sudo rm -rf CNE-SFIA-2
git clone https://github.com/mani-sh-reddy/CNE-SFIA-2
cd CNE-SFIA-2 && git checkout jenkins/DEVOPS-11
EOF