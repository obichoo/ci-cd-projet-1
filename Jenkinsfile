pipeline {
    agent any
    environment {
        ID_GIT = 'obichoo'
        ID_DOCKERHUB = 'obichooooo'
        IMAGE_NAME = 'ci-cd-projet-1'
        IMAGE_TAG = 'latest'
        USER_MAIL = "${MAIL_TO}"
        RENDER_DEPLOY_HOOK_PROJECT_1 = 'https://api.render.com/deploy/srv-cock3o0l6cac73f0ue10?key=GRtjQihKmi8'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    sh '''
                    #!/bin/bash
                    # Nettoyer le répertoire s'il existe déjà
                    if [ -d "${IMAGE_NAME}" ]; then
                        rm -rf ${IMAGE_NAME}
                    fi

                    if [ "$(docker ps -q -f name=${IMAGE_NAME})" ]; then
                        docker stop ${IMAGE_NAME} || true
                        docker rm ${IMAGE_NAME} || true
                    fi
                    '''
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh '''
                        docker run -d -p 80:80 -e PORT=80 --name ${IMAGE_NAME} ${ID_DOCKERHUB}/${IMAGE_NAME}:${IMAGE_TAG}
                        sleep 5
                        curl http://172.17.0.1:80 | grep -q "Home"
                    '''
                }
            }
        }
        stage('Artifact') {
            steps {
                script {
                    // Logging into Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_LOGS', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh 'echo ${DOCKERHUB_PASSWORD} | docker login -u ${DOCKERHUB_USERNAME} --password-stdin'
                    }
                    // Pushing the image to Docker Hub
                    sh 'docker push ${ID_DOCKERHUB}/${IMAGE_NAME}:${IMAGE_TAG}'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh "curl ${RENDER_DEPLOY_HOOK_PROJECT_1}"
                }
            }
        }
    }
    post {
        always {
            mail to: "${USER_MAIL}",
                subject: "Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}",
                body: "Check Jenkins for details. Build number: ${env.BUILD_NUMBER}"
        }
    }
}
