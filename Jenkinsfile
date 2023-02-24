pipeline {
    agent any

    stages {
        stage('CI') {
            steps {
                git 'https://github.com/khalidtarek7/Booster_CI_CD_Project'
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                docker login -u ${USERNAME} -p ${PASSWORD}
                docker build . -f dockerfile -t khalidtarek7/node-app:v1.0
                docker push khalidtarek7/node-app:v1.0
                """
                }
            }
        }
         stage('CD') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                // git 'https://github.com/mahmoud254/jenkins_nodejs_example'
                sh """
                kubectl create namespace backend-ns
                kubectl run backendapp --image=khalidtarek7/node-app:v1.0 -n backend-ns
                """
                }
            }
        }
    }
}
