pipeline {
  agent {
    node {
      label 'master'
    }
  } 
  stages {
    stage('Build new image on Docker Hub') {
         steps {
          sh 'echo "Waiting for build"'
          callback_url = registerWebhook()
         }
    }
    stage('Test new image') {
      steps {
        echo 'Make some tests'
      }
    }
    stage('Tag new image ready to prod') {
      steps {
        echo 'Tag new image ready to prod'
      }
    }
  } 
}
