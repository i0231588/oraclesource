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
ORDER BY
    sal DESC;

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
    AND sal NOT BETWEEN 1000 AND 2000;

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';
    


--오라클 함수
--UPPER,LOWER,INITCAP

--SUBSTR(문자열 데이터, 시작위치,추출길이): 추출길이 생략 가능

SELECT
    ename,
    substr(ename, 3)
FROM
    emp;

--|| : 문자열 연결 연산자
SELECT
    empno || ename,
    empno
    || ':'
    || ename
FROM
    emp;

--CEIL(숫자), FLOOR(숫자): 입력된 숫자와 가까운 큰 정수, 작은 정수

--SYSDATE 함수
--SYSDATE -1 => YESTERDAY
--SYSDATE +1 => TOMORROW

--ADD_MONTHS(날짜, 더할 개월 수): 몇개월 이후 날짜 구하기
SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;

--50주년 되는 날짜 구하기
SELECT
    empno,
    ename,
    add_months(hiredate, 600)
FROM
    emp;

--MONTHS_BETWEEN(첫번째 날짜, 두번째 날짜) : 두 날짜 데이터 간의 날짜 차이를 개월수로 계산하여 출력
--입사 45년 미만인 사원데이터 조회
SELECT
    empno,
    ename,
    hiredate
FROM
    emp
WHERE
    months_between(sysdate, hiredate) < 540;

--현재 날짜와 6개월 후 날짜
SELECT
    sysdate,
    add_months(sysdate, 6)
FROM
    dual;

--NEXT_DAY(날짜,요일): 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
--LAST_DAY(날짜) : 특정 날짜가 속한 달의 마지막 날짜를 출력
SELECT
    sysdate,
    next_day(sysdate, '금요일'),
    last_day(sysdate)
FROM
    dual;

--DECODE 함수
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upsal
FROM
    emp;

SELECT
    employee_id,
    ename,
    sal,
    trunk(sal / 21.5)        AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;

SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3), '월요일') AS r_job,
    nvl(to_char(comm), 'N/A')                AS comm --COMM이 NULL이면 'N.A'로 출력해줘
FROM
    emp
WHERE
    comm IS NULL;
    
--    
--SELECT EMPNO, ENAME, MGR, DECODE(MGR,'75%',0000,'76%',6666,'77%',7777,'78%',8888,NULL,0000,ELSE,MGR)AS CHG_MGR
--FROM EMP;

SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr), 1, 2), NULL, '0000', '75', '5555',
           '76', '6666', '77', '7777', '78',
           '8888', substr(to_char(mgr), 1)) AS chg_mgr
FROM
    emp;
    
    
    
--다중행 함수
SELECT
    SUM(sal)
FROM
    emp;

SELECT
    SUM(DISTINCT sal),
    SUM(ALL sal),
    SUM(sal)
FROM
    emp;

SELECT
    SUM(comm)
FROM
    emp;

SELECT
    COUNT(sal)
FROM
    emp;

SELECT
    COUNT(comm)
FROM
    emp;

SELECT
    MAX(sal)
FROM
    emp;

SELECT
    deptno,
    AVG(comm)
FROM
    emp
GROUP BY
    deptno;

--GROUP BY + HAVING: GROUP BY 절에 조건을 줄 때
--HAVING : 그룹화된 대상을 출력 제한할 때
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    AVG(sal) >= 2000
GROUP BY
    deptno,
    job
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    floor(AVG(sal)),
    MAX(sal),
    MIN(sal),
    COUNT(deptno)
FROM
    emp
GROUP BY
    deptno;

SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;

SELECT
    to_char(hiredate, 'YYYY'),
    deptno,
    COUNT(*)
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno;

--조인: 여러 테이블을 하나의 테이블처럼 사용
--1) 내부조인(inner join) : 여러개의 테이블에서 공통된 부분만 추출
--          1) 등가조인: 두개의 열이 일치할 때 값 추출
--          2) 비등가조인 : 범위에 해당할 떄 값 추출

--2) 외부조인(outer join)
--           1)left outer join
--           2)right outer join
--           3)full outer join

--dept: 4행, emp : 12행 ==> 4*12=48행
--크로스 조인(나올 수 있는 모든 조합 추출)

--inner join
SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno;


--SQL-99
--JOIN~ON
SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno;

SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal >= 3000;

--SQL-99
--JOIN~ON
SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    sal >= 3000;

SELECT
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal <= 2500
    AND e.empno <= 9999;

--SQL-99
--JOIN~ON
SELECT
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.sal <= 2500
    AND e.empno <= 9999;

SELECT
    *
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal;

--SQL-99
--JOIN~ON
SELECT
    *
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;



--self join: 자기 자신 테이블과 조인

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;

