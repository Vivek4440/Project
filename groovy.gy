pipeline {
    agent any
 stages {
  stage('Docker Build and Tag') {
           steps {
                sh 'docker build -t jenkins-proj/ubuntu-webserver:latest .'
                sh 'docker tag jenkins-proj/ubuntu-webserver tridevg/ver1'
          }
        }
  stage('Publish image to Docker Hub') {
            steps {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
          sh  'docker push tridevg/ver1'
        }
          }
        }
  stage('Run Docker container on port 80') {
            steps {
                sh "docker run -d -p 80:80 tridevg/ver1"
            }
        }
    stage('Update: Run Docker container on port 9972') {
            steps {
                sh "docker run -d -p 9972:80 tridevg/ver1"
            }
        }
  stage('Update: remove the containers and images') {
            steps {
                sh "docker rm -vf \$(docker ps -aq)"
                sh "docker rmi -f \$(docker images -aq)"
            }
        }
        
    }
}


