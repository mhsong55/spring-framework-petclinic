pipeline {
	environment {
		image_repo = "mhsongtestreg.azurecr.io/petclinic"
	}
	agent any
	stages {
		stage('AgentTest') {
			steps {
				echo 'Hello Jenkins!'
			}
		}
		stage('Checkout') {
			steps {
				checkout scm
			}
		}
		stage('Maven build') {
			steps {
				sh './mvnw clean package -P MySQL'
			}
		}
		stage('Docker build') {
			steps {
				sh '''
					echo 'docker image build'
					GIT_TAG=$(git describe --abbrev=0)
					echo 'latest tag = $GIT_TAG'
					docker build -t $image_repo:$GIT_TAG .
					docker images
					'''
			}
		}
	}
}
