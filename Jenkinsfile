pipeline{
        agent any
        stages{
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
                    sh "ssh ubuntu@18.132.2.39 << cd ~ && sudo sh docker_run_script.sh"
                }
            }
        }
}