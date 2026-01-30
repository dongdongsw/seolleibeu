pipeline {
	agent any 
	
	environment {
		DOCKER_IMAGE = "mindory0144/total-app"
		DOCKER_TAG = "latest"
		EC2_HOST = "3.39.232.170"
		EC2_USER = "ubuntu"
		COMPOSE_FILE = "~/app/docker-compose.yml"
	}
	
	stages {
		// GIT 연결 => 주소
		stage('Checkout') {
			steps{
				echo 'Git Checkout'
				checkout scm
			}
		}
		
		stage('Gradlew Build') {
			steps {
				echo 'Gradlew Build'
				sh '''
					chmod +x gradlew
					./gradlew clean build -x test
				   '''
			}
		}
		
		stage('Docker Build') {
			steps {
				echo 'Docker Image Build'
				sh '''
					docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .
				   '''
			}
		}
		
		stage('Docker Hub Login') {
			steps {
				echo 'DockerHub Login'
				withCredentials([usernamePassword(
					credentialsId: 'dockerhub_config',
					usernameVariable: 'DOCKER_ID',
					passwordVariable: 'DOCKER_PW'
				)]){
					sh '''
					    echo "DOCKER_ID=$DOCKER_ID,DOCKER_PW=$DOCKER_PW"
					    echo "$DOCKER_PW" | docker login -u "$DOCKER_ID" --password-stdin
					    docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
					   '''
				}
			}
		}
		
		stage('Deploy docker-compose') {
			steps {
				sshagent(credentials:['SERVER_SSH_KEY']) {
					sh """
					ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} '
					cd /home/ubuntu/app
					docker-compose down
					docker-compose pull
					docker-compose up -d
					'
					"""
				}
			}
		}
		/*stage('Deploy to EC2') {
			steps {
			  sshagent(credentials:['SERVER_SSH_KEY']) {

				sh """
					  ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} \
					  "sudo docker stop total-app || true && \
					   sudo docker rm total-app || true && \
					   sudo docker pull ${DOCKER_IMAGE}:${DOCKER_TAG} && \
					   sudo docker run --name total-app -d -p 9090:9090 ${DOCKER_IMAGE}:${DOCKER_TAG}"
				   """
				}
			}
		}*/
		
		
		/*stage('Docker Compose Down') {
			steps {
				echo 'docker-compose down'
				sh '''
					docker-compose -f ${COMPOSE_FILE} down || true
			       '''
			}
		}
		
		
		stage('Docker Stop And rm') {
			steps {
				echo 'docker stop rm'
				sh '''
					docker stop ${DOCKER_IMAGE} || true
					docker rm ${DOCKER_IMAGE} || true
					docker pull ${DOCKER_IMAGE}
				   '''
			}
		}
		
		stage('Docker Compose UP') {
			steps {
				echo 'docker-compose up'
				sh '''
					docker-compose -f ${COMPOSE_FILE} up -d
				   '''
			}
		}*/
		
		/*stage('Docker Run') {
			steps {
				echo 'Docker Run'
				sh '''
					docker stop ${CONTAINER_NAME} || true
					docker rm ${CONTAINER_NAME} || true
					
					docker pull ${IMAGE_NAME}
					 
					docker run --name ${CONTAINER_NAME} \
					-it -d -p 9090:9090 \
					${IMAGE_NAME}
				   '''
			}
		}*/
	}
	
	post {
		success {
			echo 'CI/CD 실행 성공'
		}
		failure {
			echo 'CI/CD 실행 실패'
		}
	}
}