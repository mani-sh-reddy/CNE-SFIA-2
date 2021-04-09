pipeline{
        agent any
        stages{
            
            stage('Remove Old Repo and Clone New'){
                steps{
                    sh "sh jenkins_scripts/remove_old_repo_and_clone_new.sh"
                }
            }

            // replacing backend dockerfile with one with secrets included.
            stage('Swap backend Dockerfile with Secret Vars Dockerfile'){
                steps{
                    sh "sh jenkins_scripts/swap_backend_dockerfile.sh"
                }
            }

            // clear previous docker images/containers
            stage('Clean Docker'){
                steps{
                    sh "sh jenkins_scripts/clean_docker.sh"
                }
            }

            // build
            stage('Build App Docker Images'){
                steps{
                    sh "sh jenkins_scripts/build_app_and_docker_images.sh"
                }
            }

            stage('Running Docker Images'){
                steps{
                    // running backend as remote script due to secret vars
                    sh "sh jenkins_scripts/run_docker_images.sh"
                }
            }

            stage('Run Pytest'){
                steps{
                    sh "sh jenkins_scripts/run_pytest.sh"
                }
            }

            stage('Export Test Coverage'){
                steps{
                    sh "sh jenkins_scripts/export_test_results.sh"
                }
            }


            // push to docker hub
            stage('Push images to Dockerhub'){
                steps{
                    sh "sh jenkins_scripts/push_to_dockerhub.sh"
                }
            }

            // kubernetes cluster app deployment
            stage('Deploy App'){
                kubernetesDeploy(
                    kubeconfigId: 'K8S',
                    enableConfigSubstitution: true
                    sh "sh kubernetes/deploy.sh"
                    ) 
            }

        }
}