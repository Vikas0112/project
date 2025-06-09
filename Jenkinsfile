pipeline {
    agent any

    parameters {
        choice(name: 'SERVICE', choices: ['SBI', 'HDFC', 'ICICI'], description: 'Choose service to build')
    }

    environment {
    IMAGE_NAME = "mycompany/${params.SERVICE.toLowerCase()}"
    TIMESTAMP = sh(script: "date +%Y%m%d%H%M%S", returnStdout: true).trim()
    DOCKERFILE_DIR = "${params.SERVICE}"  // Keep it uppercase if that's what you have
}

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
                    sh "docker build -t ${IMAGE_NAME}:${TIMESTAMP} -f ${DOCKERFILE_DIR}/Dockerfile ."
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
