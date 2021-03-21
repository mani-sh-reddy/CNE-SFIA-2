# Cloud Native Practical Project 
_April 2021_

**Table of Contents:**

- [CNE-SFIA-2](#cne-sfia-2)
  - [Project Brief](#project-brief-and-requirements)

**External Resources**

-[]()
-[]()
-[]()

## Project Brief 
Deployment of a simple Flask application, built in Python, that makes use of a microservice architecture comprising of 2 separate services and utilises a CI Pipeline.

- **Jira** board created with full expansion on tasks, providing a record of any issues or risks that were faced.
- Deploy application using containerisation (**Docker**) and orchestration (**Kubernetes**) tools.
- Test application through the CI pipeline with **Jenkins**.
- Make use of two managed Database Servers: 1 for Testing and 1 for Production with **AWS RDS**.
- Use **Github** webhooks so that Jenkins recreates and redeploys the application when a change to the code base has been made.
- Configure infrastructure using an infrastructure management tool (**Terraform**).
- Create an **Ansible** Playbook that will provision the environment that the CI Server needs to run.
- Use a reverse proxy (NGINX) to make the application accessible to the user.
- Deployment of the application on an **AWS EC2** instance.
- Fully integrate into a VCS **Git**.
