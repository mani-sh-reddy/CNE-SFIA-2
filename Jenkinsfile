pipeline{
        agent any
        stages{
            
            stage('Remove Old Repo and Clone New'){
                steps{
                    sh "sh remove_old_repo_and_clone_new.sh"
                }
            }

            // build
            stage('Build App Docker Images'){
                steps{
                    sh "sh build_app_and_docker_images.sh"
                }
            }

            stage('Running Docker Images'){
                steps{
                    sh "sh run_docker_images.sh"
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

        }
}