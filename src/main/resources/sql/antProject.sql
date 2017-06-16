select * from tab;

drop table survey_detail;
drop table survey_user;
drop table survey;

drop table timetable;
drop table message;
drop table user_calendar;
drop table vote_selector;
drop table vote_detail;
drop table vote;
drop table chat;

drop table todo;
drop table storage;
drop table project_calendar;

drop table project_user;
drop table project;
drop table ant_user;
drop table authorities;

select * from tab;
SELECT event_id, event_name, start_date, end_date FROM user_calendar

CREATE TABLE ant_user
(
   user_no      NUMBER   CONSTRAINT user_no_pk PRIMARY KEY,
   user_id      varchar2(100)   NOT NULL,
   user_name    varchar2(100)   NOT NULL,
   user_password   varchar2(100)   NOT NULL,
   user_school   varchar2(100)   NOT NULL,
   user_major   varchar2(100)   NOT NULL
);



SELECT * FROM ANT_USER;

DROP TABLE ant_user CASCADE CONSTRAINTS;
drop table ant_user;
select * tab;


CREATE TABLE project(
   project_no            NUMBER CONSTRAINT project_no_pk PRIMARY KEY,
   project_name          varchar2(50) NOT NULL,
   project_startdate     varchar2(50) NOT NULL,
   project_enddate       varchar2(50) NOT NULL,
   project_subject       varchar2(30) NOT NULL,
   project_teacher       varchar2(20) NOT NULL,
   project_state         NUMBER DEFAULT 0
);
create sequence seq_project_no;


CREATE TABLE project_user(
   project_user_no       NUMBER CONSTRAINT project_user_no_pk PRIMARY KEY,
   project_no            NUMBER CONSTRAINT project_user_project_no_fk references project(project_no) on delete cascade,
   user_no               NUMBER CONSTRAINT project_user_no_fk references ant_user(user_no) on delete cascade,
   project_user_role     varchar2(30) 
);
create sequence seq_project_user_no;

create table todo(
  todo_no number constraint todo_no_pk primary key,
  user_no number constraint todo_user_no_fk references ant_user(user_no) on delete cascade,
  project_no number constraint todo_project_no_fk references project(project_no) on delete cascade,
  todo_location number default 0, --0:todo,1:doing,2:done
  todo_content varchar2(100) not null 
);
create sequence seq_todo_no;


CREATE TABLE vote
(
   vote_no number constraint vote_no_pk primary key,
   user_no number constraint vote_user_no_fk references ant_user(user_no) on delete cascade,
   project_no number constraint vote_project_no_fk references project(project_no) on delete cascade,
   vote_title varchar2(200) not null,
   vote_adddate date default sysdate,
   vote_enddate date ,
   vote_state number default 0
);
create sequence seq_vote_no;


CREATE TABLE vote_detail
(
   vote_detail_no number constraint vote_detail_no_po primary key,
   vote_no number constraint vote_detail_vote_no_fk references vote(vote_no) on delete cascade,
   vote_detail_column varchar2(200) not null
);
create sequence seq_vote_detail_no;


CREATE TABLE vote_selector
(
	vote_selector_no  number constraint vote_selector_no_po primary key,
	user_no number constraint selector_user_no_fk references ant_user(user_no) on delete cascade,
	vote_detail_no number constraint selector_vote_detail_no_fk 
	references vote_detail(vote_detail_no) 
	on delete cascade
);
create sequence seq_vote_selector_no;


drop table user_calendar;

select * from user_calendar;
select * from ANT_USER;
CREATE TABLE user_calendar
(
	event_id NUMBER  CONSTRAINT user_calendar_no_pk primary key,
	user_no NUMBER  CONSTRAINT user_calendar_user_no_fk references ant_user(user_no) on delete cascade ,
	event_name varchar2(127) NOT NULL,
	start_date date not null,
	end_date date not null
);

create sequence seq_user_calendar 
start with 1
minvalue 0
maxvalue 9223372036854775806;

select * from ANT_USER where user_no=41;

