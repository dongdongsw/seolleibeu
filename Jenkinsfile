pipeline {
	agent any
	
	environment {
		APP = "total-app"
		IMAGE = "total-app"
		PORT = "9090"
	}
	
	stages {
		stage('Git Checkout') {
	            steps {
	                echo "=== Git Checkout ==="
	                checkout scm
	            }
	    }
	
	    stage('Gradle Permission') {
	            steps {
	                sh 'chmod +x gradlew'
	            }
	    }
	
	    stage('Gradle Build') {
	            steps {
	                sh './gradlew build -x test --build-cache'
	            }
	    }
	    
	
	    stage('Docker Build') {
	            steps {
	                sh "docker build -t ${IMAGE}:latest ."
	            }
	    }
	    stage('Deploy') {
            steps {
                sh '''
                echo "▶ 이전 컨테이너 종료"
                docker rm -f total-app || true

                echo "▶ 새 컨테이너 실행 (latest)"
                docker run -d \
                  --name total-app \
                  -p 9090:9090 \
                  total-app:latest
                '''

                sh '''
                echo "▶ Health Check 시작"

                for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
                do
                  STATUS=$(curl -s http://localhost:9090/actuator/health || true)
                  echo "응답: $STATUS"

                  if echo "$STATUS" | grep -q UP; then
                    echo "HEALTH CHECK OK"

                    echo "previous 이미지 갱신"
                    docker tag total-app:latest total-app:previous

                    exit 0
                  fi

                  sleep 2
                done

                echo "❌ HEALTH CHECK FAIL"
                exit 1
                '''
            }
        }
    }

    post {
        failure {
            echo "♻️ 자동 롤백 시작"

            sh '''
            echo "▶ 실패 컨테이너 제거"
            docker rm -f total-app || true

            if docker image inspect total-app:previous > /dev/null 2>&1; then
              echo "▶ 이전 이미지로 롤백"
              docker run -d \
                --name total-app \
                -p 9090:9090 \
                total-app:previous
            else
              echo " 롤백할 이미지 없음 (최초 배포)"
            fi
            '''
        }

        always {
            cleanWs()
        }
    }
}



