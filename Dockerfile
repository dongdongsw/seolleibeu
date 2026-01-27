#jdk 17기반의 이미지 사용
FROM eclipse-temurin:17-jdk-alpine
# 작업 디렉토리 설정
WORKDIR /app1
# 빌드된 jar 파일 복사
COPY build/libs/seolleibeu-0.0.1-SNAPSHOT.war app.war
# PORT 열기
EXPOSE 8080
# 실행
ENTRYPOINT ["java","-jar","app.war"]