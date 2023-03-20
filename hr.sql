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

select last_name, hire_date
from employees
where hire_date like '04%';
    
SELECT LAST_NAME, HIRE_DATE
FROM employees
WHERE LAST_NAME LIKE '%u%';

SELECT LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '___a%';

SELECT LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '%a%' or last_name like '%e%' order by last_name asc;
    
    
SELECT LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '%a%e%' or last_name like '%e%a%' order by last_name asc;   

select last_name, jab_id
from employees
where manager_id is null;

select DISTINCT department_id
from employees
where job_id='ST_CLERK' and department_id is not null;

select employee_id,first_name, job_id, salary*commission_pct as commission
from employees
where commission_pct is not null;
