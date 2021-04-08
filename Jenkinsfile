pipeline{
        agent any
        stages{
            
            stage('Remove Old Repo and Clone New'){
                steps{
                    sh "ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF
                    cd ~
                    sudo rm -rf CNE-SFIA-2
                    git clone https://github.com/mani-sh-reddy/CNE-SFIA-2
                    cd CNE-SFIA-2 && git checkout jenkins/DEVOPS-11
                    EOF"
                }
            }

            // build
            stage('Build App Docker Images'){
                steps{
                    sh "cd frontend && sudo docker build -t cne_flask_frontend ."
                    sh "cd backend && sudo docker build -t cne_flask_backend ."
                }
            }

            // push to docker hub
            stage('Push images to Dockerhub'){
                steps{
                    sh "sudo docker tag cne_flask_frontend:latest manishreddy1/cne_flask_frontend:latest"
                    sh "sudo docker tag cne_flask_backend:latest manishreddy1/cne_flask_backend:latest"

                    sh "sudo docker push manishreddy1/cne_flask_frontend:latest"
                    sh "sudo docker push manishreddy1/cne_flask_backend:latest"
                }
            }

            // sshing into the test vm
            stage('Run Pytest Script in Test VM') {
                 steps{
                    sh "ssh -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << cd ~ && sudo sh docker_run_script.sh"
                }
            }
        }
}