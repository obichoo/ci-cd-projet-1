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
                    // Building the Docker image
                    //sh 'sudo docker build -t $IMAGE_NAME:$IMAGE_TAG .'
                }
            }
        }
         stage('Push to Docker Hub') {
             steps {
                 script {
                     // Logging into Docker Hub
                     withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                         sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                     }
                     // Pushing the image to Docker Hub
                     sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
                 }
             }
         }
    }
    post {
        always {
            mail to: 'aolivrie77@gmail.com',
                //  subject: "Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}",
                //  body: "Check Jenkins for details. Build number: ${env.BUILD_NUMBER}"
                subject: "Build jenkins et tout",
                body: "Check Jenkins for details. Build number: plus tard"
        }
    }
}
