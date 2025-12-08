SELECT -10, ABS(-10) FROM dual;
SELECT 34.5678, FLOOR(34.5678) AS "Integer" FROM dual;
SELECT 34.5678, ROUND(34.5678), ROUND(34.5678, 2), ROUND(34.5678, -1)  FROM dual;
SELECT 34.5678, TRUNC(34.5678, 2), TRUNC(34.5678, -1),TRUNC(34.5678) FROM dual;
SELECT MOD(27, 2), MOD(27, 5), MOD(27,7) FROM dual;
SELECT SUBSTR(ename, 2, 2) as "이름" FROM emp;
-- 문제 1
SELECT * FROM emp WHERE SUBSTR(hiredate, 4, 2) = '10';
-- 문제 2
-- DATE 자료형이라 비교를 해도 됨
SELECT * FROM emp WHERE SUBSTR(hiredate, 1, 2) = '03';
SELECT * FROM emp WHERE hiredate BETWEEN '03/01/01' and '03/12/31';
-- 문제 3
-- 맨 뒷자리라 -1로 써도 됨, ename의 길이도 가능은 함
SELECT * FROM emp WHERE SUBSTR(ename, 3, 1) = '기';
SELECT * FROM emp WHERE SUBSTR(ename, -1, 1) = '기';
SELECT * FROM emp WHERE SUBSTR(ename, LENGTH(ename), 1) = '기';
-- 문제 4
-- DECODE도 CASE처럼 해당되지 않는 값들을 전부 쓰지 않고 무엇으로 표현할지만 써줘도 됨
-- 근데 DECODE는 같은 컬럼 내에서만 조건 설정, CASE는 if문처럼 조건을 서로 다른 칼럼으로 달아도 됨
-- '사장'과 '차장'은 sal만 표시하면 되니 그냥 마지막에 sal만 적으면 앞의 조건에 해당하지 않는 값들은 sal만 출력
SELECT empno, ename, job, sal, DECODE(job, '부장', sal * 1.05,
                                                                     '과장', sal * 1.10,
                                                                     '대리', sal * 1.15,
                                                                     '사원', sal * 1.20,
                                                                     '사장', sal, '차장', sal) AS "UPSAL" FROM emp;
-- 문제 5
SELECT hiredate, TO_CHAR (hiredate, 'YYYY/MON/DD') AS "CDATE" FROM emp;


-- 문제 1
SELECT MAX(sal) AS "Maximum", MIN(sal) AS "Minimum", SUM(sal) AS "Sum", FLOOR(AVG(sal)) AS "Average" FROM emp;
-- 문제 2
SELECT job, MAX(sal) AS "Maximum", MIN(sal) AS "Minimum", SUM(sal) AS "Sum", FLOOR(AVG(sal))  AS "Average" FROM emp GROUP BY job;
-- 문제 3
SELECT job , COUNT(*) || '명' AS "직원수" FROM emp GROUP BY job;
-- 문제 4
SELECT COUNT(mgr) AS "상급자를 가진 직원 수" FROM emp;
-- 문제 5
SELECT (MAX(sal) - MIN(sal)) AS "차액" FROM emp;
-- 문제 6
SELECT job, MIN(sal) AS "최저급여" FROM emp GROUP BY job HAVING MIN(sal) >= '500' ORDER BY MIN(sal) DESC ;
-- 문제 7
SELECT deptno, count(*) AS "Number Of People", ROUND(AVG(sal), '2') AS "Sal" FROM emp GROUP BY deptno ORDER BY deptno ASC;
-- 문제 8
SELECT DECODE(deptno, '10', '경리부', '20', '인사부', '30', '영업부') AS "Dname",  
             DECODE(deptno, '10', '서울', '20', '인천', '30', '용인') AS "Location", COUNT(*) AS "Number Of Peopel",
             ROUND(AVG(sal), 2) AS "Sal" FROM emp GROUP BY deptno;             
SELECT * FROM dept;
SELECT * FROM emp;
SELECT emp.*, dept.dname, dept.loc FROM emp, dept WHERE emp.deptno=dept.deptno;
SELECT emp.*, dept.dname, dept.loc FROM emp Inner Join dept ON emp.deptno = dept.deptno WHERE emp.ename = '김사랑';
CREATE TABLE DEPT01(DEPTNO NUMBER(2), DNAME VARCHAR2(14));
INSERT INTO DEPT01 VALUES(10, 'ACCOUNTING');
INSERT INTO DEPT01 VALUES(20, 'RESEARCH');
CREATE TABLE DEPT02(DEPTNO NUMBER(2), DNAME VARCHAR2(14));
INSERT INTO DEPT02 VALUES(10, 'ACCOUNTING');
INSERT INTO DEPT02 VALUES(30, 'SALES');
commit;
SELECT * FROM dept01;
SELECT * FROM dept02;
SELECT * FROM DEPT01 LEFT OUTER JOIN DEPT02 USING(DEPTNO);
-- 문제 1
SELECT emp.ename, emp.hiredate FROM emp Inner Join dept USING(deptno) WHERE dept.dname = '경리부';
-- 문제 2
SELECT emp.ename, emp.sal FROM emp Inner Join dept USING(deptno) WHERE dept.loc = '인천';