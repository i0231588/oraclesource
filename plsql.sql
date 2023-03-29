--PL/SQL : SQL 만으로는 구현이 어렵거나 구현 불가능한 작업을 수행히기 위해 오라클에서 제공하는 프로그래밍 언어

SET SERVEROUTPUT ON;

--블록 : DECLEAR ~ BEGIN ~ END


BEGIN
    dbms_output.put_line('Hello PL/SQL');
END;
/
--변수
DECLARE
    v_empno NUMBER(4) := 7788;
    v_ename VARCHAR2(10);
BEGIN
    v_ename := 'SCOTT';
    dbms_output.put_line('V_ENAME : ' || v_ename);
    dbms_output.put_line('V_ENPNO : ' || v_empno);
END;
/

--상수 선언
DECLARE
    v_tax CONSTANT NUMBER(4) := 7788;
BEGIN
    dbms_output.put_line('V_TAX : ' || v_tax);
END;
/
--변수 + DEFAULT
DECLARE
    v_tax NUMBER(4) DEFAULT 10;
BEGIN
    dbms_output.put_line('V_TAX : ' || v_tax);
END;
/
--변수 + NOT NULL
DECLARE
    v_tax NUMBER(4) NOT NULL := 10;
BEGIN
    dbms_output.put_line('V_TAX : ' || v_tax);
END;
/
--변수 + NOT NULL + DEFAULT
DECLARE
    v_tax NUMBER(4) NOT NULL DEFAULT 10;
BEGIN
    dbms_output.put_line('V_TAX : ' || v_tax);
END;
/

--변수와 상수의 자료형
--스칼라 : 오라클이 사용하는 타입(NUMBER, CHAR, DATE....)
--참조형 : 오라클 데이터 베이스에 존재하는 특정 테이블의 열의 자료형이나 하나의 행 구조를 참조하는 자료형
--  1) 변수이름 테이블명. 열이름%TYPE : 특정 테이블에 속한 열과 같은 크기의 자료형을 사용
--  2) 변수이름 테이블명: 테이블명% ROWTYPE: 특정 테이블에 속한 행구조 전체 참조
DECLARE
    v_deptno dept.deptno%TYPE := 50;
BEGIN
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
END;
/

DECLARE
    v_dept_row dept%rowtype;
BEGIN
    SELECT
        deptno,
        dname,
        loc
    INTO v_dept_row
    FROM
        dept
    WHERE
        deptno = 40;

    dbms_output.put_line('V_DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('V_DNAME : ' || v_dept_row.deptno);
    dbms_output.put_line('V_LOC : ' || v_dept_row.deptno);
END;
/

--조건문 : IF, IF~THEN~END
DECLARE
    v_number NUMBER := 15;
BEGIN 
    --V_NUMBER 홀수인지 짝수인지 구별
    IF MOD(v_number, 2) = 1 THEN
        dbms_output.put_line('V_DEPTNO 는 홀수 ');
    END IF;
END;
/

DECLARE
    v_number NUMBER := 15;
BEGIN 
    --V_NUMBER 홀수인지 짝수인지 구별
    IF MOD(v_number, 2) = 1 THEN
        dbms_output.put_line('V_NUMBER 는 홀수 ');
    ELSE
        dbms_output.put_line('V_NUMBER 는 짝수 ');
    END IF;
END;
/

--학점 출력
DECLARE
    v_number NUMBER := 87;
BEGIN 
    --
    IF v_number >= 90 THEN
        dbms_output.put_line('A 학점 ');
    ELSIF v_number >= 80 THEN
        dbms_output.put_line('B 학점 ');
    ELSIF v_number >= 70 THEN
        dbms_output.put_line('C 학점 ');
    ELSIF v_number >= 60 THEN
        dbms_output.put_line('D 학점 ');
    ELSE
        dbms_output.put_line('F 학점 ');
    END IF;
END;
/

DECLARE
    V_NUMBER NUMBER := 87;
BEGIN 
   CASE TRUNC(V_NUMBER/10)
   WHEN 10 THEN
         DBMS_OUTPUT.PUT_LINE('A 학점 ' );
   WHEN 9 THEN
        DBMS_OUTPUT.PUT_LINE('A 학점 ' );
    WHEN 8 THEN
        DBMS_OUTPUT.PUT_LINE('B 학점 ' );
    WHEN 7 THEN
        DBMS_OUTPUT.PUT_LINE('C 학점 ' );
    WHEN 6 then 
    DBMS_OUTPUT.PUT_LINE('D 학점 ' ); 
    ELSE DBMS_OUTPUT.PUT_LINE('F 학점 ' );
    end CASE;
END;    
/


DECLARE
    V_NUMBER NUMBER := 87;
BEGIN 
   CASE 
   WHEN V_NUMBER>=90 THEN
         DBMS_OUTPUT.PUT_LINE('A 학점 ' );
    WHEN V_NUMBER>=80 THEN
        DBMS_OUTPUT.PUT_LINE('B 학점 ' );
    WHEN V_NUMBER>=70 THEN
        DBMS_OUTPUT.PUT_LINE('C 학점 ' );
    WHEN V_NUMBER>=60 then 
    DBMS_OUTPUT.PUT_LINE('D 학점 ' ); 
    ELSE DBMS_OUTPUT.PUT_LINE('F 학점 ' );
    end CASE;
END;    
/

--반복문
-- LOOP~ END LOOP, WHILE LOOP, FOR LOOP, CUSOR FOR LOOP

DECLARE
    v_NUM NUMBER := 0;
BEGIN
    LOOP
        dbms_output.put_line('V_NUM : ' || V_NUM);
        V_NUM := V_NUM+1;
    EXIT WHEN V_NUM >4;
    END LOOP;
END;
/

DECLARE
    v_NUM NUMBER := 0;
BEGIN
    WHILE V_NUM < 4 LOOP
        dbms_output.put_line('V_NUM : ' || V_NUM);
        V_NUM := V_NUM+1;
    END LOOP;
END;
/
--FOR I IN 시작값..종료값
BEGIN
    FOR I IN 0..4 LOOP
        dbms_output.put_line('I : ' || I);
    END LOOP;
END;
/

BEGIN
    FOR I IN REVERSE 0..4 LOOP
        dbms_output.put_line('I : ' || I);
    END LOOP;
END;
/

BEGIN
    FOR I IN 0..4 LOOP
    CONTINUE WHEN MOD(I,1)=1;
        dbms_output.put_line('I : ' || I);
    END LOOP;
END;
/

BEGIN
    FOR I IN 0..4 LOOP
    CONTINUE WHEN MOD(I,2)=1;
        dbms_output.put_line('I : ' || I);
    END LOOP;
END;
/


BEGIN
    FOR I IN 0..10 LOOP
    CONTINUE WHEN MOD(I,2)=0;
        dbms_output.put_line('I : ' || I);
    END LOOP;
END;
/





