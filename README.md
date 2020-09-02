## PetClinic WebApp Deployment
### REAMDME


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

#### License

```Copyright (C) 2020  THC-QA, thenu97, Amran-Lab, Leon-C-T

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```

## Table of Contents

1. [Project Brief](#project-brief)
    + [Proposal](#proposal)
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
    + [Security](#security)
    + [Branch and Merge Log](#branch-and-merge-log)
7. [Improvements for Future Versions](#improvements-for-future-versions)
8. [Installation and Setup Guide](#installation-and-setup-guide)
+ [Authors](#authors)
+ [Acknowledgements](#acknowledgements)


### Project Brief

The following two repositories are to be deployed:

A frontend webapp coded in angular js.
A restful backend API coded in java.
The deployment and development workflows of this service must be automated with reference to the following considerations:

+ Which of the tools encountered over the training period are best suited to the task?
+ Multi-environment support to enable testing.
+ Automated building and deployment based on version-control server changes.
+ Management of running costs.

### Proposal

Our proposal focused on making an automated workflow focusing on the below architecture:

+ Infrastructure as code deployment using Terraform.
+ Infrastructure configuration using Ansible.
+ A Jenkins server functioning in a CI/CD capacity, webhooked to this GitHub repository.
+ A Kubernetes (AWS EKS) cluster running the app.
+ Monitoring of the project using AWS tools such as CloudWatch.

![initial project architecture Diagram](https://imgur.com/u9W2mBt.png)

THe above inital architecture diagram was layed out at the beging of sprint 1.
Showing the basic layout for how the app would be hosted and what services would be running, it also displays how the tools in the CI pipe line interact and where information is padssd between them

## Trello Board

We used a Trello Board to manage our work flow throughout the project. Set up so that every one on the team can see and edit it we impletemnted an Agile work flow inline with the brief for the project. AS we were limited for time for this project we only considered the two weeks as one sprint. We held daly stand up meeting at the star of each day and regular catch up meeting through out to ensure that we were on task and that the we were able to keep up with the work flow. 

In pur Trello board we also had a out MoSCoW prioritisation as is shown below

As our key task was to deliver an automated deployment framework task required were subdeived and assigned. These tasks, generated in the backlog as required, could be moved across the board from 'in progress' to 'Complete' during their development lifecycle. Delivery endpoints were designated 'Completed' or moved to 'Issues Log'. Reassessment of priorities was evaluated daily as a group; some items which were considered inefficient, or were superceded by more mature technologies, were abandoned.

### MoSCoW Analysis

#### Must Have

+ Fully version controlled architecture.
+ Webhooked CI/CD builds.
+ Deployment to multiple environments.
+ IaC automated provisioning.
+ Budgeting.

#### Should Have

+ Load balanced and auto scaling services.
+ All process flows automated.
+ Monitoring of services and infrastructure.
+ Mature use of available cloud technologies.
+ SRE and security conscious work approaches.

#### Could Have

+ Serverless function for backup.
+ Serverless function for backup maintenance.
+ Serveless function for instance recovery.
+ HTTPS certification as a security provision.
+ DNS allocated entrypoints.
+ Full traffic tracing provision.
+ Fully serverless architecture.