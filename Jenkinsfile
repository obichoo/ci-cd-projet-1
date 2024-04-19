pipeline {
    agent any
    environment {
        ID_GIT = 'obichoo'
        ID_DOCKERHUB = 'obichooooo'
        IMAGE_NAME = 'ci-cd-projet-1'
        IMAGE_TAG = 'latest'
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

                    docker rm -f ${IMAGE_NAME} || true

                    git clone https://github.com/${ID_GIT}/${IMAGE_NAME}.git
                    cd ${IMAGE_NAME}

                    docker build -t ${ID_DOCKERHUB}/${IMAGE_NAME}:${IMAGE_TAG} .
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
                        curl http://dsfqdsfqdsf | grep -q "html"
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
            mail to: "${MAIL_TO}",
                subject: "Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}",
                body: "Check Jenkins for details. Build number: ${env.BUILD_NUMBER}"
        }
    }
}
