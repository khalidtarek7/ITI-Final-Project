pipeline {
    agent any

    stages {
        stage('CI') {
            steps {
                git 'https://github.com/khalidtarek7/Nodejs-App'
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                docker login -u ${USERNAME} -p ${PASSWORD}
                docker build . -f dockerfile -t khalidtarek7/nagato --network host
                docker push khalidtarek7/nagato
                """
                }
            }
        }
         stage('CD') {
            steps {
                git 'https://github.com/khalidtarek7/Nodejs-App'
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                kubectl apply -f /var/jenkins_home/workspace/khalid/app.yaml
                kubectl apply -f /var/jenkins_home/workspace/khalid/app-loadbalancer.yaml
                """
                }
            }
        }
    }
}
