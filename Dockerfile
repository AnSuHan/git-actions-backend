# Gradle 프로젝트용 Multi-stage
FROM gradle:8.10-jdk21 AS builder
WORKDIR /app
COPY . .
RUN ./gradlew build -x test

# Runtime (plain이 아닌 실행 JAR 복사)
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# plain이 아닌 fat JAR만 복사 (정확한 패턴)
COPY --from=builder /app/build/libs/*-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]