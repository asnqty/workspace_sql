-- ´ñ±Û Å×ÀÌºí »ı¼º
create table comment_t (
    c_idx number constraint comment_t_pk primary key, 
    writer varchar2(50) not null, 
    content clob, 		
    pw varchar2(20), 
    ip varchar2(15),
    reg_date date, 
    b_idx number not null,
    constraint comment_t_fk foreign key (b_idx) references bbs_t (b_idx)
);

-- ´ñ±Û ½ÃÄö½º »ı¼º
create sequence comment_seq start with 1 increment by 1;