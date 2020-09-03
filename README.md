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
The brief the team recieved was to deploy a web application (angular js frontend & restful backend) using infratructure as code, containerisation, multi-environment support and continuous integration based on server changes via the VCS. The teams goal was to come up with a solution selecting the best tools for the each job and justify why they had chosen them.

## Proposal
The team proposed a CI pipeline utilising the following architecture tools for the automated workflow.

* __Terraform__ used for the infrastructure as code deployment.
* __Terraform__ also used for the infrastructure configuration.
* __Jenkins__ used for Continuous Integration, utilising webhooks to the VCS.
* __GitHub__ VCS used for feature branch model and version control.
* __Kubernetes__ cluster containerising and running the app.
* __CloudWatch__ project monitoring ie cost, upscaling. 

Below shows the inital understanding of the architecture needed for the MVP. Terraform creates and configures the infrastructure(EKS cluster & Jenkins server), Jenkins deploys the app after a code push to the VCS using Kubernetes to the live app. 

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

## MoSCoW Analysis

## Start Point

## End Point


### Risk Assessment

## Budgeting

### Project Architecture

## Architecture Design

## Issues Encountered


### Design Considerations

## Amazon Services

## Individual Showcases


### Testing

## Local Testing


### Deployment

## Toolset

## CI Server Implementation 

## Branch and Merge Log


### Improvments for Future Versions

### Installation and Setup Guide