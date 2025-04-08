# 🏫 Spring School Management System

학교 관리 시스템(School Management System)은 학생, 교사 및 수업을 관리하기 위한 스프링 부트 기반 웹 애플리케이션입니다.

<img src="https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/1.png" width="600">

## 📋 프로젝트 개요

이 프로젝트는 학교 관리를 효율적으로 수행할 수 있는 시스템을 제공합니다. 학생 정보 관리, 교사 정보 관리, 수업 일정 관리 등의 기능을 포함하고 있습니다.

## 🛠️ 개발 환경

- **Language**: Java 17
- **Framework**: Spring Boot 3.4.4
- **Database**: MariaDB
- **ORM**: MyBatis
- **View Template**: Thymeleaf
- **IDE**: Spring Tool Suite 4 (STS4)
- **Build Tool**: Maven

## 📂 주요 기능

1. **학생 관리**
   - 학생 등록, 조회, 수정, 삭제
   - 학생 출석 관리
   - 성적 관리

<img src="https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/2.png" width="600">

2. **교사 관리**
   - 교사 등록, 조회, 수정, 삭제
   - 담당 과목 관리
   - 담임 반 관리

<img src="https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/3.png" width="600">

3. **수업 관리**
   - 수업 개설, 조회, 수정, 삭제
   - 수강 신청 관리
   - 시간표 관리

<img src="https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/4.png" width="600">

4. **성적 관리**
   - 시험 점수 등록 및 관리
   - 성적표 생성
   - 통계 및 분석

<img src="https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/5.png" width="600">

## 🔧 프로젝트 구조

```
school/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── example/
│   │   │           └── school/
│   │   │               ├── controller/
│   │   │               ├── domain/
│   │   │               ├── mapper/
│   │   │               ├── service/
│   │   │               └── SchoolApplication.java
│   │   └── resources/
│   │       ├── mapper/
│   │       ├── static/
│   │       │   ├── css/
│   │       │   ├── js/
│   │       │   └── images/
│   │       └── templates/
│   │           ├── fragments/
│   │           ├── layout/
│   │           └── views/
│   └── test/
├── pom.xml
└── README.md
```

## 🖥️ 화면 구성

### 메인 페이지
<img src="https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/6.png" width="600">

### 학생 관리 페이지
<img src="https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/7.png" width="600">

### 성적 분석 페이지
<img src="https://github.com/MeronaKiller/myschool-portfolio/blob/main/docs/images/8.png" width="600">

## 📊 데이터베이스 설계

### ERD (Entity Relationship Diagram)
```
학생(Student)
├── student_id (PK)
├── name
├── grade
├── class
├── student_number
├── phone
└── address

교사(Teacher)
├── teacher_id (PK)
├── name
├── subject
├── phone
└── email

수업(Class)
├── class_id (PK)
├── name
├── teacher_id (FK)
├── room
├── start_time
└── end_time

수강(Enrollment)
├── enrollment_id (PK)
├── student_id (FK)
├── class_id (FK)
└── enrollment_date

성적(Grade)
├── grade_id (PK)
├── student_id (FK)
├── class_id (FK)
├── score
└── semester
```

## 📝 주요 코드

### Controller 예시
```java
@Controller
@RequestMapping("/students")
public class StudentController {
    
    @Autowired
    private StudentService studentService;
    
    @GetMapping
    public String listStudents(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "views/students/list";
    }
    
    @GetMapping("/{id}")
    public String viewStudent(@PathVariable("id") Long id, Model model) {
        model.addAttribute("student", studentService.getStudentById(id));
        return "views/students/view";
    }
    
    // 추가 메서드...
}
```

### Service 예시
```java
@Service
public class StudentService {
    
    @Autowired
    private StudentMapper studentMapper;
    
    public List<Student> getAllStudents() {
        return studentMapper.findAll();
    }
    
    public Student getStudentById(Long id) {
        return studentMapper.findById(id);
    }
    
    // 추가 메서드...
}
```

### Mapper 예시
```java
@Mapper
public interface StudentMapper {
    
    List<Student> findAll();
    
    Student findById(Long id);
    
    void insert(Student student);
    
    void update(Student student);
    
    void delete(Long id);
}
```

## 🚀 시작하기

### 사전 요구사항
- Java 17 이상
- Maven
- MariaDB

### 설치 및 실행
1. 저장소 복제
```bash
git clone https://github.com/MeronaKiller/myschool.git
cd myschool
```

2. 데이터베이스 설정
```sql
CREATE DATABASE school;
```

3. 애플리케이션 실행
```bash
mvn spring-boot:run
```

4. 웹 브라우저에서 접속
```
http://localhost:8089
```

## 📄 라이센스

이 프로젝트는 MIT 라이센스를 따릅니다.

## 👨‍💻 개발자 정보

- GitHub: [MeronaKiller](https://github.com/MeronaKiller)
- Portfolio: [GitHub Pages](https://meronakiller.github.io/)

## 📞 문의사항

문의사항이 있으시면 이슈를 등록하거나 이메일로 연락해주세요.
