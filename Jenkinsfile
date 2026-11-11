pipeline {
    agent any

    environment {
        // This is just a custom name for YOUR deployment package
        IMAGE_NAME = "my-nginx-app"
        IMAGE_TAG  = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Docker looks inside your Dockerfile here, sees "FROM nginx", and pulls it
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Run Container') {
            steps {
                sh "docker rm -f ${IMAGE_NAME}-container || true"
                
                // Runs your new image (which contains Nginx) on web port 80
                sh "docker run -d --name ${IMAGE_NAME}-container -p 8085:80 ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }
    }
}

