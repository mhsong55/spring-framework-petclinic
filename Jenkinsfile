pipeline {
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
				sh './mvnw clean package'
			}
		}
	}
}