--left outer join -> 오른쪽에 + 붙이기
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno (+);

--right outer join -> 왼쪽에 + 붙이기
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr (+) = e2.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr (+) = e2.empno (+);


--SQL-99
--JOIN~ON
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

--연결해야할 테이블이 세 개일 때

--select *
--from table1 t1, table2 t2,table3 t3
--where t1.empno = t2.empno and t2.deptno = t3.deptno;
--
--select *
--from table1 t1 join table2 t2 on t1.empno = t2.empno table3 t3
--where t1.empno = t2.empno and t2.deptno = t3.deptno;

SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.sal
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.sal > 2000;

SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.sal
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    e.sal > 2000;

SELECT
    d.deptno,
    d.dname,
    AVG(sal),
    MAX(sal),
    MIN(sal),
    COUNT(*)
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno
GROUP BY
    d.deptno,
    d.dname;

SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.job,
    e.sal
FROM
    dept d,
    emp  e
WHERE
    d.deptno = e.deptno (+)
ORDER BY
    d.deptno,
    e.ename;
    
    
--서브쿼리
--sql문을 실행하는데 필요한 데이터를 추가로 조회하기 위해 sql문 내부에서 사용하는 select문
    
--select 조회할 열
--from 테이블명
--where 조건식(select 조회할 열 from 테이블 where조건식)

--존스의 급여보다 높은 급여를 받는 사원 조회
--jones 급여 알아내기 / 알아낸 jones 급여를 가지고 조건식

SELECT
    sal
FROM
    emp
WHERE
    ename = 'JONES';

SELECT
    *
FROM
    emp
WHERE
    sal > 2975;

SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JONES'
    );

SELECT
    *
FROM
    emp
WHERE
    hiredate > (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            ename = 'WARD'
    );

SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 20
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    );

SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 20
    AND e.sal <= (
        SELECT
            AVG(sal)
        FROM
            emp
    );

--in : 메인쿼리 결과가 서브쿼리 결과 중 하나라도 일치하면 true;
SELECT
    *
FROM
    emp
WHERE
    sal IN (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

SELECT
    *
FROM
    emp
WHERE
    sal < ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

SELECT
    *
FROM
    emp
WHERE
    sal < SOME (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

--단일행 서브쿼리
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            MIN(sal)
        FROM
            emp
        WHERE
            deptno = 30
    );
--다중행 서브쿼리
SELECT
    *
FROM
    emp
WHERE
    sal > ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );
--all : 서브쿼리 모든 결과가 조건식에 맞아 떨어져야만 메인쿼리 조건식이 true
SELECT
    *
FROM
    emp
WHERE
    sal < ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );
--exists : 서브쿼리에 결과 값이 하나 이상 존재하면 조건식이 모두 true
SELECT
    *
FROM
    emp
WHERE
    EXISTS (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = 10
    );

SELECT
    *
FROM
    emp
WHERE
    EXISTS (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = 50
    );--false

SELECT
    *
FROM
    emp
WHERE
    job = (
        SELECT
            job
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

SELECT
    *
FROM
    emp      e,
    deot     d,
    salgrade s
WHERE
        e.deptno = d.deptno
    AND e.sal BETWEEN s.losal AND s.hisal
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    )
ORDER BY
    e.sal DESC,
    e.empno ASC;
    
    
    
--다중열 서브쿼리 : 서브쿼리의 select 절에 비교할 데이터를 여러개 지정
SELECT
    *
FROM
    emp
WHERE
    ( deptno, sal ) IN (
        SELECT
            deptno, MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );
    
--from 절에 사용하는 서브쿼리(인라인 뷰)
--from 절에 직접 테이블을 명시해서 사용하기에는 테이블 내 데이터 규모가 클 때 불필요한 열이 많을 때
SELECT
    e10.empno,
    e1.ename,
    e10.deptno,
    d.dname,
    d.loc
FROM
    (
        SELECT
            *
        FROM
            emp
        WHERE
            deptno = 10
    ) e10,
    (
        SELECT
            *
        FROM
            dept
    ) d
WHERE
    e10.deptno = d.deptno;

--select 절에 사용하는 서브쿼리(스칼라 서브쿼리)
--select 절에 사용하는 서브쿼리는 반드시 하나의 결과만 반환해야 함
SELECT
    empno,
    ename,
    job,
    sal,
    (
        SELECT
            grade
        FROM
            salgrade
        WHERE
            e.sal BETWEEN losal AND hisal
    ) AS salgrade,
    deptno,
    (
        SELECT
            dname
        FROM
            dept
        WHERE
            e.deptno = dept.deptno
    ) AS dname
FROM
    emp e;

