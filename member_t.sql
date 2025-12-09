-- 멤버 테이블 생성
create table member_t(
    m_idx number primary key,
    mId VARCHAR(30) not null unique,
    mPw VARCHAR(30) not null,
    mName VARCHAR(30) not null,
    mEmail VARCHAR(30) not null,
    mRegDate date
);

-- 멤버 시퀀스 생성
create sequence member_seq start with 1 increment by 1;