--javadb

--userTBL 테이블 생성
--no(숫자 4자리),username(한글),birthYear(년도-숫자(4)),addr(문자(한글,숫자),mobile(010-1234-5678)
--no pk 제약조건 (제약조건명 pk_userTBL)
CREATE TABLE usertbl (
    no        NUMBER(4)
        CONSTRAINT pk_usertbl PRIMARY KEY,
    username  NVARCHAR2(10) not null,
    birthyear NUMBER(4) not null,
    addr      NVARCHAR2(50) not null,
    mobile    NVARCHAR2(20) not null
);

drop table usertbl;
--시퀀스 생성
-- user_seq(기본)
CREATE SEQUENCE user_seq;

INSERT INTO usertbl (
    no,
    username,
    birthyear,
    addr,
    mobile
) VALUES (
    user_seq.NEXTVAL,
    '홍길동',
    '2023',
    '서울시 종로구 123',
    '010-1234-5678'
);
commit;


--paytype : pay_no(숫자),info(문자)
--paytype_seq 생성
create table paytype (
pay_no number(1) primary key ,
info varchar2(10) not null
);
CREATE SEQUENCE paytype_seq;

insert into paytype values (paytype_seq.nextval,'card');
insert into paytype values (paytype_seq.nextval,'cash');
--user : user_id(숫자 4),name(문자),pay_no(숫자: paytype 테이블에 있는 pay_no 참조)
drop table paytype;

create table suser(
user_id number(4) primary key ,
name varchar2(20) not null,
pay_no number (1) not null references paytype(pay_no) 
);
--product
--product_id(숫자 8),pname(문자), price(숫자),content(문자)
create table product(
product_id number(8) primary key,
pname varchar2(30) not null,
price number(10) not null,
content varchar2(50) not null
);
create sequence product_seq;

--order
--order_id(숫자 8) user_id(user 테이블의 user_id 참조), product_id(product 테이블의 product_id 참조)
--order_seq

create table sorder (
order_id number(8) not null,
user_id number(4) not null references suser(user_id) ,
product_id number(8) not null references product(product_id)
);

create sequence order_seq;






