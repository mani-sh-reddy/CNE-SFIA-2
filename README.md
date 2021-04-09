# Cloud Native Practical Project 
_April 2021_

- [Cloud Native Practical Project](#cloud-native-practical-project)
  - [Project Brief](#project-brief)
  - [Project Planning](#project-planning)
  - [Architecture](#architecture)
    - [AWS - Amazon Web Services](#aws---amazon-web-services)
  - [Dev-Ops Tools](#dev-ops-tools)
    - [Terraform](#terraform)
    - [Ansible](#ansible)
    - [Jenkins CI](#jenkins-ci)
    - [Docker](#docker)
    - [Kubernetes](#kubernetes)
    - [NGINX](#nginx)
  - [Testing](#testing)
  - [Contributors](#contributors)
  - [Acknowledgements](#acknowledgements)

**External Resources**

-[Jira](https://mani-reddy.atlassian.net/jira/software/projects/DEVOPS/boards/6/)
-[Risk Assessment](https://docs.google.com/spreadsheets/d/1qFdHa1j7WOg5ZGF0we9EB4iZhYK1lBd5e9SVNm-6knY/edit?usp=sharing)
-[]()

## Project Brief 
Deployment of a simple Flask application, built in Python, that makes use of a microservice architecture comprising of 2 separate services and utilises a CI Pipeline.

- **Jira** board created with full expansion on tasks, providing a record of any issues or risks that were faced.
- Deploy the application using containerisation (**Docker**) and orchestration (**Kubernetes**) tools.
- Test application through the CI pipeline with **Jenkins**.
- Make use of two managed Database Servers: 1 for Testing and 1 for Production with **AWS RDS**.
- Use **Github** webhooks so that Jenkins recreates and redeploys the application when a change to the code base has been made.
- Configure infrastructure using an infrastructure management tool (**Terraform**).
- Create an **Ansible** Playbook that will provision the environment that the CI Server needs to run.
- Use a reverse proxy (NGINX) to make the application accessible to the user.
- Deployment on **AWS EC2** instances.
- Fully integrate into a VCS **Git**.

## Project Planning
Project planning was done in Jira. The Jira board can be found above in the external resources section.
Tasks were categorised into epics and put into respective sprints. The Kanban board was used to track progress. Below is an example Sprint Kanban board as the project was nearing completion:

![jira-board](https://user-images.githubusercontent.com/47571755/114134719-15d0fe80-9900-11eb-9ad3-4f0685f3535a.png)

Below is the risk assessment that was conducted for the project:

![risk-assessment](https://user-images.githubusercontent.com/47571755/114135767-a52ae180-9901-11eb-951e-8b185cad0e15.png)

## Architecture

Below is the architecture diagram for the project:

![cne_NEW_architecture_diagram](https://user-images.githubusercontent.com/47571755/114135953-e4f1c900-9901-11eb-97b7-57e72f2a253a.png)
- The developer pushes to GitHub.
- This then triggers the Jenkins CI through an SCM webhook.
- The CI server runs through the stages necessary for the build.
- Removes Old Repo and Clones New.
- Swap backend Dockerfile with Secret Vars Dockerfile.
- Clean Docker - Remove all previous images/containers.
- Build App Docker Images.
- Run Docker Images.
- Run Pytest.
- Export Test Coverage
- Push images to Dockerhub.
- If tests are successful, pull from Dockerhub and deploy the app.
- The management VM contains the tools Terraform used to provision the VMs and RDSs, and Ansible using to install the software onto the previsioned VMs. This was the initial stage of the project and the section below goes into more depth on this.

### AWS - Amazon Web Services
This project utilised AWS cloud resources. A network diagram was created to get a clear idea of how the resources should be provisioned. This was then coded in terraform (mentioned below).

![aws-network](https://user-images.githubusercontent.com/47571755/114153923-c39bd780-9917-11eb-9f42-87d8ac46b9c8.png)

## Dev-Ops Tools

### Terraform
Terraform is an infrastructure management tool that allows the provision of AWS (and many other) cloud resources through code - as opposed to running commands on the command line.

In this project, Terraform was extensively used to provision the 2 EC2s, 2 RDSs and the networking that's required.

Terraform uses modules, they are templates for multiple resources that are used together.

![terraform-modules](https://user-images.githubusercontent.com/47571755/114142318-b7f5e400-990a-11eb-98fd-74bfcbdcf42e.png)

Below is a snippet of the Terraform plan output:
![terraform-output](https://user-images.githubusercontent.com/47571755/114142037-4fa70280-990a-11eb-8648-c776e49ec9a9.png)

### Ansible

Ansible is another infrastructure as code tool that enables software installations as code. Instead of the command line, Ansible allows installations via the playbook.

![ansible-playbook](https://user-images.githubusercontent.com/47571755/114142716-30f53b80-990b-11eb-96ec-65239c3a4b1a.png)

The playbook specifies the roles which contain the tasks that Ansible would perform in the host.

For this project, 3 roles were used, common - to run tasks on both hosts, ci_vm - to run tasks that are specific to the Jenkins server, and the test_vm role - for tasks that would need to run only on the Test VM.

Here is a list of the tasks that are inside the roles. The tasks shown below are running a set of scripts for installations.

![ansible-roles](https://user-images.githubusercontent.com/47571755/114143394-02c42b80-990c-11eb-9d2a-c8acf2a34622.png)


These are the scripts that are run on the VMs to install the software.

![ansible-scripts](https://user-images.githubusercontent.com/47571755/114143494-24bdae00-990c-11eb-8278-010ea107c4d0.png)

### Jenkins CI

CI means Continuous Integration and CD means Continuous Delivery and Continuous Deployment. This is the principle of automation that, for this project, has been achieved with the tool Jenkins.

Along with the code, a Jenkinsfile needs to be pushed to the repository.

When Jenkins receives a webhook trigger from a push to Github, the build starts.

The Jenkinsfile is run and the works through the stages.

In this project, there were 9 total stages of the CI/CD pipeline.

- Removes Old Repo and Clones New.
- Swap backend Dockerfile with Secret Vars Dockerfile.
- Clean Docker - Remove all previous images/containers.
- Build App Docker Images.
- Run Docker Images.
- Run Pytest.
- Export Test Coverage
- Push images to Dockerhub.
- If tests are successful, pull from Dockerhub and deploy the app.

![jenkins-file](https://user-images.githubusercontent.com/47571755/114147637-cd6e0c80-9910-11eb-8395-0f624ae3dd4e.png)

Different stages access different scripts that are run on the respective VMs. In the case below, Jenkins is providing the script for the Test VM to run, in order to build the image.

![jenkins-scripts](https://user-images.githubusercontent.com/47571755/114146878-02c62a80-9910-11eb-9a19-c8c936a88409.png)

For the Jenkins pipeline, the app is not deployed in the Kubernetes cluster so that phase of the build has not passed. This shows that CI was successful, but it has not deployed yet.

From the second stage, Docker was used to containerise the application ready for testing. This is explained further in the section below.

### Docker
For this project, Docker was used to containerise the flask application. The app consisted of both the front-end and back-end and both parts needed to be put in a docker container to mitigate "dependency hell". It allows devs to send code to other teams inside of a container with all the required dependencies, which in theory means the software that runs on your computer will be the software that runs on another person’s computer.

The provided application needed to be containerised. This was done through a Dockerfile. The Dockerfile for the front end is shown below. The app is installed in a python environment along with all the requirements for the apps to run.

![jenkins-scripts](https://user-images.githubusercontent.com/47571755/114149901-51c18f00-9913-11eb-960e-a0e064f2b8d7.png)

### Kubernetes
Kubernetes is a container orchestration tool that deploys Docker images automatically, running the containers in a cluster. Kubernetes also allows for features like auto-scaling and rolling updates.

Below is the Kubernetes file structure used for this project.

![k8s-directory](https://user-images.githubusercontent.com/47571755/114150653-35722200-9914-11eb-8ef0-de307002e8e9.png)

As with the tools above, Kubernetes resources are created in a declarative way.

For an app to be deployed in Kubernetes, there has to be a deployment YAML file that determines the number of replicas, the image that's being pulled from Dockerhub, as well as ports and namespaces.

![k8s-backend-yaml](https://user-images.githubusercontent.com/47571755/114152015-a6fea000-9915-11eb-8bda-61d79689ef4c.png)

There also needs to be a file that has information about the service. The service is an abstraction that describes a group of pods of an app.

The containers will run with 3 replicas (pods), and those replicas are replaceable (when one goes down another starts up), therefore you would require a service that will have a non-changing DNS name for connections which are then routed to the pods automatically.

![k8s-backend-service-yaml](https://user-images.githubusercontent.com/47571755/114152626-65bac000-9916-11eb-8154-7afd26e906b0.png)

### NGINX

NGINX was also used in this project to act as the load-balancer and reverse-proxy for end-user access/interaction with the app. This was also run as a pod with multiple replicas.

## Testing

The tests were run as part of the CI pipeline. It was essential that the tests were run before the image was pushed to Dockerhub, as you wouldn't want to push the wrong image. Below is an output of the pytest that was run, for both front and backend. Both are run with 100% coverage and passed tests, so they are ready for pushing to Dockerhub.

Frontend
![front-end-tests](https://user-images.githubusercontent.com/47571755/114154969-df53ad80-9918-11eb-8b15-8f5d325f9f04.png)

Backend
![back-end-tests](https://user-images.githubusercontent.com/47571755/114154974-dfec4400-9918-11eb-9471-fa9a6491aba8.png)

## Contributors

**Manish Reddy**

## Acknowledgements

I would like to acknowledge:

-   The trainers at QA for supporting me through this project.
-   My team for their moral support.
