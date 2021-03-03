pipeline {
  agent {
    node {
      label 'master'
    }
  } 
  stages {
    stage('Build new image on Docker Hub') {
      steps {
        echo 'Webhook from github'
      }
    }
  }  
  stages {
    stage('Test new image') {
      steps {
        echo 'Make some tests'
      }
    }
  }
  stages {
    stage('Tag new image ready to prod') {
      steps {
        echo 'Tag new image ready to prod'
      }
    }
  } 
}
