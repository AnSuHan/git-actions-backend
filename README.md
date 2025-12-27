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

### 현재 프로필 확인
https://[서버ip]:[서버포트]/profile 로 접속
- 기본 값: http://localhost:8080/profile
