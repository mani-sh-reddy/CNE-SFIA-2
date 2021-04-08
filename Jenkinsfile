pipeline{
        agent any
        stages{
            
            stage('Secure copying scripts to Test VM'){
                steps{
                    sh "scp -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa remove_old_repo_and_clone_new.sh ubuntu@18.132.2.39:/home/jenkins/remove_old_repo_and_clone_new.sh"
                }
            }
            
            stage('Remove Old Repo and Clone New'){
                steps{
                    sh "ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << sh remove_old_repo_and_clone_new.sh"
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