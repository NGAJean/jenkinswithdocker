pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build'
        anchore 'docker.io/ngajean/jenkins-docker:158'
        writeFile(file: 'image_to_scan', text: 'docker.io/ngajean/jenkins-docker:240')
      }
    }

  }
}