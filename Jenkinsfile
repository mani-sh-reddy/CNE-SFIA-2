pipeline{
        agent any
        stages{
            // build
            stage('Build App Docker Images'){
                steps{
                    sh "cd frontend && docker build -t cne_flask_frontend ."
                    sh "cd backend && docker build -t cne_flask_backend ."
                }
            }

            // push to docker hub
            stage('Push images to Dockerhub'){
                steps{
                    sh "docker tag cne_flask_frontend:latest manishreddy1/cne_flask_frontend:latest"
                    sh "docker tag cne_flask_backend:latest manishreddy1/cne_flask_backend:latest"

                    sh "docker push manishreddy1/cne_flask_frontend:latest"
                    sh "docker push manishreddy1/cne_flask_backend:latest"
                }
            }

            // sshing into the test vm
            stage('Run Pytest Script in Test VM') {
                 steps{
                    sh "ssh ubuntu@18.132.2.39 << cd ~ && sh docker_run_script.sh"
                }
            }
        }
}