pipeline {
	agent any
	
	// 전역변수 => ${SERVER_IP}
	environment {
			/*SERVER_IP = "aws ip"
			SERVER_USER = "ubuntu"*/
			APP_DIR = "~/app"
			JAR_NAME = "*-0.0.1-SNAPSHOT.war"
	}
		
	stages {
		
		
		 연결 확인 = ngrok
		 stage('Check Git Info') {
			steps {
				sh '''
				    echo "===Git Info==="
				    git branch
				    git log -1
				   '''
			}
		}
		/*
		// 감지 = main : push (commit)
		stage('Check Out') {
			steps {
				 echo 'Git Checkout'
                 checkout scm
			}
		}
		
		// gradle build => war파일을 다시 생성 
		stage('Gradle Permission') {
			steps {
				sh '''
				    chmod +x gradlew
				   '''
			}
		} 
		
		// build 시작 
		stage('Gradle Build') {
			steps {
				sh '''
				    ./gradlew clean build
				   '''
			}
		}
		
		// war파일 전송 = rsync / scp 
		stage('Deploy = rsync') {
			steps {
				sshagent(credentials:['SERVER_SSH_KEY']){
					sh """
					    rsync -avz -e 'ssh -o StrictHostKeyChecking=no' build/libs/*.war ${SERVER_USER}@${SERVER_IP}:${APP_DIR}
					   """
				}
			}
		}
		// 실행 명령 
		
		stage('Run Application') {
			steps {
				sshagent(credentials:['SERVER_SSH_KEY']){
					sh """
					    ssh -o StrictHostKeyChecking=no ${SERVER_USER}@{SERVER_IP} << 'EOF'
					       pkill -f 'java -jar' || true
					       nohup java -jar ${APP_DIR}/${JAR_NAME} > log.txt 2>&1 &
EOF
					   """ 
				}
			}
		}
		
	
	}
	*/
}




/* AWS 배포
pipeline {
    agent any

    environment {
	   DOCKER_IMAGE = "seodongdongsw/total-app"
	   DOCKER_TAG = "latest"
	   EC2_HOST = "13.209.7.16"
	   EC2_USER = "ubuntu"
	   COMPOSE_FILE = "~/app/docker-compose.yml"
	}

    stages {
		// GIT 연결 => 주소
        stage('Checkout') {
            steps {
                echo 'Git Checkout'
                checkout scm
            }
        }
        // 배포판 만들기 
        stage('Gradlew Build') {
			steps {
				echo 'Gradle Build'
				sh '''
				    chmod +x gradlew
				    ./gradlew clean build -x test
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
					   '''
				}
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
		
		stage('Docker Push') {
		    steps {
		        sh '''
		            docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
		        '''
		    }
		}

		stage('Deploy docker-compose') {
			steps {
				sshagent(credentials: ['SERVER_SSH_KEY']) {
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
		
		/*
		stage('Deploy to EC2') {
			steps {
			  // Manage => SSH Agent 설치 = jenkins 다시 실행 
			  sshagent(credentials: ['SERVER_SSH_KEY']) {
				sh """
				   ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} << 'EOF'
				       docker stop total-app || true
				       docker rm total-app || true
				       docker pull ${DOCKER_IMAGE}:${DOCKER_TAG}
				       docker run --name total-app -it -d -p 9090:9090 ${DOCKER_IMAGE}:${DOCKER_TAG}
EOF
				   """
			  }
			}
		}
		 */
		
		/*
		stage('Docker Compose Down') {
			steps {
				echo 'docker-compose down'
				sh '''
				     docker-compose -f ${COMPOSE_FILE} down || true
				   '''
			}
		}
		
		stage('Docker Stop And RM'){
			steps {
				echo 'docker stop rm'
				sh '''
				    docker stop total-app || true
				    docker rm total-app || true
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
		}
		*/
		
		/*
		stage('Docker Run') {
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
		}
		 */
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
*/