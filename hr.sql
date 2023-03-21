--employees 테이블 전체 내용 조회
SELECT
    *
FROM
    employees;
    
--employees 테이블 first_name,last_name,job_id 조회
SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;

SELECT
    last_name
FROM
    employees
WHERE
    employee_id = 176;

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary < 5000
    OR salary > 12000;

SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
ORDER BY
    last_name ASC,
    department_id ASC;

SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL
ORDER BY
    salary DESC,
    commission_pct DESC;

SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND ( job_id = 'SA_REP'
          OR job_id = 'ST_CLERK' );

--2004년도에 고용된 사원들의 LAST_NAME HIRE_DATE 조회

SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY
    hire_date ASC;

--연봉이 5000에서 12000 범위인 사람들의 LAST NAME, SALARY
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
    AND salary BETWEEN 5000 AND 12000
ORDER BY
    salary ASC;

SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '04%';

SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    last_name LIKE '%u%';

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '___a%';

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name ASC;

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%e%'
    OR last_name LIKE '%e%a%'
ORDER BY
    last_name ASC;

SELECT
    last_name,
    jab_id
FROM
    employees
WHERE
    manager_id IS NULL;

SELECT DISTINCT
    department_id
FROM
    employees
WHERE
        job_id = 'ST_CLERK'
    AND department_id IS NOT NULL;

SELECT
    employee_id,
    first_name,
    job_id,
    salary * commission_pct AS commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

--first_name이 Curtis인 사람의 first_name, lastname,email,phone_number,job_id 조회
--단 job_id의 결과는 소문자로 출력
SELECT
    first_name,
    last_name,
    email,
    phone_number,
    lower(job_id)
FROM
    employees
WHERE
    first_name = 'Curtis';

SELECT
    employee_id,
    first_name,
    hire_date,
    replace(job_id, 'IT_PROG', '프로그래머')
FROM
    employees
WHERE
    department_id IN ( 60, 70, 80, 90 );

SELECT
    employee_id,
    first_name || last_name,
    department_id,
    job_id
FROM
    employees
WHERE
    upper(job_id) = 'AD_PRES'
    OR upper(job_id) = 'PU_CLERK';

SELECT
    last_name,
    salary,
    decode(trunc(salary / 2000, 0), 0, 0.00, 1, 0.09,
           2, 0.20, 3, 0.30, 4,
           0.40, 5, 0.42, 6, 0.44,
           0.45) AS tax_rate
FROM
    employees
WHERE
    department_id = 80;
    
SELECT MAX(SALARY)-MIN(SALARY)
FROM employees;

SELECT COUNT(DISTINCT MANAGER_ID)
FROM employees;