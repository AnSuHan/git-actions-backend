# Gradle 프로젝트용 Multi-stage
FROM gradle:8.10-jdk21 AS builder
WORKDIR /app
COPY . .
# gradlew에 실행 권한 부여
RUN chmod +x gradlew
RUN ./gradlew build -x test

# Runtime (plain이 아닌 실행 JAR 복사)
# 프로덕션에서 alpine(경량 이미지)을 사용하는 것이 일반적
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# plain이 아닌 fat JAR만 복사 (정확한 패턴)
COPY --from=builder /app/build/libs/*-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]