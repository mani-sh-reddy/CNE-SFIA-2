#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

    sudo docker stop $(sudo docker ps -aq)
    sudo docker system prune --all --force

EOF