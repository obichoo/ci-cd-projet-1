pipeline {
    agent any
    environment {
        ID_GIT = 'obichoo'
        IMAGE_NAME = 'ci-cd-projet-1'
        IMAGE_TAG = 'latest'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    sh '''
                    git clone https://github.com/${ID_GIT}/${IMAGE_NAME}.git
                    cd ${IMAGE_NAME}

                    docker build -t $IMAGE_NAME:$IMAGE_TAG --platform linux/amd64 .
                    '''
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'docker run $IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }
        stage('Artifact') {
            steps {
                script {
                    // Logging into Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_LOGS', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                    }
                    // Pushing the image to Docker Hub
                    sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'curl https://api.render.com/deploy/srv-cock3o0l6cac73f0ue10?key=GRtjQihKmi8'
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
