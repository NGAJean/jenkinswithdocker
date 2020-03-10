pipeline {
  agent any
  stages {
    stage('Scan') {
      steps {
        writeFile(file: 'image_to_scan', text: 'docker.io/ngajean/jenkins-docker:latest')
        anchore 'image_to_scan'
      }
    }

  }
}