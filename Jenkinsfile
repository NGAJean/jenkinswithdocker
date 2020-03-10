pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build'
        anchore 'Scan Image'
      }
    }

  }
}