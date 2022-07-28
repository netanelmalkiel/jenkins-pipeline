pipeline{
    agent any
    environment {
            AWS_DEFAULT_REGION="us-east-1"
            creds=credentials('nati-aws-creds')
    }
    stages {
        stage(checkout) {
            steps {
                git branch: 'main', url: 'https://github.com/netanelmalkiel/jenkins-pipeline'
                }
            }
        stage(init) {
            steps {
                echo 'initilazing...'
                sh 'terraform init'
            }
        }
        stage(apply) {
            steps {
                echo 'applying...'
                sh 'terraform apply -auto-approve'
            }
        }      
    }
}
