pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('Access-Key-Id')
        AWS_SECRET_ACCESS_KEY = credentials('Secret-Access-Key')
    }

    stages {
        stage('build') {
            steps {
                echo 'build the application...'
            }
        }
        stage('test') {
            steps {
                echo 'test the application...'
            }
        }
        stage('deploy') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'your-aws-credentials-id', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        sh 'terraform init'
                        sh 'terraform plan'
                        sh 'terraform apply --auto-approve'
                    }
                }
            }
        }
    }
}
