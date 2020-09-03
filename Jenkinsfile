// Requirements for jenkins to automaticall build the application requirements
pipeline {

    agent any

    stages{
        // Do initial setup
        stage('Set Manager Node'){

            steps {

                sh 'kaws eks update-kubeconfig --name FP-EKS-CLUSTER'

            }

        }
        // Deploy backend pods
        stage('Deploy Backend'){

            steps {

                sh 'kubectl create -f backend_pods.yml'

            }

        }
        // Deploy frontend pods
        stage("Deploy Frontend") {

            steps {

                sh 'kubectl create -f frontend_pods.yml'

            }

        }
        // Deploy NGINX
        stage('Deploy NGINX') {

            steps {

                sh 'kubectl crete -f nginx_pods.yml'
                }

        }
    }

}