pipeline {
    agent any

    parameters {
        choice(name: 'SERVICE', choices: ['SBI', 'HDFC', 'ICICI'], description: 'Choose service to build')
    }

    environment {
        IMAGE_NAME = "mycompany/${params.SERVICE.toLowerCase()}"
        TIMESTAMP = sh(script: "date +%Y%m%d%H%M%S", returnStdout: true).trim()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${TIMESTAMP} -f ${params.SERVICE}/Dockerfile ."
                }
            }
        }

        stage('Push Docker Image (optional)') {
            when {
                expression { return false } // Change to true if you want to push
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh """
                        echo "$PASS" | docker login -u "$USER" --password-stdin
                        docker push ${IMAGE_NAME}:${TIMESTAMP}
                    """
                }
            }
        }
    }
}
