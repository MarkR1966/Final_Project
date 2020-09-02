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
+ Security-conscious approach to work adhering to the principal of least privilege.

#### Could Have

+ Serverless function for backup.
+ Serverless function for backup maintenance.
+ Serveless function for instance recovery.
+ HTTPS certification as a security provision.
+ DNS allocated entrypoints.
+ Full traffic tracing provision.
+ Fully serverless architecture.

### Start Point

![Screen shot of trello board first set up.](https://imgur.com/f9KebZB.png)

At the start of the project, we focussed on our understanding of an initial plan: Starting the [Trello board](https://trello.com/b/iK9zZxbI/devops-final-project-group), starting this documentation to streamline future workflow; instituting a github repository for the project, which can be found [here](https://github.com/THC-QA/qa_group_project); and initialising the risk assessment for the project in line with initial understandings.

### End Point

![Screen shot of Treelo Board after deliverables met, TO BE ADDED](.png)

By the end of the project our key deliverables had been completed. 

Throughout the project the Trello Board had been continusly updated with task beeing moved from the 'Task Backlog' to 'In Progress' and the 'Completed'. To keep track of what issues incountered were added to the 'Issues Log'  and any task that need to be modified or dropped were moved into 'Changed/Abandoned Tasks'

#### What Went Well

+ IaC enabled broad deployment with a region agnostic approach.
+ Pipeline functioned well in both an automated capacity and for multi-environment deployment.
+ Multifarious usage of Amazon curated services.
+ Multi-implementation of serverless solutions

#### What Could Be Improved

+ Little usage was found for configuration management in a project of this scale.
+ CloudTrail user tracking was not implemented for the project.
+ After deliberation, X-RAY was dropped from the project due to difficulties with the daemon.
+ The testing functionality explained in the submodule README could not be implemented, after outside assistance, no solution could be found.

## Risk Assessment


|Risk No.|Risk|Description|Hazard|Likelihood|Impact|Solution|
|---|---|---|---|---|---|---|
|1.0.1|Overrun on time.|Due to poor time management, the project is not completed.|Worst case scenario, marks are lost due to lack of coverage of brief.|2|5|Make good use of Kanban to manage workflow, and efficient time use of office resources.|
|1.0.2|Overrun on budget.|Available budget is consumed.|Worst case scenario, we incur out of pocket expenses and are not reinbursed.|3|5|Implement budget warnings on AWS, daily monitoring of expenditure.|
|1.0.3|Catch coronavirus.|Due to illness, significant amounts of workhours are lost.|Worst case scenario, the remaining team are overburdened.|4|3|Avoid human contact, follow NHS best practice.|
|1.0.4|Leak of login or key details.|Credentials are version controlled or misplaced.|Worst case scenario, all data is accessible to malicious actors.|3|4|Protect personal data, make use of ignore files and DevSecOps best practices.|
|1.1.1|Corruption or conflict of respository branches.|Due to team cooperation on a single repository, mismanagement of branches could occur.|Worst case scenario, data lost.|5|4|Make full use of advanced git recovery techniques.|
|1.1.2.1|Infrastructure: TFState|Infrastructure management is impeded by terraform errors.|Worst case scenario, impedement to workflow.|2|2|Familiarisation with terraform cli.|
|1.1.2.2|Infrastucture: Networking|Connections between modules are non-functional but not errors.| Worst case scenario, project modules fail to initialise or communicate.|3|4|Check-off new infrastructure status using AWS web GUI.|
|1.1.2.3|Infrastructure: Permissions|Mismanagement of keys or roles enables malpractice.|Worst case scenario, vulnerabilites are introduced into security practices.|2|5|Roles and Users are only allowed relevant permissions, and key handling and spread is minimised.|
|1.2.1|Kubernetes: networking|Application incorrectly networked.|Worst case scenario, application fails to run.|3|5|Carefully research relevant documentation|
|1.2.2|Kubernetes: scaling|Application fails to scale.|Worst case scenario, application cannot be expanded on demand.|2|4|Correctly implement AWS monitoring and response.|
|1.3.1|Jenkins pipeline integration|Jenkins compatability with GitHub webhooks.|Worst case scenario builds are not triggered, resulting in inconsistent builds.|3|1|Maintain webhooks and pull/push requests, ensure branches merged correctly.|
|1.3.2|Jenkins server exposed.|Port 8080 open to webtraffic is poor working practice.|Worst case scenario, introduce systemic vulnerabilities into build server.|5|2|Set firewall rules to only allow specific access.|
|1.4.1|Lambda: triggers|Lambda functions cannot be correctly triggered.|Incomplete backup and recovery system for the project.|3|3|Investigate correct usage of CloudWatch and SNS.|
|1.4.2|Lambda: dependencies|Lambda functions fail to chain correctly.|Backup and recovery system has incomplete or chaotic functionality.|2|3|Creation and maintenance of multiple co-dependent lambda functions.|