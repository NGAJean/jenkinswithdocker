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
      agent {
          docker {
              image 'hadolint/hadolint:latest-debian'
              //image 'ghcr.io/hadolint/hadolint:latest-debian'
          }
      }
      steps {
          sh 'hadolint dockerfiles/* | tee -a hadolint_lint.txt'
      }
      post {
          always {
              archiveArtifacts 'hadolint_lint.txt'
          }
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
                        echo 'Security Compliance Check OK'
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
