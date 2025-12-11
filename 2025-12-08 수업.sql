SELECT * FROM bbs_t;    
SELECT * FROM comment_t;
-- 테이블 내의 모든 데이터를 복사하여 다시 넣기
insert into bbs_t(b_idx, writer, title, content, pw, hit, ip, filename, reg_date)
select bbs_seq.nextval, writer, title, content, pw, hit, ip, filename, sysdate
from bbs_t;
-- 페이지 번호에 맞는 데이터를 기준 갯수만큼 select 하는 쿼리
SELECT b_idx, writer, title, hit, reg_date FROM
				(SELECT ROWNUM rn, a.* FROM 
					(SELECT b_idx, writer, title, hit, reg_date FROM bbs_t ORDER BY b_idx DESC) a 
				WHERE ROWNUM <= pageNum * amount)
			WHERE rn > (pageNum-1) * amount;
commit;
------- member
SELECT * FROM member_t;