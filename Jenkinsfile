pipeline {
    agent any

    parameters {
        choice(name: 'SERVICE', choices: ['SBI', 'HDFC', 'ICICI'], description: 'Choose service to build')
    }

    environment {
        IMAGE_NAME = "mycompany/${params.SERVICE.toLowerCase()}"
        DOCKERFILE_DIR = "${params.SERVICE.toLowerCase()}"
    }

    stages {
        stage('Initialize') {
            steps {
                script {
                    def timestamp = sh(script: "date +%Y%m%d%H%M%S", returnStdout: true).trim()
                    env.TIMESTAMP = timestamp
                }
            }
        }

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${TIMESTAMP} ${DOCKERFILE_DIR}"
                }
            }
        }

        stage('Push Docker Image (optional)') {
            when {
                expression { return false }
            }
            steps {
                echo 'Skipping image push.'
            }
        }
    }
}
