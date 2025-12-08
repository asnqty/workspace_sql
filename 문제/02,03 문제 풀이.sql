-- 02_문제
-- 1.회원 테이블 생성
CREATE TABLE userTable (userNo NUMBER PRIMARY KEY, userId VARCHAR2(20) UNIQUE NOT NULL, userPw VARCHAR2(20) NOT NULL,
userTel VARCHAR2(20) UNIQUE, userMembership VARCHAR2(10) CHECK (userMembership IN ('gold', 'silver', 'bronze')), userEmail varchar2(20) UNIQUE,
userPoint NUMBER DEFAULT 1000, joinDate DATE DEFAULT SYSDATE);
-- 2.데이터 삽입
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (1, 'id01', '1111', '010-1111-1111', 'gold', 'id01@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (2, 'id02', '1111', '010-1111-2222', 'silver', 'id02@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (3, 'id03', '1111', '010-1111-3333', 'bronze', 'id03@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (4, 'id04', '1111', '010-1111-4444', 'gold', 'id04@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (5, 'id05', '1111', '010-1111-5555', 'silver', 'id05@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (6, 'id06', '1111', '010-1111-6666', 'bronze', 'id06@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (7, 'id07', '1111', '010-1111-7777', 'gold', 'id07@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (8, 'id08', '1111', '010-1111-8888', 'silver', 'id08@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (9, 'id09', '1111', '010-1111-9999', 'bronze', 'id09@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (10, 'id10', '1111', '010-1111-0000', 'gold', 'id10@aa.com');
SELECT * FROM userTable;
COMMIT;
-- 3.질의문 처리
-- 1)
SELECT * FROM userTable WHERE userNo >= 5;
-- 2)
SELECT * FROM userTable WHERE userNo >= 3 and userNo <= 7;
SELECT * FROM userTable WHERE userNo BETWEEN 3 AND 7;
-- 3)
SELECT * FROM userTable WHERE userTel LIKE ('%5555');
-- 4)
SELECT AVG(userPoint) FROM userTable WHERE userMembership = 'gold';
-- 5)
UPDATE userTable SET joinDate='2019/10/28' WHERE userId = 'id03';
COMMIT;
-- 6)
UPDATE userTable SET userPoint=3 * userPoint WHERE userMembership = 'gold';
COMMIT;
-- 7)
UPDATE userTable SET userPw='2222' WHERE userId = 'id08';
COMMIT;
-- 8)
UPDATE userTable SET userMembership='silver' WHERE userMembership = 'bronze' AND userPoint >= 1000;
COMMIT;
-- 9)
DELETE FROM userTable WHERE userNo = 5;
COMMIT;

-- 03_문제
-- 1. 책 테이블 생성
CREATE TABLE book (bookid NUMBER PRIMARY KEY, bookname VARCHAR2(50), publisher VARCHAR2(50), price NUMBER);
-- 2. 고객 테이블 생성
CREATE TABLE customer (customerid NUMBER PRIMARY KEY, name VARCHAR2(20), address VARCHAR2(50), phone VARCHAR2(20));
-- 3. 주문 테이블 생성
CREATE TABLE orders (orderid NUMBER PRIMARY KEY, customerid NUMBER REFERENCES customer(customerid), bookid NUMBER 
REFERENCES book(bookid), saleprice NUMBER, orderdate DATE);
-- 03_입력 데이터
insert into book values (1, '축구의역사', '굿스포츠', 7000);
insert into book values (2, '축구아는여자', '나무수', 13000);
insert into book values (3, '축구의이해', '대한미디어', 22000);
insert into book values (4, '골프바이블', '대한미디어', 35000);
insert into book values (5, '피겨교본', '굿스포츠', 6000);
insert into book values (6, '역도단계별기술', '굿스포츠', 6000);
insert into book values (7, '야구의추억', '이상미디어', 20000);
insert into book values (8, '야구를부탁해', '이상미디어', 13000);
insert into book values (9, '올림픽이야기', '삼성당', 7500);
insert into book values (10, '올림픽챔피언', '피어슨', 13000);

insert into customer values (1, '박지성', '영국 맨체스터', '010-0000-0000');
insert into customer values (2, '김연아', '대한민국 서울', '010-1111-1111');
insert into customer values (3, '장미란', '대한민국 강원도', '010-2222-2222');
insert into customer values (4, '추신수', '미국 텍사스', '010-4444-4444');
insert into customer values (5, '박세리', '대한민국 대전', '010-5555-5555');

insert into orders values (1, 1, 1, 6000, '2014-07-01');
insert into orders values (2, 1, 3, 21000, '2014-07-03');
insert into orders values (3, 2, 5, 8000, '2014-07-03');
insert into orders values (4, 3, 6, 6000, '2014-07-04');
insert into orders values (5, 4, 7, 20000, '2014-07-07');
insert into orders values (6, 1, 2, 12000, '2014-07-07');
insert into orders values (7, 4, 8, 13000, '2014-07-07');
insert into orders values (8, 3, 10, 12000, '2014-07-08');
insert into orders values (9, 2, 10, 7000, '2014-07-09');
insert into orders values (10, 3, 8, 13000, '2014-07-10');

commit;

SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM orders JOIN customer USING(customerId) JOIN book USING(bookId);
-- 4
SELECT bookname FROM book WHERE bookid = 1;
-- 5
SELECT bookname FROM book WHERE price >= 20000;
-- 6
SELECT DISTINCT publisher FROM book;
-- 7
SELECT SUM(saleprice) AS "총판매액" FROM orders;
-- 8
SELECT SUM(saleprice) AS "박지성씨의 결제금액" FROM orders WHERE customerid = (SELECT customerid FROM customer WHERE name = '박지성');
SELECT SUM(o.saleprice) AS "박지성씨의 결제금액" FROM customer c inner join orders o on c.customerid = o.customerid WHERE c.name = '박지성';
-- 9
SELECT COUNT(customerid) AS "박지성씨의 구매 수" FROM orders WHERE customerid = (SELECT customerid FROM customer WHERE name = '박지성');
SELECT COUNT(customerid) AS "박지성씨의 구매 수"    FROM customer JOIN orders USING(customerid) WHERE name = '박지성';
-- 10
SELECT orderid, customerid, bookid, saleprice FROM orders WHERE orderdate BETWEEN '2014/07/04' AND '2014/07/07';
-- 11
SELECT name FROM customer WHERE customerid NOT IN (SELECT DISTINCT customerid FROM orders);
SELECT c.name FROM customer c LEFT OUTER JOIN orders o USING(customerId) WHERE o.orderid IS NULL;
-- 12
SELECT COUNT(DISTINCT publisher) FROM book WHERE bookid IN (SELECT bookid FROM orders WHERE customerid =(SELECT customerid
FROM customer WHERE name = '박지성'));
SELECT COUNT(DISTINCT publisher) FROM (SELECT * FROM customer c INNER JOIN orders o USING(customerid)) A 
INNER JOIN book b USING(bookid) WHERE A.name = '박지성';
-- 13
SELECT * FROM customer LEFT OUTER JOIN orders USING (customrid);
SELECT name, SUM(nvl(saleprice,0)) FROM customer LEFT OUTER JOIN orders USING (customerid) GROUP BY name;
SELECT name, NVL((SELECT SUM(saleprice) FROM orders WHERE customer.customerdid = orders.customerid), 0) FROM customer;