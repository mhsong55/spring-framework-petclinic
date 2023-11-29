pipeline {
	agent any
	stages {
		stage('Checkout') {
			checkout scm
		}
		stage('Maven build') {
			sh './mvnw clean package'
		}
	}
}
