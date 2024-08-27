# Jenkins CI/CD Pipeline with SonarQube, Docker, and GitHub Webhooks on AWS

## Introduction

This project demonstrates how to set up a Continuous Integration/Continuous Deployment (CI/CD) pipeline using Jenkins, SonarQube, Docker, and GitHub Webhooks on AWS. The infrastructure is provisioned using Terraform, and the pipeline automates the process of building, testing, analyzing, and deploying a software application.

## Project Components

- **Jenkins**: An open-source automation server used for automating parts of the software development process, including building, testing, and deploying applications.
- **GitHub**: A code hosting platform that provides version control and collaboration tools using Git.
- **SonarQube**: A code quality management tool that analyzes code to detect bugs, vulnerabilities, and code smells.
- **Docker**: A platform that enables developers to automate the deployment of applications inside lightweight, portable containers.
- **Terraform**: An open-source infrastructure as code (IaC) software tool that provides a consistent CLI workflow to manage cloud services.

## Architecture

![image](https://github.com/user-attachments/assets/2db7fc5e-b2e2-4f37-83b9-7849e29f12f5)

## Setup Instructions

### Provision AWS Infrastructure with Terraform
```
terraform init
terraform plan
terraform apply
 ```
![public_instances_with_terraform](https://github.com/user-attachments/assets/eaaa2b84-70a1-4348-a612-6d5b06574c83)
#### EC2 Dashboard
![deployed_instances](https://github.com/user-attachments/assets/fa272442-9de4-4551-9a7f-ec21e7d3f469)
#### SSH Connection into Docker, Jenkins and SonarQube Instances
![ssh_docker_jenkins_and_sonarqube](https://github.com/user-attachments/assets/9667e75a-fb64-414e-b047-948f9034e552)

### Setup Jenkins

#### Start Jenkins
Run Jenkins and access it via the browser.
![jenkins](https://github.com/user-attachments/assets/fffff306-179f-4887-b110-296fd358fe9c)

#### Install Necessary Plugins
Install plugins for GitHub, Docker, and SonarQube integration.

### Set Up GitHub Webhooks
 
- Go to the repository settings.
- Add a webhook pointing to your Jenkins server's `/github-webhook/` URL.
- Create a Jenkins job that polls GitHub for changes and triggers the pipeline.

![jenkins_webhook](https://github.com/user-attachments/assets/d236d2c4-7282-4d01-a6e3-7afef0ba2e94)


### Configure SonarQube

Integrate SonarQube with Jenkins by configuring the Jenkins job to perform a SonarQube analysis after the code is built.

![image](https://github.com/user-attachments/assets/cf771089-9634-4e24-9551-629fb617616e)

### Docker Image Creation and Deployment

- Write a Dockerfile: Create a Dockerfile for your application.
- Build and Push Docker Image: Use Jenkins to build the Docker image and push it to a Docker registry.
- Deploy the Docker Container: Run the Docker container on the third EC2 instance.

#### Build and Deployment Successful
![image](https://github.com/user-attachments/assets/441ea664-bc5d-427b-ac75-c5d67449e477)

#### Carvilla Application
![carvilla_website](https://github.com/user-attachments/assets/5448b4dc-ad79-4631-b62f-5e2e45a29212)

## Usage

- **Continuous Integration**: Whenever a commit is pushed to the GitHub repository, the Jenkins job will be triggered, automatically building the code, analyzing it with SonarQube, and creating a Docker image.
- **Continuous Deployment**: Once the Docker image is created, it will be deployed automatically to the EC2 instance running Docker.

## Troubleshooting

- **Jenkins not triggering builds**: Check GitHub webhook configuration and ensure Jenkins is accessible from GitHub.
- **SonarQube analysis failing**: Verify SonarQube is running and accessible, and check the Jenkins job configuration for any misconfigurations.
- **Docker deployment issues**: Ensure the Docker daemon is running on the EC2 instance and that the image is correctly pushed to the Docker registry.

## Conclusion

This project provides a robust CI/CD pipeline setup on AWS, integrating Jenkins, SonarQube, Docker, and GitHub Webhooks. It automates the process of building, testing, analyzing, and deploying applications, ensuring a smooth and efficient software development lifecycle.
