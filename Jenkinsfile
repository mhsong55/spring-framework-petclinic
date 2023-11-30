node {
	stage('Checkout') {
		git branch: 'main', credentialId: 'onprem-migration-github-pet', url: 'https://github.com/mhsong55/spring-framework-petclinic.git'
	}
	stage('Maven build') {
		sh './mvnw -B clean package -P MySQL'
	}
	stage('Docker build') {
		def REPO_SVR = 'mhsongtestreg.azurecr.io'
		def IMAGE_REPO = "${REPO_SVR}/petclinic"
		def GIT_TAG = sh(script: 'git describe --abbrev=0', returnStdout: true).trim()
		def DOCKER_TAG = "${IMAGE_REPO}:${GIT_TAG}"
		docker.withRegistry("https://${REPO_SVR}", 'mhsongtestreg_cred') {
			echo "${DOCKER_TAG}"
			def image = docker.build DOCKER_TAG
			image.push()
			sh "docker rmi ${DOCKER_TAG}"
		}
	}
}
