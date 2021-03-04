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
          error 'Source Code not compliant with best practices'
          echo 'Software Quality Gate OK'
      }
    }

    stage ("Build new image on Docker Hub") {
       steps { 
        echo 'Build new image OK'
       }
    }
    stage('Prod Quality Gate') {
            parallel {
                stage('Security Compliance Check') {
                    steps {
                        error 'Security Compliance Check Failed : container run as root user'
                        echo 'Security Compliance Check OK : all tests passed'
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
