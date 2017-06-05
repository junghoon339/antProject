select * from tab;

drop table survey_detail;
drop table survey_user;
drop table survey;

drop table timetable;
drop table message;
drop table user_calendar;
drop table vote_detail;
drop table vote;
drop table chat;

drop table todo;
drop table storage;
drop table project_calendar;

drop table project_user;
drop table project;
drop table ant_user;




CREATE TABLE ant_user
(
   user_no      NUMBER   CONSTRAINT user_no_pk PRIMARY KEY,
   user_id      VARCHAR(100)   NOT NULL,
   user_name    VARCHAR(100)   NOT NULL,
   user_password   VARCHAR(100)   NOT NULL,
   user_school   VARCHAR(100)   NOT NULL,
   user_major   VARCHAR(100)   NOT NULL
);
CREATE SEQUENCE seq_user_no;

drop table ant_user;
select * tab;


CREATE TABLE project(
   project_no            NUMBER CONSTRAINT project_no_pk PRIMARY KEY,
   project_name          VARCHAR(50) NOT NULL,
   project_startdate     VARCHAR(50) NOT NULL,
   project_enddate       VARCHAR(50) NOT NULL,
   project_subject       VARCHAR(30) NOT NULL,
   project_teacher       VARCHAR(20) NOT NULL,
   project_state         NUMBER DEFAULT 0 --������Ʈ����(0-������, 1-������ǥ��, 2-�Ϸ�)
);
create sequence seq_project_no;


CREATE TABLE project_user(
   project_user_no       NUMBER CONSTRAINT project_user_no_pk PRIMARY KEY,
   project_no            NUMBER CONSTRAINT project_user_project_no_fk references project(project_no) on delete cascade,
   user_no               NUMBER CONSTRAINT project_user_no_fk references ant_user(user_no) on delete cascade,
   project_user_role     VARCHAR(30) 
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
   vote_title varchar2(50) not null,
   vote_adddate date default sysdate,
   vote_enddate date not null,
   vote_state number default 0, -- 0�� ������, 1�� �Ϸ�
   project_user_no number constraint vote_project_user_no_fk references project_user(project_user_no) on delete cascade
);
create sequence seq_vote_no;


CREATE TABLE vote_detail
(
   vote_detail_no number constraint vote_detail_no_po primary key,
   vote_no number constraint vote_detail_vote_no_fk references vote(vote_no) on delete cascade,
   user_no number constraint vote_detail_user_no_fk references ant_user(user_no) on delete cascade,
   vote_detail_column number not null
);
create sequence seq_vote_detail_no;


drop table user_calendar;
-- user_calendar���̺� ����
-- user_no ��Ī : user_user_no_fk
CREATE TABLE user_calendar
(
   user_calendar_no      NUMBER  CONSTRAINT user_calendar_no_pk primary key,
   user_no               NUMBER CONSTRAINT user_calendar_user_no_fk references ant_user(user_no) on delete cascade ,
   user_calendar_startdate  VARCHAR(20) NOT NULL ,
   user_calendar_enddate  VARCHAR(20)  NULL ,
   user_calendar_time    VARCHAR(20)  NULL ,
   user_calendar_content  VARCHAR(50)  NULL 
);
create sequence seq_user_calendar_no;

-- project_calendar���̺� ����
-- user_no ��Ī : project_user_no_fk 
CREATE TABLE project_calendar
(
   project_calendar_no   NUMBER CONSTRAINT project_calendar_no_pk primary key,
   project_no            NUMBER CONSTRAINT calendar_project_no_fk references project(project_no) on delete cascade,
   user_no               NUMBER CONSTRAINT project_calendar_user_no_fk references ant_user(user_no) on delete cascade ,
   project_calendar_startdate  VARCHAR(20)  NOT NULL ,
   project_calendar_enddate  VARCHAR(20)  NULL ,
   project_calendar_time  VARCHAR(20)  NULL ,
   project_calendar_content  VARCHAR(20)  NULL 
);
create sequence seq_project_calendar_no;

-- timetable���̺� ����
-- user_no ��Ī : timetable_user_no_fk
CREATE TABLE timetable
(
   timetable_no          NUMBER CONSTRAINT timetable_no_pk primary key ,
   user_no               NUMBER CONSTRAINT timetable_user_no_fk references ant_user(user_no) on delete cascade ,
   timetable_subject     VARCHAR(20)  NOT NULL ,
   timetable_day         number  default 0 , --0�� ������
   timetable_class       number  NOT NULL ,
   timetable_location    VARCHAR(20)  NULL ,
   timetable_teacher     VARCHAR(20)  NULL 
);
create sequence seq_timetable_no ;



CREATE TABLE chat
(
   chat_no      NUMBER CONSTRAINT chat_no_pk PRIMARY KEY,
   project_no   NUMBER CONSTRAINT project_no_fk REFERENCES project(project_no) ON DELETE CASCADE,
   chat_path   VARCHAR2(500)
);
CREATE SEQUENCE seq_chat_no;




CREATE TABLE message
(
   message_no number constraint message_no_pk primary key,
   user_no_message_receiver number constraint message_user_no_receiver_fk references ant_user(user_no) on delete cascade,
   message_content VARCHAR(100),
   message_sendtime      VARCHAR(20)  NOT NULL ,
   message_receivetime   VARCHAR(20)  NOT NULL ,
   user_no_message_sender number constraint message_user_no_sender_fk references ant_user(user_no) on delete cascade
);
create sequence seq_message_no; 

select * from message;

CREATE TABLE storage
(
   storage_no number constraint storage_no_pk primary key,
   project_no number constraint storage_project_no_fk references project(project_no) on delete cascade,
   storage_filename VARCHAR(20),
   storage_filepath VARCHAR(500),
   storage_filesize VARCHAR(50),
   storage_readnum number default 0,
   user_no number constraint storage_user_no_fk references ant_user(user_no) on delete cascade 
);
create sequence seq_storage_no;

CREATE TABLE survey
(
   survey_no             NUMBER  CONSTRAINT survey_no_pk PRIMARY KEY,
   project_no            NUMBER  CONSTRAINT survey_project_no_fk REFERENCES project(project_no) on delete cascade,
   survey_startdate      DATE NOT NULL  ,
   survey_enddate        DATE  NOT NULL ,
   survey_state          NUMBER  DEFAULT 0   -- 0:������  1:����
);
create sequence seq_survey_no;

CREATE TABLE survey_user
(
   survey_user_no        NUMBER  CONSTRAINT survey_user_no_pk PRIMARY KEY,
   survey_no             NUMBER  CONSTRAINT survey_user_survey_no_fk REFERENCES survey(survey_no) on delete cascade,
   user_no               NUMBER  CONSTRAINT survey_user_user_no_fk REFERENCES ant_user(user_no) on delete cascade,
   survey_user_state     NUMBER  DEFAULT 0   -- 0:������  1:����
);
create sequence seq_survey_user_no;

CREATE TABLE survey_detail
(
   survey_detail_no      NUMBER  CONSTRAINT survey_detail_no_pk PRIMARY KEY,
   survey_no             NUMBER  CONSTRAINT survey_detail_survey_no_fk REFERENCES survey(survey_no)on delete cascade,
   survey_detail_username  VARCHAR(50)  NOT NULL ,
   survey_detail_userscore  NUMBER  DEFAULT 0 ,
   survey_user_no        NUMBER  CONSTRAINT survey_detail_user_no_fk REFERENCES survey_user(survey_user_no) on delete cascade
);
create sequence seq_survey_detail_no;

