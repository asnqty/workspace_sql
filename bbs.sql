-- 게시판 테이블 생성
create table bbs_t (
    b_idx number constraint bbs_t_pk primary key, 
    writer varchar2(50) not null, 
    title varchar2(50) not null, 
    content clob, 					
    pw varchar2(20),
    hit number,
    ip varchar2(15),
    filename varchar2(100), 
    reg_date date
);

-- 게시판 시퀀스 생성
create sequence bbs_seq start with 1 increment by 1;