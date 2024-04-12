pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS_ID = 'id-for-dockerhub-credentials'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'docker build -t myapp:${BUILD_ID} .'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'echo "Running tests"'
                }
            }
        }
        stage('Publish Artifact') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS_ID) {
                        sh "docker push myapp:${BUILD_ID}"
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'echo "Deploying application"'
                }
            }
        }
    }
    post {
        always {
            mail to: 'jenkins@joelkoussawo.me',
                 subject: "Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}",
                 body: "Check Jenkins for details. Build number: ${env.BUILD_NUMBER}"
        }
    }
}
