pipeline {
   environment {
     callback_object = registerWebhook()
     callback_url = callback_object.getURL()
     docker_url= "https://hub.docker.com/api/build/v1/source/c73d69d4-5266-4e69-a401-645a72d81071/trigger/ba4173ba-a22c-4adb-a966-d676987c53dd/call/" 
   }
  agent {
    node {
      label 'master'
    }
  } 
  stages {
    stage('Git Synchronization') {
         steps {          
          echo 'Git Synchronization'
         }
    }
    stage('Software Quality Gate') {
         steps {          
          echo 'Make some tests'
         }
    }     
    stage ("Build new image on Docker Hub") {
       steps { 
        echo 'Build new image'
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
        echo 'Tag new image ready to prod'
      }
    }
  } 
}
