pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build'
        anchore 'docker.io/ngajean/jenkins-docker:158'
      }
    }

  }
}