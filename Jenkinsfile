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

            stage('Run Pytest'){
                steps{
                    sh "sh run_pytest_export_coverage.sh"
                }
            }


            // push to docker hub
            stage('Push images to Dockerhub'){
                steps{
                    sh "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                }
            }

        }
}