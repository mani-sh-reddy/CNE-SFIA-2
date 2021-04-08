pipeline{
        agent any
        stages{
            
            stage('Remove Old Repo and Clone New'){
                steps{
                    sh "sh remove_old_repo_and_clone_new.sh"
                }
            }

            // replacing backend dockerfile with one with secrets included.
            stage('Swap backend Dockerfile with Secret Vars Dockerfile'){
                steps{
                    sh "sh swap_backend_dockerfile.sh"
                }
            }

            // clear previous docker images/containers
            stage('Clean Docker'){
                steps{
                    sh "sh clean_docker.sh"
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
                    // running backend as remote script due to secret vars
                    sh "sh run_docker_images.sh"
                }
            }

            stage('Run Pytest'){
                steps{
                    sh "sh run_pytest_export_coverage.sh"
                }
            }


            // push to docker hub
            stage('Push images to Dockerhub'){
                steps{
                    sh "sh push_to_dockerhub.sh"
                }
            }

        }
}
// webhook tester