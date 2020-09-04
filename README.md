# Final Project

## Spring Pet Clinic 

#### Authors: Mark Rafferty, Michael McGarrigle, David McCartney, Gary Forrow, Robert Siberry, Peter Smith

## Table of Contents

1. [Project Brief](#project-brief)
    + [Proposal](#proposal)
    + [Scope](#scope)
    + [Requirements](#requirements)
2. [Trello Board](#trello-board)
    + [MoSCoW Analysis](#moscow-analysis)
    + [Start Point](#start-point)
    + [Rolling Changes](#rolling-changes)
    + [End Point](#end-point)
3. [Risk Assessment](#risk-assessment)
    + [Budgeting](#budgeting)
4. [Project Architecture](#project-architecture)
    + [Architecture Diagram](#overall-architecture)
    + [Issues Encountered](#issues-encountered)
5. [Design Considerations](#design-considerations)
    + [Amazon Services](#amazon-services)
    + [Project Extensions](#project-extensions)
6. [Deployment](#deployment)
    + [Toolset](#toolset)
    + [CI Server Implementation](#ci-server-implementation-and-configuration)
    + [Branch and Merge Log](#branch-and-merge-log)
7. [Improvements for Future Versions](#improvements-for-future-versions)
8. [Installation and Setup Guide](#installation-and-setup-guide)
+ [Authors](#authors)
+ [Acknowledgements](#acknowledgements)

### Project Brief
The brief the team received was to deploy a web application (angular js frontend & restful backend) using infrastructure as code, containerization, multi-environment support and continuous integration based on server changes via the VCS. The teams goal was to come up with a solution selecting the best tools for the each job and justify why they had chosen them.

## Proposal
The team proposed a CI pipeline utilising the following architecture tools for the automated workflow.

* __Terraform__ used for the infrastructure as code deployment.
* __Terraform__ also used for the infrastructure configuration.
* __Jenkins__ used for Continuous Integration, utilising webhooks to the VCS.
* __GitHub__ VCS used for feature branch model and version control.
* __Kubernetes__ cluster containerizing and running the app.
* __CloudWatch__ project monitoring ie cost, upscaling. 

Below shows the initial understanding of the architecture needed for the MVP. Terraform creates and configures the infrastructure(EKS cluster & Jenkins server), Jenkins deploys the app after a code push to the VCS using Kubernetes to the live app. 

<a href="https://ibb.co/6gb4ncZ"><img src="https://i.ibb.co/qk9RyLn/initial-project-diagram.png" alt="initial-project-diagram" border="0" />Initial Architecture</a>

## Scope
We will be working with these externally developed applications:

https://github.com/spring-petclinic/spring-petclinic-angular

https://github.com/spring-petclinic/spring-petclinic-rest

They are well documented applications for the ‘Spring Pet Clinic’ domain, one of which serves as a front end client using AngularJS and the other as an API using Java.

## Requirements
We will plan, design and implement a solution for automating the development workflows and deployments of this application. As part of our final deliverable we will need to discuss the project in a presentation and demonstrate these workflows.

Using what we have learned consider the following:

What tools will work for you best? For example: Terraform, Kubernetes, Ansible etc. There is no restrictions or requirements on which ones to use; you should decide which you feel are most appropriate and justify their use.

Multiple Environment support: How can a developer test their new features on an environment before merging their changes to the main branch?

How can changes on the GitHub repository automatically build and deploy to testing and live environments?

Running costs. What are your monthly estimates? How could they be improved?

### Trello Board
Every member of our team had experience using Trello kanban board so we decided it best to stick with what we know and use it for the workflow, management and tracking of our project. All members could add boards to satisfy needs such as requirements, product backlog, task assignment, sprint detailing and for logging of issues. After the daily stand ups and sprint retro's we would update the boards accordingly. 

We utilized the MoSCoW technique for gather requirements and prioritizing tasks and as the project grew the changes where reflected on the appropriate boards.

<a href="https://ibb.co/Z1S9rV6"><img src="https://i.ibb.co/HpCZyVD/trelloo.png" alt="trelloo" border="0"></a>


## MoSCoW Analysis
__Must Have__
* Version controlled architecture (GitHub).
* Use webhooked CI/CD builds (Jenkins).
* Deploy to multiple environments.
* Infrastructure as code automated provisioning (Terraform).
* Budgeting (Cloudwatch and SNS).

__Should Have__
* Load balanced and auto scaling services (NGINX & AWS).
* All process flows automated (Jenkins).
* Monitoring of services and infrastructure (Cloudwatch).
* Mature use of available cloud technologies.

__Could Have__
* Serverless function for backup.
* Serverless function for backup maintenance.
* Serveless function for instance recovery.

## Start Point
The starting point for the project was a team meeting where initial roles where discussed based on each team members strengths and how they seen teh project. We assigned hig level tasks such as kanban board creation, aws account set up and role allocation, GitHub repo initialization with team being added and the initial understanding of the architecture design.

## End Point
By the end of the project our key deliverables had been completed.

Throughout the project the Trello Board had been continuously updated with task being moved from the 'Task Backlog' to 'In Progress' and the 'Completed'. To keep track of what issues encountered were added to the 'Issues Log' and any task that need to be modified or dropped were moved into 'Changed/Abandoned Tasks'

### Risk Assessment
Our initial risk assessment was carried out before starting work on the project this allowed us to try an predict and counter act problems before they hindered us. Below is our initial table of risk showing how likely there were to happen and what the impact on the project would be if they did happen.

![Screen shot of inital risk assessment](https://imgur.com/RUXltWd.png)

Colour coding the likelihood and impact columns allows us to quickly see what the biggest and most hard hitting risks to the are meaning we could focus our attention on avoiding them.

## Budgeting
The maximum spend for the project was £20. To make sure we didn't overspend we set up a budget alarm in AWS to notify us if the project went over 50% that way we could evaluate what was costing the most and adjust accordingly. The final spend for the project was under £10.

### Project Architecture
Terraform

We implemented our infrastructure using Terraform as this allowed us to create our Infrastructure as Code (IaC).

Using best practices each part of the required infrastructure was implemented as modules, this allowed us to build up the required infrastructure a piece at a time ensuring that they all worked properly together.

This also allowed us to easily resolve any issues that arose as they were only related to the individual module that had just been added.

Modules created were 

VPC - This created the VPC to hold all of the infrastructure, the required subnets over 2 availability zones for resilience, the Internet gateway to allow external traffic through to our VPC and the required routing table for this.

SG - This created and applied the necessary Security group access to allow the Manager and Worker nodes to talk to each other

EC2 - This created the required Manager Node, initially we had a setup script that was executed on the Manager to ensure that required software was available to control and manage the Worker Nodes.  Due to there being several manual steps required to complete the Jenkins installation it was decided to create an image of the Manager VM with all of the required software installed and configuration completed.

EKS - This created the required Kubernetes control plain to allow pods to be deployed within our infrastructure

CW - This created a Monitoring Dashboard for the PetClinic application and generated a graph showing the CPU utilisation on the Manager Node 

## Overall Architecture
# Interaction and Services
The diagram below details the user interaction with the web app, it also shows the communication with containers.

<a href="https://ibb.co/jybg2p3"><img src="https://i.ibb.co/CbmhZrV/user-Activity.png" alt="user-Activity" border="0" />User Activity</a>




## Issues Encountered


## Deployment

## Toolset
<a href="https://ibb.co/MV552RS"><img src="https://i.ibb.co/2tYYnjh/Dev-Ops-Toolchain-and-Process-Flow.png" alt="Dev-Ops-Toolchain-and-Process-Flow" border="0"></a><br /><a target='_blank' href='https://geojsonlint.com/'></a><br />

## CI Server Implementation 

## Branch and Merge Log


### Improvements for Future Versions

### Installation and Setup Guide

Spin up AWS VM using Ubuntu 18.04
Clone down repository to VM
Install terraform to your VM
In Terraform folder in cloned project run commands 'terraform init' followed by 'terraform plan'
Initialise deployment by running 'terraform apply'
Navigate to your AWS console to confirm the new machines have been spun up. Look for VM called 'Manager' to confirm.
Copy the IP address of manager and navigate to IPADDRESS:8080 to access Jenkins. (Credentials for default account to be provided)
Jenkins comes with some predefined example jobs for deploying to Dev and Production environments.
Run the predefined Jenkins pipeline. 
The application will be built by the Jenkins pipeline, and deployed across the EKS cluster defined by Terraform.
Navigate to your Load Balancer section within the EC2 page on AWS and find load balancer that has been spun up my terraform plan. (Loadbalancer Healthchecks must be complete before the application will be accessible)

