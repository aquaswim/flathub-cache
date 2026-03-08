pipeline {
    agent any

    triggers {
        // H = stable hash for the minute
        // 12 = Hour
        // * = Any day of month
        // * = Any month
        // 3 = Wednesday (0 or 7 is Sunday)
        cron('H 12 * * 3')
    }

    environment {
        REGISTRY_URL = "repo.home.aquaswim.my.id"
        IMAGE_NAME = "${REGISTRY_URL}/personal/flathub-cache"
        // BUILD_NUMBER = build num in jenkins
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} -t ${IMAGE_NAME}:latest .'
            }
        }

        stage('Push') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'gitea-aquaswim-username-password', usernameVariable: 'GITEA_USER', passwordVariable: 'GITEA_PASSWORD')]) {
                        sh 'echo ${GITEA_PASSWORD} | docker login https://${REGISTRY_URL} -u ${GITEA_USER} --password-stdin'

                        sh 'docker push ${IMAGE_NAME}:${BUILD_NUMBER}'
                        sh 'docker push ${IMAGE_NAME}:latest'

                        sh 'docker logout https://${REGISTRY_URL}'
                    }
                }
            }
        }
    }
}
