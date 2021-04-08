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
                    sh "ssh ubuntu@18.132.2.39 << EOF
                    
                    docker pull manishreddy1/cne_flask_frontend:latest
                    docker push manishreddy1/cne_flask_backend:latest

                    docker run -e DB_USERNAME=$DB_USERNAME -e DB_PASSWORD=$DB_PASSWORD -e DB_ENDPOINT=$DB_ENDPOINT -e DB_NAME=$DB_NAME -e SECRET_KEY=$SECRET_KEY -d -p 5000:5000 --name frontend frontend
                    
                    docker run -e DB_USERNAME=$DB_USERNAME -e DB_PASSWORD=$DB_PASSWORD -e DB_ENDPOINT=$DB_ENDPOINT -e DB_NAME=$DB_NAME -e SECRET_KEY=$SECRET_KEY -d -p 5001:5001 --name backend backend

                    docker exec cne_flask_frontend pytest tests/test_frontend.py --cov application >> frontend_test_coverage.html
                    docker exec cne_flask_backend pytest tests/test_backend.py --cov application >> backend_test_coverage.html

                    EOF"
                }
            }
        }
}