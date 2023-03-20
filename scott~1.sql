--scott

--emp 테이블 구성 보기
--필드명(열이름)          제약조건   데이터타입
--   EMPNO(사원번호)    NOT NULL   NUMBER(4)
--   ENAME(사원명),JOB(직책),MGR(직속상관 번호),HREDATE(입사일),SAL(급여),COMM(수당),DEPTNO(부서번호)
-- NUMBER: 소수점 자릿수를 포함해서 지정 가능
--NUMBER(4): 4자리 숫자까지 허용 NUMBER(8,2): 전체 자릿수는 8자리이고 소수점 2자리를 포함
--VARCHAR2: 가변형 문자열 저장
--VARCHAR2(10): 10byte 문자까지 저장 가능
--DATE: 날짜 데이터
DESC emp;

--DEPTNO(부서번호),DNAME(부서명),LOC(부서위치)
DESC dept;

--GRADE(급여등급),LOSAL(최저급여액),HISAL(최대급여액)
DESC salgrade;

--select: 데이터 조회
--조인방식: 셀렉션(행 단위로 조회),프로젝션(열 단위로 조회),조인(두 개 이상의 테이블을 사용하여 조회)
--SELECT 열이름1,열이름2...(조회할 열이 전체라면 * 로 처리)
--FROM 테이블명;

--1. EMP테이블의 전체 열을 조회
SELECT
    *
FROM
    emp;

--2. EMP 테이블에서 사원번호, 읾, 급여 열을 조회
SELECT
    empno,
    ename,
    sal
FROM
    emp;

SELECT
    *
FROM
    emp;
    
--3.DEPT 테이블 전체 조회
--4.DEPT 테이블 안에 부서번호,지역만 조회

SELECT
    *
FROM
    dept;

SELECT
    deptno,
    loc
FROM
    dept;
    
--EMP 테이블 안에 부서번호 조회
SELECT
    deptno
FROM
    emp;

--6 EMP 테이블 안에 부서번호 조회(단, 중복 부서번호는 제거)
SELECT DISTINCT
    deptno
FROM
    emp;

SELECT DISTINCT --열이 여러개인 경우(묶어서 중복이냐 아니냐를 판단)
    job,
    deptno
FROM
    emp;    
    
    
    
    
--연산
--별칭 : 필드에 별칭을 임의로 부여(as 별칭 , 혹은 한 칸 띄고 별칭, 별칭에 공백잉 있다면 ""로 묶어주기)
--사원들의 1년 연봉 구하기 (sal*12+comm)
SELECT
    empno,
    ename           사원명,
    job             "직 책",
    sal * 12 + comm AS annsal
FROM
    emp;
    
--8. 순서: ORDER BY
--        오름차순: ASC 내림차순: DESC

--ENAME, SAL 열 추출하고 SAL 내림차순 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;
    
--전체 내용 출력하고, 결과가 사원번호의 오름차순으로 정렬
SELECT
    *
FROM
    emp
ORDER BY
    empno;

SELECT
    *
FROM
    emp
ORDER BY
    deptno,
    sal DESC;
    
--[실습] emp테이블의 모든 열 출력
--empno =>employee_no
--enmae => employee_name
--mor ->manager
--sal => salary
--comm=>commission
--deptno => department_no
--부서 번호를 기준으로 내림차순으로 정렬하되 부서번호가 같다면 사원이름 기준으로 오름차순
SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;

SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';


--산술연산자: +,-,*,/mod()
--비교연산자:>, >=, <, <=
--등가비교연산자: = ,!=, <>, ^=
--논리부정연산자: NOT
--IN연산자
--BETWEEN A AND B 연산자
--LIKE연산자와 와일드카드
--IS NULL 연산자
--집합 연산자: UNION(합집합-중복제거),UNION ALL(합집합-중복보함),MINUS(차집합),INTERSECT(교집합)

SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN'
    OR job = 'CLERK';

SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
        job != 'MANAGER'
    AND job <> 'SALESMAN'
    AND job^= 'CLERK';

SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

--LIKE연산자와 와일드카드(_,%)
--_ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미
--% : 길이와 상관없이 모든 문자 데이터를 의미

SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

--사원 이름의 두번째 글자가 L인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

--union(동일한 결과값인 겨우 중복 제거),union all(중복제거 안함)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

--minus(차집합)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

--insersect(교집합)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';

SELECT
    deptno,
    ename,
    sal
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN'
    order by sal desc;

SELECT
    empno ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;

SELECT
    empno,
    sal,
    deptno,
    ename
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal not BETWEEN 1000 AND 2000;

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    and mgr is not null
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';
    


--오라클 함수
--UPPER,LOWER,INITCAP

--SUBSTR(문자열 데이터, 시작위치,추출길이): 추출길이 생략 가능

SELECT ENAME, SUBSTR(ENAME,3)
FROM EMP;

--|| : 문자열 연결 연산자
SELECT EMPNO || ENAME, EMPNO || ':' || ENAME
FROM EMP;

    
    