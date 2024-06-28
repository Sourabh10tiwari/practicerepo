pipeline {
  agent any
     environment {
       AWS_ACCESS_KEY_ID = credentials('aws-terraform')
       AWS_SECRET_ACCESS_KEY = credentials('aws-terraform')
     }
     stages {
       stage('Checkout Code') {
         steps {
           checkout scm
         }
       }
       stage('Init Terraform') {
         steps {
           sh 'terraform init'
         }
       }
       stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
       }
       stage('Apply Terraform') {
         steps {
           sh 'terraform apply -auto-approve'
         }
       }
     }
}
