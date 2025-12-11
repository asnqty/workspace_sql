-- 게시판 테이블 생성
create table project_bbs_t (
    b_idx number constraint project_bbs_t_pk primary key, 
    writer varchar2(50) not null, 
    title varchar2(50) not null, 
    content clob,				
    hit number,
    reg_date date,
    constraint project_bbs_t_fk foreign key (writer) references project_member_t (mName)
);

-- 게시판 시퀀스 생성
create sequence project_bbs_seq start with 1 increment by 1;    

-- 댓글 테이블 생성
create table project_comment_t (
    c_idx number constraint project_comment_t_pk primary key, 
    writer varchar2(50) not null, 
    content clob, 		
    reg_date date, 
    b_idx number not null,
    constraint project_comment_t_fk foreign key (b_idx) references project_bbs_t (b_idx),
    constraint project_comment_t_fk2 foreign key (writer) references project_member_t (mName)
);

-- 댓글 시퀀스 생성
create sequence project_comment_seq start with 1 increment by 1;

drop table project_member_t;
-- 멤버 테이블 생성
create table project_member_t(
    m_idx number primary key,
    mId VARCHAR(30) not null unique,
    mPw VARCHAR(30) not null,
    mName VARCHAR(30) not null unique,
    mRegDate date
);

-- 멤버 시퀀스 생성
create sequence project_member_seq start with 1 increment by 1;