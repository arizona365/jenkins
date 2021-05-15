pipeline {
    agent any
    
    tools{
        maven 'maven-v3.8.1' // get it from global tool
    }
    
    stages {
        stage('Build jar') {
            steps {
                script{
                    echo 'building application'
                    sh 'cd sprint/ && mvn package'
                }
            }
        }
        stage('Build image') {
            steps {
                script{
                    echo 'building docker image'
                    withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASS', usernameVariable: 'USER')]){
                        sh 'docker build -t arizona365/sprint:v1 .' // creating image localy
                        sh "echo $PASS | docker login -u $USER --password-stdin" // login to my docker hub
                        sh 'docker push arizona365/sprint:v1' //pushing the local image to docker hub
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script{
                    echo 'deploying application ...'
                }
            }
        }

    }
}

