pipeline {
    agent any
    environment {
        IMAGE_NAME = 'ryanprt/proj1'
        IMAGE_TAG = 'latest'
    }
    stages {
        stage('Build') {
            steps {
                script {
                     def user = env.BUILD_USER
                    def userId = env.BUILD_USER_ID
                    echo "Build initiated by: ${user} (ID: ${userId})"
                    // Building the Docker image
                    sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
                }
            }
        }
    }
    post {
        always {
            mail to: 'aolivrie77@gmail.com',
                //  subject: "Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}",
                //  body: "Check Jenkins for details. Build number: ${env.BUILD_NUMBER}"
                subject: 'Build jenkins et tout',
                body: 'Check Jenkins for details. Build number: plus tard'
        }
    }
}
