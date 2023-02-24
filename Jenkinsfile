pipeline {
    agent any

    stages {
        stage('CI') {
            steps {
                git 'https://github.com/mahmoud254/jenkins_nodejs_example'
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
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                kubectl run backendapp --image=khalidtarek7/nagato -n backend-ns
                """
                }
            }
        }
    }
}
