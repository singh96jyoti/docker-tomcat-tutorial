pipeline {
  environment {
    registry = "jyoti96singh/tomcat_automated"            
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
   agent any
   stages {
      stage('Git Checkout') {
        
         steps {
                  git 'https://github.com/singh96jyoti/docker-tomcat-tutorial.git'         
                }
            }

      stage('Building docker image') {
        
         steps{
          script {
           dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
      stage('Deploy Image') {
        
         steps{
          script {
           docker.withRegistry( '', registryCredential ) {
           dockerImage.push()
      }
     }
    }
   }

      }
	  }
