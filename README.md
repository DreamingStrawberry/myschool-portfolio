# 🏫 Spring School Management System

학교 관리 시스템(School Management System)은 학생, 교사 및 수업을 효율적으로 관리하기 위한 Spring Boot 기반 웹 애플리케이션입니다.

![학교 관리 시스템 메인 화면](https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/1.png)

## 📋 프로젝트 개요

이 시스템은 교육 기관에서 필요한 다양한 관리 기능을 제공합니다:
- 학생 및 교사 정보의 체계적인 관리
- 수업 및 시간표 관리
- 성적 관리 및 통계 분석
- 커뮤니티 게시판 및 메시지 시스템

## 🛠️ 기술 스택

- **백엔드**:
  - Java 17
  - Spring Boot 3.4.4
  - MyBatis ORM
  - MariaDB

- **프론트엔드**:
  - Thymeleaf
  - HTML/CSS/JavaScript
  - Bootstrap (UI 프레임워크)

- **개발 도구**:
  - Spring Tool Suite 4 (STS4)
  - Maven
  - Git

## 🔑 주요 기능

### 1. 사용자 관리
- 관리자, 교사별 권한 관리
- 로그인/로그아웃 기능
- 사용자 프로필 관리

### 2. 학생 관리
- 학생 등록, 조회, 수정, 삭제
- 반별 학생 목록 관리
- 학생 개인 정보 및 연락처 관리

![학생 관리 - 1반 목록](https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/2.png)

### 3. 교사 관리
- 교사 등록, 조회, 수정, 삭제
- 담당 과목 및 담임 반 관리
- 교사 권한 설정

![교직원 관리 화면](https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/3.png)
![교직원 추가 화면](https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/5.png)

### 4. 성적 관리
- 과목별 성적 입력 및 수정
- 학생별 성적표 생성
- 통계 분석 및 성적 추이 확인

![성적 관리 - 1반 성적표](https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/1.png)

### 5. 커뮤니티 기능
- 공지사항, 게시판, 자료실 운영
- 파일 업로드/다운로드
- 게시글 조회 및 관리

![커뮤니티 - 공지사항](https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/4.png)

### 6. 메시지 시스템
- 교사간 메모 전송 및 수신
- 파일 첨부 기능
- 보낸 메모/받은 메모 관리

![메모 보내기 화면](https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/6.png)
![보낸 메모 내용 확인](https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/7.png)
![받은 메모 내용 확인](https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/8.png)

## 📂 데이터베이스 구조

### 주요 테이블

| 테이블명 | 설명 |
|---------|------|
| `student` | 학생 정보 (ID, 반, 번호, 이름, 연락처 등) |
| `teacher` | 교사 정보 (ID, 권한 레벨, 담임반, 계정정보 등) |
| `sungjuk` | 성적 정보 (ID, 국어, 영어, 수학, 과학, 음악 점수 등) |
| `community` | 게시판 글 정보 (ID, 제목, 내용, 작성일 등) |
| `memo` | 메시지 시스템 (ID, 제목, 내용, 발신자, 수신자 등) |

### ERD(Entity Relationship Diagram)

```
+-------------+     +-------------+     +-------------+
|   student   |     |   teacher   |     |   sungjuk   |
+-------------+     +-------------+     +-------------+
| id (PK)     |     | id (PK)     |     | id (PK)     |
| ban         |     | level       |     | kor         |
| bunho       |     | ban         |     | eng         |
| name        |     | userid      |     | mat         |
| phone       |     | pwd         |     | sci         |
| birth       |     | name        |     | mus         |
| delstate    |     | email       |     | ban         |
+-------------+     | phone       |     | bunho       |
                    | writeday    |     | name        |
                    | delstate    |     | tot         |
                    +-------------+     | avg         |
                                        +-------------+

+-------------+     +-------------+
|  community  |     |    memo     |
+-------------+     +-------------+
| id (PK)     |     | id (PK)     |
| title       |     | title       |
| content     |     | content     |
| writeday    |     | fname       |
| cla         |     | writeday    |
| readnum     |     | seUserid    |
| ofname      |     | reUserid    |
| sfname      |     | state       |
| userid (FK) |     | ofname      |
+-------------+     | sfname      |
                    +-------------+
```

## 🖥️ 주요 화면

각 기능별 화면은 위 섹션의 스크린샷을 참고하세요. 시스템의 모든 페이지는 직관적인 인터페이스로 설계되어 있으며, 사용자 권한에 따라 접근 가능한 메뉴가 다르게 표시됩니다.

## 🚀 시작하기

### 요구사항
- JDK 17 이상
- Maven 3.8 이상
- MariaDB 10.5 이상

### 설치 방법

1. 저장소 복제
```bash
git clone https://github.com/MeronaKiller/myschool.git
cd myschool
```

2. 데이터베이스 설정
```sql
-- MariaDB에서 실행
CREATE DATABASE school;
USE school;
-- 제공된 myschool.sql 파일 실행하여 테이블 생성 및 초기 데이터 삽입
SOURCE myschool.sql;
```

3. 애플리케이션 속성 설정
```properties
# application.properties 파일 필요시 수정
spring.datasource.url=jdbc:mariadb://localhost:3306/school
spring.datasource.username=root
spring.datasource.password=1234
```

4. 애플리케이션 빌드 및 실행
```bash
# 빌드
mvn clean package

# 실행
java -jar target/school-0.0.1-SNAPSHOT.jar
```

5. 웹 브라우저에서 접속
```
http://localhost:8089
```

### 기본 계정 정보
| 사용자 ID | 비밀번호 | 권한 |
|---------|---------|------|
| admin | 1234 | 관리자(100) |
| hong | 1234 | 교사(80) |
| batman | 1234 | 교사(50) |

## 🧪 테스트

JUnit을 사용한 단위 테스트 실행:
```bash
mvn test
```

## 📝 프로젝트 구조

```
school/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── example/
│   │   │           └── school/
│   │   │               ├── controller/  # 웹 요청 처리
│   │   │               ├── domain/      # 데이터 모델
│   │   │               ├── mapper/      # MyBatis 매퍼 인터페이스
│   │   │               ├── service/     # 비즈니스 로직
│   │   │               └── SchoolApplication.java  # 애플리케이션 진입점
│   │   └── resources/
│   │       ├── mapper/                  # MyBatis XML 매퍼 파일
│   │       ├── static/                  # 정적 리소스(CSS, JS, 이미지)
│   │       └── templates/               # Thymeleaf 템플릿
│   │           ├── fragments/           # 재사용 가능한 템플릿 조각
│   │           ├── layout/              # 레이아웃 템플릿
│   │           └── views/               # 페이지별 뷰 템플릿
│   └── test/                            # 테스트 코드
├── pom.xml                              # Maven 프로젝트 설정
└── README.md                            # 프로젝트 문서
```

## 📄 라이센스

이 프로젝트는 MIT 라이센스를 따릅니다.

## 👨‍💻 개발자 정보

- GitHub: [MeronaKiller](https://github.com/MeronaKiller)
- 포트폴리오: [GitHub Pages](https://meronakiller.github.io/)

## 📞 문의사항

문의사항이 있으시면 GitHub Issue를 등록하거나 이메일로 연락해 주세요.