SELECT
    e.empno,
    e.ename,
    e.job,
    e.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.job NOT IN (
        SELECT
            job
        FROM
            emp
        WHERE
            deptno = 30
    )
    AND e.deptno = 10;

--단일행
SELECT
    e.empno,
    e.ename,
    e.sal,
    s.grade
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal
    AND e.sal > ALL (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    )
ORDER BY
    e.empno;
--다중행 (in,any,some,all,exists)


--DML(Data Manipulation Language): 데이터 추가(INSERT),수정(UPDATE),삭제(DELETE)


--연습용 테이블 생성
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

--insert into 테이블 이름(열이름1,열이름2...)
--values( 데이터1,데이터2...)


--dept_temp 새로운 부서 추가
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'WEB',
    NULL
);

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    70,
    'MOBILE',
    ''
);

INSERT INTO dept_temp (
    deptno,
    loc
) VALUES (
    91,
    'INCHEON'
);

SELECT
    *
FROM
    dept_temp;

CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    9999,
    '홍길동',
    'PRESIDENT',
    NULL,
    '2001/01/01',
    5000,
    1000,
    10
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    1111,
    '성춘향',
    'MANAGER',
    9999,
    '2002/01/05',
    4000,
    NULL,
    10
);

--서브쿼리로 insert 구현
--emp, salgrade 테이블 조인 후 급여 등급이 1인 사원만 emp_temp
INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        e.empno,
        e.ename,
        e.job,
        e.hiredate,
        e.sal,
        e.comm,
        e.deptno
    FROM
        emp      e,
        salgrade s
    WHERE
        e.sal BETWEEN s.hisal AND s.losal
        AND s.grade = 1;

SELECT
    *
FROM
    emp_temp;
    
--update : 테이블에 있는 데이터 수정

--update 테이블명
--set 변경할 열 이름 = 데이터,변경할 열 이름 = 데이터
--where 변경을 위한 대상 행을 선벌하기 위한 조건

SELECT
    *
FROM
    dept_temp;

--dept_temp loc 열의 모든 값을 seoul로 변경
UPDATE dept_temp
SET
    loc = 'SEOUL';

ROLLBACK;

UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = 40;

UPDATE dept_temp
SET
    dname = 'SALES',
    loc = 'CHICAGO'
WHERE
    deptno = 80;

UPDATE emp_temp
SET
    comm = 50
WHERE
    sal <= 2500;


--서브쿼리를 사용ㅎ여 수정

UPDATE dept_temp
SET
    ( dname,
      loc ) = (
        SELECT
            dname,
            loc
        FROM
            dept
        WHERE
            deptno = 40
    )
WHERE
    deptno = 40;

COMMIT;

--delete: 테이블에 있는 데이터 삭제
CREATE TABLE emp_temp2
    AS
        SELECT
            *
        FROM
            emp;

DELETE FROM emp_temp2
WHERE
    job = 'MANAGER';

DELETE emp_temp2
WHERE
    job = 'SALESMAN';

ROLLBACK;

--서브쿼리를 사용하여 삭제
DELETE FROM emp_temp2
WHERE
    empno IN (
        SELECT
            e.empno
        FROM
            emp_temp2 e, salgrade  s
        WHERE
            e.sal BETWEEN s.losal AND s.hisal
            AND e.deptno = 30
    );

SELECT
    *
FROM
    emp_temp2;

COMMIT;

CREATE TABLE exam_emp
    AS
        SELECT
            *
        FROM
            emp;

CREATE TABLE exam_dept
    AS
        SELECT
            *
        FROM
            emp;
CREATE TABLE exam_salgrade
    AS
        SELECT
            *
        FROM
            salgrade;  
drop table ecam_emp; 

commit;

update exam_emp
set deptno=70
where sal>(select avg(sal) from exam_emp where deptno=50); 

update exam_emp
set sal = sal*1.1,deptno = 80
where hiredate>(select min(hiredate)from exap_emp where deptno =60);

delete from exam_emp
where empno in(select empno from exam_emp,salgrade where sal between losal and hisal and grade=5);
            
            
--트랜잭션 : 최소 수행 단위
--트랜잭션 제어하는 구문 TCL : commit, rollback

create table dept_tcl as select*from dept;

insert into dept_tcl values(50,'DATABASE','SEOUL');

UPDATE dept_tcl set loc = 'BUSAN' WHERE deptno=40;

delete from dept_tcl where dname = 'RESEARCH';

select *from dept_tcl;

--트랜잭션 취소
rollback;
--트랜잭션 최종 반영
commit;
--세션: 어떤 활동을 위한 시간이나 기간
--데이터베이스 세션: 데이터베이스 접속을 시작으로 관련작업 수행한 후 접속 종료












