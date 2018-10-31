node{
    stage('SCM Checkout'){
	git credentialsId: 'gitcreds', url: 'https://github.com/arunendrachauhan/devops-quest3'
    }
    stage('Mvn package'){
	sh 'cp quest4/pom.xml .'    
        def mvnHome = tool name: 'maven-3', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean package"
        sh 'mv target/myweb*.war target/myweb.war'
    }
    stage('Build Docker Image'){
        sh "docker build -t arunendradocker/demoimg:${ENV} ."
    }
    stage('Push Docker Image'){
	    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubPwd')]) {
	    sh "docker login -u arunendradocker -p ${dockerhubPwd}"
	    }
	    sh "docker push arunendradocker/demoimg:${ENV}"
    }
    stage('run'){
	    sshagent(['credapp-server']) {
	    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubPwd')]) {
	    sh "docker login -u arunendradocker -p ${dockerhubPwd}"
	    //sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.20.164 docker stop ${ENV}"	
	    //sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.20.164 docker rm ${ENV}"
	    sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.20.164 docker pull arunendradocker/demoimg:${ENV}" 
	    //def dockerRun = sh "docker run -p 8085:8080 --name ${ENV} arunendradocker/demoimg:${ENV}"
	    sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.20.164 docker run -p 8085:8080 --name ${ENV} arunendradocker/demoimg:${ENV}"
	    sh 'echo dev container deployed'
	    }
        }	
    }
}
