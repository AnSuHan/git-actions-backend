# git-actions-backend
GitHub 브랜치 기반 자동 배포(CI/CD) - 서버

## 로컬에서 프로필별 실행 확인
- dev 프로필 (dev 브랜치용)
  - 예시 출력: The following 1 profile is active: "dev"
```
./gradlew bootRun --args='--spring.profiles.active=dev'
```
- prod-green / prod-blue (main 브랜치 코드로 테스트)
```
./gradlew bootRun --args='--spring.profiles.active=prod-green'
./gradlew bootRun --args='--spring.profiles.active=prod-blue'
```

## docker로 실행
### docker 이미지 빌드
docker build -t git-actions-backend .

### docker로 실행
- dev 프로필 (dev 브랜치용)
```
docker run --name git-actions-backend-dev \
  -p 8080:8080 \
  -e SPRING_PROFILES_ACTIVE=dev \
  -d git-actions-backend
```
- prod-green / prod-blue (main 브랜치 코드로 테스트)
```
docker run --name git-actions-backend-prod-green \
  -p 8080:8080 \
  -e SPRING_PROFILES_ACTIVE=prod-green \
  -d git-actions-backend
  
docker run --name git-actions-backend-prod-blue \
  -p 8080:8080 \
  -e SPRING_PROFILES_ACTIVE=prod-blue \
  -d git-actions-backend
```

### 현재 프로필 확인
https://[서버ip]:[서버포트]/profile 로 접속
- 기본 값: http://localhost:8080/profile