insert
into user_calendar 
values(seq_event_id.nextval, 41, '테스트용',
to_date('2016-12-24 05:00:00', 'YYYY-MM-DD HH24:MI:SS'),
to_date('2016-12-25 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));





select * from ant_user;

CREATE TABLE project_calendar
(
   project_calendar_no   NUMBER CONSTRAINT project_calendar_no_pk primary key,
   project_no            NUMBER CONSTRAINT calendar_project_no_fk references project(project_no) on delete cascade,
   user_no               NUMBER CONSTRAINT project_calendar_user_no_fk references ant_user(user_no) on delete cascade ,
   project_calendar_startdate  varchar2(20)  NOT NULL ,
   project_calendar_enddate  varchar2(20)  NULL ,
   project_calendar_time  varchar2(20)  NULL ,
   project_calendar_content  varchar2(20)  NULL 
);
create sequence seq_project_calendar_no;

CREATE TABLE timetable
(
   timetable_no          NUMBER CONSTRAINT timetable_no_pk primary key ,
   user_no               NUMBER CONSTRAINT timetable_user_no_fk references ant_user(user_no) on delete cascade ,
   timetable_subject     varchar2(20)  NOT NULL ,
   timetable_day         number  default 0 , 
   timetable_class       number  NOT NULL ,
   timetable_location    varchar2(20)  NULL ,
   timetable_teacher     varchar2(20)  NULL 
);
create sequence seq_timetable_no ;



CREATE TABLE chat
(
   chat_no      NUMBER CONSTRAINT chat_no_pk PRIMARY KEY,
   project_no   NUMBER CONSTRAINT project_no_fk REFERENCES project(project_no) ON DELETE CASCADE,
   chat_path   varchar2(500)
);
CREATE SEQUENCE seq_chat_no;




CREATE TABLE message
(
   message_no number constraint message_no_pk primary key,
   user_no_message_receiver number constraint message_user_no_receiver_fk references ant_user(user_no) on delete cascade,
   message_content varchar2(500),
   message_sendtime date default sysdate ,
   message_receivetime date ,
   message_state number default 0,
   user_no_message_sender number constraint message_user_no_sender_fk references ant_user(user_no) on delete cascade
);
create sequence seq_message_no; 

select * from message;

CREATE TABLE storage
(
   storage_no number constraint storage_no_pk primary key,
   project_no number constraint storage_project_no_fk references project(project_no) on delete cascade,
   storage_title varchar2(100) not null,
   storage_content varchar2(200) not null,
   storage_filename varchar2(20),
   storage_filepath varchar2(500),
   storage_filesize varchar2(50),
   storage_readnum number default 0,
   storage_writeday date default sysdate,
   user_no number constraint storage_user_no_fk references ant_user(user_no) on delete cascade 
);
create sequence seq_storage_no;

CREATE TABLE survey
(
   survey_no             NUMBER  CONSTRAINT survey_no_pk PRIMARY KEY,
   project_no            NUMBER  CONSTRAINT survey_project_no_fk REFERENCES project(project_no) on delete cascade,
   survey_startdate      DATE NOT NULL  ,
   survey_enddate        DATE  NOT NULL ,
   survey_state          NUMBER  DEFAULT 0
);
create sequence seq_survey_no;

CREATE TABLE survey_user
(
   survey_user_no        NUMBER  CONSTRAINT survey_user_no_pk PRIMARY KEY,
   survey_no             NUMBER  CONSTRAINT survey_user_survey_no_fk REFERENCES survey(survey_no) on delete cascade,
   user_no               NUMBER  CONSTRAINT survey_user_user_no_fk REFERENCES ant_user(user_no) on delete cascade,
   survey_user_state     NUMBER  DEFAULT 0 
);
create sequence seq_survey_user_no;

CREATE TABLE survey_detail
(
   survey_detail_no      NUMBER  CONSTRAINT survey_detail_no_pk PRIMARY KEY,
   survey_no             NUMBER  CONSTRAINT survey_detail_survey_no_fk REFERENCES survey(survey_no)on delete cascade,
   survey_detail_username  varchar2(50)  NOT NULL ,
   survey_detail_userscore  NUMBER  DEFAULT 0 ,
   survey_user_no        NUMBER  CONSTRAINT survey_detail_user_no_fk REFERENCES survey_user(survey_user_no) on delete cascade
);
create sequence seq_survey_detail_no;


SELECT * FROM authorities;



CREATE TABLE authorities
( 
	no 	NUMBER	CONSTRAINT pk_authorities PRIMARY KEY,
	user_no			NUMBER   CONSTRAINT fk_user_authorities REFERENCES ant_user(user_no) ON DELETE CASCADE,
	authority		VARCHAR2(50) NOT NULL
);

select * from todo;

create sequence seq_authorities_no;

