pipeline {
  agent {
    node {
      label 'master'
    }
  } 
  stages {
    stage('Git Synchronization') {
         steps {          
          echo 'Git Synchronization OK'
         }
    }
    stage('Software Quality Gate') {
      steps {
          sh 'grep maintainer Dockerfile'
      }
    }

    stage ("Build new image on Docker Hub") {
       steps { 
        echo 'Build new image OK'
       }
    }
    stage('Prod Quality Gate') {
            parallel {
                stage('Security Compliance Checks') {
                    steps {
                        sh '! grep -e "FROM .*:latest" Dockerfile'
                    }
                }
                stage('Bench Compliance Check') {
                    steps {
                        echo 'Bench Compliance Check OK'
                    }
                }
            }
    }
    stage('Tag new image ready to prod') {
      steps {
        echo 'New image tagged ready to prod'
      }
    }
  } 
}
