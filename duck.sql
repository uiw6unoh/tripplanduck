-- 멤버 데이터 추가
CREATE TABLE MEMBER (
	M_NO	NUMBER	NOT NULL,
	M_ID	VARCHAR2(500)	NULL,
	M_PW	VARCHAR2(500)	NULL,
	M_NAME	VARCHAR2(500)	NULL,
	M_NICKNAME	VARCHAR2(500)	NULL,
	M_EMAIL	VARCHAR2(500)	NULL,
	M_TYPE	VARCHAR2(20)	NULL,
	M_WARNING	NUMBER	NULL,
	M_STATUS	CHAR	NULL,
  M_GENDER CHAR NULL,
  M_AGE NUMBER NULL,
  M_SNSID VARCHAR2(500)	NULL
);

COMMENT ON COLUMN MEMBER.M_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.M_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.M_PW IS '비밀번호';
COMMENT ON COLUMN MEMBER.M_NAME IS '이름';
COMMENT ON COLUMN MEMBER.M_NICKNAME IS '닉네임';
COMMENT ON COLUMN MEMBER.M_EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.M_TYPE IS '유저타입';
COMMENT ON COLUMN MEMBER.M_WARNING IS '경고횟수';
COMMENT ON COLUMN MEMBER.M_STATUS IS '계정상태(Y/N)';
COMMENT ON COLUMN MEMBER.M_GENDER IS '성별(F/M)';
COMMENT ON COLUMN MEMBER.M_AGE IS '연령대';
COMMENT ON COLUMN MEMBER.M_SNSID IS 'SNS아이디';

-- 컬럼 추가
ALTER TABLE MEMBER ADD M_GENDER CHAR DEFAULT 'F' NULL;
ALTER TABLE MEMBER ADD M_AGE NUMBER NULL;

-- 컬럼 수정
ALTER TABLE MEMBER ADD M_AGE NUMBER NULL;
ALTER TABLE MEMBER MODIFY M_PW VARCHAR2(500);

-- 멤버 디폴트 값 추가
ALTER TABLE MEMBER MODIFY M_TYPE CHAR DEFAULT 'M';
ALTER TABLE MEMBER MODIFY M_WARNING CHAR DEFAULT 0;
ALTER TABLE MEMBER MODIFY M_STATUS CHAR DEFAULT 'Y';

-- 멤버 시퀀스 생성
CREATE SEQUENCE SEQ_MEMBER_NO;

-- 멤버 더미데이터 추가
-- 관리자
INSERT INTO MEMBER (
    M_NO, 
    M_ID, 
    M_PW, 
    M_NAME,
    M_NICKNAME, 
    M_EMAIL, 
    M_TYPE,
    M_WARNING,
    M_STATUS,
    M_GENDER,
    M_AGE
    
) VALUES(
    1, 
    'admin',
    'admin',
    '관리자',
    '관리자', 
    'abc@abc.com', 
    'A',
    0,
    'Y',
    'F',
    2
);

-- 사용자
INSERT INTO MEMBER (
    M_NO, 
    M_ID, 
    M_PW, 
    M_NAME,
    M_NICKNAME, 
    M_EMAIL, 
    M_TYPE,
    M_WARNING,
    M_STATUS,
    M_GENDER,
    M_AGE
    
) VALUES(
    2, 
    'yeoul', 
    1234,
    '김여울',
    '여리',
    'asdf@gmail.com',
    'M',
    0,
    'Y',
    'F',
    1
    
);


CREATE TABLE MEMBER_OUT (
	M_NO	NUMBER	NOT NULL,
	OUT_REASONS	NUMBER	NULL
);

COMMENT ON COLUMN MEMBER_OUT.M_NO IS '회원번호';
COMMENT ON COLUMN MEMBER_OUT.OUT_REASONS IS '탈퇴사유';

ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	M_NO
);

ALTER TABLE MEMBER_OUT ADD CONSTRAINT PK_MEMBER_OUT PRIMARY KEY (
	M_NO
);

ALTER TABLE MEMBER_OUT ADD CONSTRAINT FK_MEMBER_TO_MEMBER_OUT_1 FOREIGN KEY (
	M_NO
)
REFERENCES MEMBER (
	M_NO
);

-- 여행지 데이터 추가
CREATE TABLE DESTINATION (
	DEST_NO	NUMBER	NOT NULL,
    DEST_CATEGORY	VARCHAR2(50)	NULL,
	DEST_SUBJECT	VARCHAR2(255)	NULL,
	DEST_SUMMARY	VARCHAR2(100)	NULL,
	DEST_CONTENT	VARCHAR2(1000)	NULL,
	DEST_ADDRESS	VARCHAR2(50)	NULL,
	DEST_MAP_X	NUMBER	NULL,
	DEST_MAP_Y	NUMBER	NULL,
	DEST_LIKE_SUM	NUMBER	NULL
	DEST_RATING_AVG	NUMBER	NULL,
	DEST_HIT	NUMBER	NULL,
	DEST_CREATEDATE	DATE	NULL,
	DEST_UPDATEDATE	DATE	NULL
);

COMMENT ON COLUMN DESTINATION.DEST_NO IS '여행지번호';
COMMENT ON COLUMN DESTINATION.DEST_CATEGORY IS '여행지카테고리';
COMMENT ON COLUMN DESTINATION.DEST_SUBJECT IS '여행지제목';
COMMENT ON COLUMN DESTINATION.DEST_SUMMARY IS '여행지요약정보';
COMMENT ON COLUMN DESTINATION.DEST_CONTENT IS '여행지내용';
COMMENT ON COLUMN DESTINATION.DEST_ADDRESS IS '여행지주소';
COMMENT ON COLUMN DESTINATION.DEST_MAP_X IS '여행지X좌표';
COMMENT ON COLUMN DESTINATION.DEST_MAP_Y IS '여행지Y좌표';
COMMENT ON COLUMN DESTINATION.DEST_LIKE_SUM IS '좋아요합';
COMMENT ON COLUMN DESTINATION.DEST_RATING_AVG IS '별점평균';
COMMENT ON COLUMN DESTINATION.DEST_HIT IS '조회수';
COMMENT ON COLUMN DESTINATION.DEST_CREATEDATE IS '등록일';
COMMENT ON COLUMN DESTINATION.DEST_UPDATEDATE IS '수정일';
COMMENT ON COLUMN DESTINATION.LOCATION_ID IS '지역번호';
COMMENT ON COLUMN DESTINATION.DEST_IMAGE IS '여행지사진';

ALTER TABLE DESTINATION ADD DEST_IMAGE VARCHAR2(1000) NULL;

ALTER TABLE DESTINATION MODIFY (DEST_HIT DEFAULT '0');
ALTER TABLE DESTINATION MODIFY (DEST_LIKE_SUM DEFAULT '0');
ALTER TABLE DESTINATION MODIFY (DEST_RATING_AVG DEFAULT '0');
ALTER TABLE DESTINATION MODIFY (DEST_CREATEDATE DEFAULT SYSDATE);
ALTER TABLE DESTINATION MODIFY (DEST_UPDATEDATE DEFAULT SYSDATE);

ALTER TABLE DESTINATION MODIFY DEST_CATEGORY NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_SUBJECT NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_SUMMARY NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_CONTENT NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_ADDRESS NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_MAP_X NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_MAP_Y NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_LIKE_SUM NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_RATING_AVG NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_HIT NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_CREATEDATE NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_UPDATEDATE NOT NULL;
ALTER TABLE DESTINATION MODIFY LOCATION_ID NOT NULL;
ALTER TABLE DESTINATION MODIFY DEST_IMAGE NOT NULL;

ALTER TABLE DESTINATION MODIFY DEST_IMAGE NULL;

ALTER TABLE DESTINATION MODIFY (DEST_ADDRESS VARCHAR2(1000)); 

INSERT INTO DESTINATION VALUES (DEST_NO.NEXTVAL, '강원도', '경포호','관광지', '다양한 철새를 볼 수 있는 호수로 일몰 풍경과 호숫가에 화단이 있는 공원으로 유명합니다.', '강원도 강릉시 저동 94', '37.7961987875548', '128.903090562437', DEFAULT, SYSDATE, SYSDATE, '32', '강릉_경포호.jpg', DEFAULT, DEFAULT);
INSERT INTO DESTINATION VALUES (DEST_NO.NEXTVAL, '전라북도', '덕유산국립공원','관광지', '아고산대의 광활한 지역으로 야생화 초지, 험준한 개울이 있으며 하이킹과 캠핑을 위해 많은 방문객이 찾습니다.', '전북 무주군 설천면 구천동1로 159', '35.86009734480695', '127.74650578949172', DEFAULT, SYSDATE, SYSDATE, '37', 'https://content.skyscnr.com/m/47a4a8938c94110e/original/3820145201700054k_Beautiful-Snowscape-of-Korea.jpg', DEFAULT, DEFAULT);
INSERT INTO DESTINATION VALUES (DEST_NO.NEXTVAL, '경상남도', '우포늪', '관광지', '가시연꽃, 황새 등 희귀 생물 종의 서식지로 유명한 드넓은 내륙 습지입니다.', '전북 무주군 설천면 구천동1로 159', '35.86009734480695', '127.74650578949172', DEFAULT, SYSDATE, SYSDATE, '36', 'https://t1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/1jPF/image/z1in8ldo1UjuhoLCn6V6LpvFvp8.jpg', DEFAULT, DEFAULT);
commit;

UPDATE DESTINATION SET DEST_IMAGE = 'https://postfiles.pstatic.net/MjAyMTEyMjVfNjUg/MDAxNjQwNDMwMTI4ODk3.wuEksIsBv0qOOG-6UR--SJRhgdyJc-MzYfpbx92qq88g.GU-JtjIwe_r_d3oqnvQ0sDVn10uTckeawKl386NZ9NIg.JPEG.kyena200/SE-9ef4d259-32c6-4045-943e-8cdd362a5cf8.jpg?type=w966' WHERE DEST_NO = '2349';

TRUNCATE TABLE DESTINATION;

CREATE TABLE DESTINATION_LIKE (
	DEST_NO	NUMBER	NOT NULL,
	M_NO	NUMBER	NOT NULL
);

COMMENT ON COLUMN DESTINATION_LIKE.DEST_NO IS '여행지번호';
COMMENT ON COLUMN DESTINATION_LIKE.M_NO IS '회원번호';

CREATE TABLE DESTINATION_COMMENTS (
	COMMENTS_ID	NUMBER	NOT NULL,
	M_NO	NUMBER	NOT NULL,
	COMMENTS_WRITER_ID	VARCHAR2(20)	NULL,
	COMMENTS_WRITER_PW	VARCHAR(50)	NULL,
	COMMENTS_CONTENT	VARCHAR(500)	NULL,
	COMMENTS_RATING	NUMBER	NULL,
	COMMENTS_CREATEDATE	DATE	NULL,
	COMMENTS_UPDATEDATE	DATE	NULL,
	COMMENTS_IP_ADDRESS	VARCHAR2(15)	NULL,
	DEST_NO	NUMBER	NOT NULL
);

COMMENT ON COLUMN DESTINATION_COMMENTS.COMMENTS_ID IS '댓글번호';
COMMENT ON COLUMN DESTINATION_COMMENTS.M_NO IS '회원번호';
COMMENT ON COLUMN DESTINATION_COMMENTS.COMMENTS_WRITER_ID IS '작성자아이디';
COMMENT ON COLUMN DESTINATION_COMMENTS.COMMENTS_WRITER_PW IS '작성자비밀번호';
COMMENT ON COLUMN DESTINATION_COMMENTS.COMMENTS_CONTENT IS '댓글내용';
COMMENT ON COLUMN DESTINATION_COMMENTS.COMMENTS_RATING IS '댓글평점';
COMMENT ON COLUMN DESTINATION_COMMENTS.COMMENTS_CREATEDATE IS '댓글등록일';
COMMENT ON COLUMN DESTINATION_COMMENTS.COMMENTS_UPDATEDATE IS '댓글수정일';
COMMENT ON COLUMN DESTINATION_COMMENTS.COMMENTS_IP_ADDRESS IS '댓글아이피주소';
COMMENT ON COLUMN DESTINATION_COMMENTS.DEST_NO IS '여행지번호';

ALTER TABLE DESTINATION_COMMENTS DROP COLUMN COMMENTS_WRITER_PW;
ALTER TABLE DESTINATION_COMMENTS DROP COLUMN COMMENTS_IP_ADDRESS;

ALTER TABLE DESTINATION_COMMENTS MODIFY COMMENTS_CREATEDATE VARCHAR2(30);
ALTER TABLE DESTINATION_COMMENTS MODIFY COMMENTS_UPDATEDATE VARCHAR2(30);

ALTER TABLE DESTINATION_COMMENTS MODIFY (COMMENTS_RATING DEFAULT '0');
ALTER TABLE DESTINATION_COMMENTS MODIFY (COMMENTS_CREATEDATE DEFAULT SYSDATE);
ALTER TABLE DESTINATION_COMMENTS MODIFY (COMMENTS_UPDATEDATE DEFAULT SYSDATE);

ALTER TABLE DESTINATION_COMMENTS MODIFY COMMENTS_CONTENT NOT NULL;
ALTER TABLE DESTINATION_COMMENTS MODIFY COMMENTS_RATING NOT NULL;
ALTER TABLE DESTINATION_COMMENTS MODIFY COMMENTS_CREATEDATE NOT NULL;
ALTER TABLE DESTINATION_COMMENTS MODIFY COMMENTS_UPDATEDATE NOT NULL;

ALTER TABLE DESTINATION ADD LOCATION_ID TO NUMBER;

ALTER TABLE DESTINATION ADD CONSTRAINT PK_DESTINATION PRIMARY KEY (
	DEST_NO
);

ALTER TABLE DESTINATION ADD CONSTRAINT FK_LOCATION_TO_DESTINATION_1 FOREIGN KEY (
	LOCATION_ID
)
REFERENCES LOCATION (
	LOCATION_ID
);

ALTER TABLE DESTINATION_LIKE ADD CONSTRAINT PK_DESTINATION_LIKE PRIMARY KEY (
	DEST_NO
);


ALTER TABLE DESTINATION_LIKE ADD CONSTRAINT FK_DESTINATION_TO_DESTINATION_LIKE_1 FOREIGN KEY (
	DEST_NO
)
REFERENCES DESTINATION (
	DEST_NO
);

ALTER TABLE DESTINATION_COMMENTS ADD CONSTRAINT FK_MEMBER_TO_DESTINATION_COMMENTS_1 FOREIGN KEY (
	M_NO
)
REFERENCES MEMBER (
	M_NO
);

ALTER TABLE DESTINATION_COMMENTS ADD CONSTRAINT PK_DESTINATION_COMMENTS PRIMARY KEY (
	COMMENTS_ID,
	M_NO
);

ALTER TABLE DESTINATION ADD CONSTRAINT FK_LOCATION_TO_DESTINATION_1 FOREIGN KEY (
	LOCATION_ID
)
REFERENCES LOCATION (
	LOCATION_ID
);


-- 플래너 데이터 추가
DROP TABLE MY_PLANNER;
CREATE TABLE MY_PLANNER (
	P_NO	NUMBER	NOT NULL,
	P_PLACE	VARCHAR2(1000)	NULL,
	P_STARTDATE	DATE	NULL,
	P_ENDDATE	DATE	NULL,
	P_LT	DATE	NULL,
	P_MAP_X	NUMBER	NULL,
	P_MAP_Y	NUMBER	NULL,
	P_MAP	VARCHAR2(1000)	NULL,
	P_LIKE	VARCHAR2(10)	NULL,
	P_STATUS	VARCHAR2(1)	NULL,
	P_TYPE	VARCHAR2(1)	NULL,
	DEST_NO	NUMBER	NOT NULL,
	M_NO	NUMBER	NOT NULL,
	LOCATION_ID	NUMBER	NOT NULL
);

COMMENT ON COLUMN MY_PLANNER.P_NO IS '플래너번호';
COMMENT ON COLUMN MY_PLANNER.P_PLACE IS '여행장소';
COMMENT ON COLUMN MY_PLANNER.P_STARTDATE IS '여행시작날짜';
COMMENT ON COLUMN MY_PLANNER.P_ENDDATE IS '여행마무리날짜';
COMMENT ON COLUMN MY_PLANNER.P_LT IS '여행소요시간';
COMMENT ON COLUMN MY_PLANNER.P_MAP_X IS 'X좌표';
COMMENT ON COLUMN MY_PLANNER.P_MAP_Y IS 'Y좌표';
COMMENT ON COLUMN MY_PLANNER.P_MAP IS '여행지도';
COMMENT ON COLUMN MY_PLANNER.P_LIKE IS '플래너좋아요';
COMMENT ON COLUMN MY_PLANNER.P_STATUS IS '상태';
COMMENT ON COLUMN MY_PLANNER.P_TYPE IS '여행타입';
COMMENT ON COLUMN MY_PLANNER.DEST_NO IS '여행지번호';
COMMENT ON COLUMN MY_PLANNER.M_NO IS '회원번호';
COMMENT ON COLUMN MY_PLANNER.LOCATION_ID IS '지역번호';

CREATE TABLE LIKE_PLANNER (
	P_NO	NUMBER	NOT NULL,
	M_NO	NUMBER	NOT NULL
);

COMMENT ON COLUMN LIKE_PLANNER.P_NO IS '플래너번호';
COMMENT ON COLUMN LIKE_PLANNER.M_NO IS '회원번호';

ALTER TABLE MY_PLANNER ADD CONSTRAINT PK_MY_PLANNER PRIMARY KEY (
	P_NO
);

ALTER TABLE LIKE_PLANNER ADD CONSTRAINT FK_MY_PLANNER_TO_LIKE_PLANNER_1 FOREIGN KEY (
	P_NO
)
REFERENCES MY_PLANNER (
	P_NO
);

ALTER TABLE LIKE_PLANNER ADD CONSTRAINT FK_MEMBER_TO_LIKE_PLANNER_1 FOREIGN KEY (
	M_NO
)
REFERENCES MEMBER (
	M_NO
);

ALTER TABLE LIKE_PLANNER ADD CONSTRAINT PK_LIKE_PLANNER PRIMARY KEY (
	P_NO,
	M_NO
);

ALTER TABLE DESTINATION ADD CONSTRAINT FK_LOCATION_TO_DESTINATION_1 FOREIGN KEY (
	LOCATION_ID
)
REFERENCES LOCATION (
	LOCATION_ID
);

ALTER TABLE LOCATION ADD CONSTRAINT PK_LOCATION PRIMARY KEY (
	LOCATION_ID
);


-- 위드덕 데이터 추가
CREATE TABLE WITHDUK (
	WITH_NO	NUMBER	NOT NULL,
	WITH_WRITER_NO	NUMBER	NOT NULL,
	WITH_WRITER_NICK	VARCHAR2(1000)	NULL,
	WITH_LOCATION	VARCHAR2(2000)	NULL,
	WITH_GENDER	VARCHAR2(20)	NULL,
    WITH_AGE VARCHAR2(50) NULL,
	WITH_PERSONNER	NUMBER	NULL,
	WITH_STATUS	VARCHAR2(100)	NULL,
    WITH_STARTDATE DATE DEFAULT SYSDATE,
    WITH_ENDDATE DATE DEFAULT SYSDATE,
	WITH_ORIGINFILENAME	VARCHAR2(3000)	NULL,
    WITH_RENAMEFILENAME	VARCHAR2(3000)	NULL,
	WITH_TITLE	VARCHAR2(1000)	NULL,
	WITH_CONTENT	VARCHAR2(1000)	NULL,
	WITH_KEYWORD	VARCHAR2(1000)	NULL,
	WITH_READCOUNT	NUMBER	NULL,
    WITH_JOINSTATUS VARCHAR2(50) DEFAULT '모집중',
	WITH_CREATEDATE	VARCHAR2(1000)	NULL,
	WITH_UPDATEDATE	VARCHAR2(1000)	NULL
);

COMMENT ON COLUMN WITHDUK.WITH_NO IS '위드덕식별자';
COMMENT ON COLUMN WITHDUK.WITH_MEM_NO IS '참여회원번호';
COMMENT ON COLUMN WITHDUK.WITH_WRITER_NICK IS '작성자닉네임';
COMMENT ON COLUMN WITHDUK.WITH_LOCATION IS '희망지역';
COMMENT ON COLUMN WITHDUK.WITH_GENDER IS '희망성별';
COMMENT ON COLUMN WITHDUK.WITH_PERSONNER IS '희망인원';
COMMENT ON COLUMN WITHDUK.WITH_STATUS IS '모집중/모집완료';
COMMENT ON COLUMN WITHDUK.WITH_PICTURE IS '위드덕소개사진';
COMMENT ON COLUMN WITHDUK.WITH_TITLE IS '제목';
COMMENT ON COLUMN WITHDUK.WITH_CONTENT IS '내용';
COMMENT ON COLUMN WITHDUK.WITH_CATEGORY IS '작성자/참여자';
COMMENT ON COLUMN WITHDUK.WITH_KEYWORD IS '키워드';
COMMENT ON COLUMN WITHDUK.WITH_READCOUNT IS '조회수';
COMMENT ON COLUMN WITHDUK.WITH_CREATEDATE IS '생성시간';
COMMENT ON COLUMN WITHDUK.WITH_UPDATEDATE IS '수정시간';

CREATE TABLE WITHDUK_CHAT (
	CHAT_NO	NUMBER	NOT NULL,
	WITH_NO	NUMBER	NOT NULL,
    WITH_CATEGORY	VARCHAR2(1000)	NULL,
	CHAT_CONTENT	VARCHAR2(1000)	NULL,
	CHAT_TIME	VARCHAR2(1000)	NULL,
	CHAT_MEMNICK	VARCHAR2(1000)	NULL,
	WITH_MEM_NO	NUMBER	NOT NULL
);

COMMENT ON COLUMN WITHDUK_CHAT.CHAT_NO IS '채팅방식별번호';
COMMENT ON COLUMN WITHDUK_CHAT.WITH_NO IS '채팅방게시글번호';
COMMENT ON COLUMN WITHDUK_CHAT.CHAT_CONTENT IS '채팅방내용';
COMMENT ON COLUMN WITHDUK_CHAT.CHAT_TIME IS '채팅시간';
COMMENT ON COLUMN WITHDUK_CHAT.CHAT_MEMNICK IS '채팅닉네임';
COMMENT ON COLUMN WITHDUK_CHAT.WITH_MEM_NO IS '참여회원번호';

ALTER TABLE WITHDUK ADD CONSTRAINT PK_WITHDUK PRIMARY KEY (
	WITH_NO,
	WITH_MEM_NO
);

ALTER TABLE WITHDUK ADD CONSTRAINT FK_MEMBER_TO_WITHDUK_1 FOREIGN KEY (
	WITH_MEM_NO
)
REFERENCES MEMBER (
	M_NO
);

ALTER TABLE WITHDUK_CHAT ADD CONSTRAINT PK_WITHDUK_CHAT PRIMARY KEY (
	CHAT_NO
);

-- 지역정보 데이터 추가
CREATE TABLE LOCATION (
	LOCATION_ID	NUMBER	NOT NULL,
	LOCATION VARCHAR2(1000) NOT	NULL,
  LCENTERX NUMBER(20,14) NOT NULL,
  LCENTERY NUMBER(20,14) NOT NULL
);

COMMENT ON COLUMN LOCATION.LOCATION_ID IS '지역번호';
COMMENT ON COLUMN LOCATION.LOCATION IS '지역';
COMMENT ON COLUMN LOCATION.LCENTERX IS 'X좌표';
COMMENT ON COLUMN LOCATION.LCENTERY IS 'Y좌표';
COMMENT ON COLUMN LOCATION.LOCATION_IMAGE IS '지역영문명';
COMMENT ON COLUMN LOCATION.LOCATION_TITLE IS '지역이미지';

ALTER TABLE LOCATION ADD LOCATION_IMAGE VARCHAR2(50);
ALTER TABLE LOCATION ADD LOCATION_TITLE VARCHAR2(50);

ALTER TABLE LOCATION MODIFY LOCATION_IMAGE NUMBER NOT NULL;
ALTER TABLE LOCATION MODIFY LOCATION_TITLE NUMBER NOT NULL;

DROP TABLE LOCATION;
TRUNCATE TABLE LOCATION;

insert into LOCATION values('1', '서울', 37.56632099109217, 126.97794558984958);
insert into LOCATION values('2', '인천', 37.45590872680688, 126.70552692050053);
insert into LOCATION values('3', '대전', 36.35046856919224, 127.38482123708665);
insert into LOCATION values('4', '대구', 35.87140219365024, 128.60174803297681);
insert into LOCATION values('5', '광주', 35.1595454 , 126.8526012);
insert into LOCATION values('6', '부산', 35.179775233195855, 129.0749925863485);
insert into LOCATION values('7', '울산', 35.53962603316087, 129.31151418501798);
insert into LOCATION values('8', '세종특별자치시', 36.480132736457776, 127.28875674178784);
insert into LOCATION values('31', '경기도', 37.27504774582099, 127.00944450410927);
insert into LOCATION values('32', '강원도', 37.88539639746763, 127.7297762607464);
insert into LOCATION values('33', '충청북도', 36.63567674729703, 127.49138343414079);
insert into LOCATION values('34', '충청남도', 36.658833942854216, 126.67284926797313);
insert into LOCATION values('35', '경상북도', 36.57601417809463, 128.50559446919635);
insert into LOCATION values('36', '경상남도', 35.23828668905039, 128.69239588910835);
insert into LOCATION values('37', '전라북도', 35.82036067006113, 127.10872713817363);
insert into LOCATION values('38', '전라남도', 34.81621546364296, 126.46291182755675);
insert into LOCATION values('39', '제주도', 33.4889273516415, 126.50042271000662);

UPDATE LOCATION SET LOCATION_IMAGE = 'seoul.jpg', LOCATION_TITLE = 'SEOUL' WHERE LOCATION_ID = '1';
UPDATE LOCATION SET LOCATION_IMAGE = '인천.jpeg', LOCATION_TITLE = 'INCHEON' WHERE LOCATION_ID = '2';
UPDATE LOCATION SET LOCATION_IMAGE = '대전.jpeg', LOCATION_TITLE = 'DAEJEON' WHERE LOCATION_ID = '3';
UPDATE LOCATION SET LOCATION_IMAGE = '대구.jpg', LOCATION_TITLE = 'DAEGU' WHERE LOCATION_ID = '4';
UPDATE LOCATION SET LOCATION_IMAGE = '광주.jpeg', LOCATION_TITLE = 'GWANGJU' WHERE LOCATION_ID = '5';
UPDATE LOCATION SET LOCATION_IMAGE = 'busan.jpg', LOCATION_TITLE = 'BUSAN' WHERE LOCATION_ID = '6';
UPDATE LOCATION SET LOCATION_IMAGE = '울산.jpg', LOCATION_TITLE = 'ULSAN' WHERE LOCATION_ID = '7';
UPDATE LOCATION SET LOCATION_IMAGE = '세종시.jpg', LOCATION_TITLE = 'SEJONG' WHERE LOCATION_ID = '8';
UPDATE LOCATION SET LOCATION_IMAGE = '경기.jpg', LOCATION_TITLE = 'GYEONGGI' WHERE LOCATION_ID = '31';
UPDATE LOCATION SET LOCATION_IMAGE = '강원.jpg', LOCATION_TITLE = 'GANGWON' WHERE LOCATION_ID = '32';
UPDATE LOCATION SET LOCATION_IMAGE = '충북.jpg', LOCATION_TITLE = 'CHUNGBUK' WHERE LOCATION_ID = '33';
UPDATE LOCATION SET LOCATION_IMAGE = '충남.jpg', LOCATION_TITLE = 'CHUNGNAM' WHERE LOCATION_ID = '34';
UPDATE LOCATION SET LOCATION_IMAGE = '경북.jpg', LOCATION_TITLE = 'GYEONGBUK' WHERE LOCATION_ID = '35';
UPDATE LOCATION SET LOCATION_IMAGE = '경남.jpg', LOCATION_TITLE = 'GYEONGNAM' WHERE LOCATION_ID = '36';
UPDATE LOCATION SET LOCATION_IMAGE = '전북.jpg', LOCATION_TITLE = 'JEONBUK' WHERE LOCATION_ID = '37';
UPDATE LOCATION SET LOCATION_IMAGE = '전남.jpg', LOCATION_TITLE = 'JEONNAM' WHERE LOCATION_ID = '38';
UPDATE LOCATION SET LOCATION_IMAGE = 'jeju.jpg', LOCATION_TITLE = 'JEJU' WHERE LOCATION_ID = '39';

-- 신고 테이블 데이터 추가
CREATE TABLE REPORT (
	REPORT_ID	NUMBER	NOT NULL,
	REPORT_CATEGORY VARCHAR2(50) NOT	NULL,
  REPORT_M_NO NUMBER NOT NULL,
  REOIRT_CREATEDATE DATE NOT NULL,
  REPORT_COUNT NUMBER NOT NULL,
  REPORT_TYPE VARCHAR2(100) NOT NULL,
  REPORT_NO_TYPE NUMBER NOT NULL,
  M_NO NUMBER NOT NULL
);

COMMENT ON COLUMN REPORT.REPORT_ID IS '신고번호';
COMMENT ON COLUMN REPORT.REPORT_CATEGORY IS '신고카테고리';
COMMENT ON COLUMN REPORT.REPORT_M_NO IS '신고당한회원번호';
COMMENT ON COLUMN REPORT.REOIRT_CREATEDATE IS '신고날짜';
COMMENT ON COLUMN REPORT.REPORT_COUNT IS '신고횟수';
COMMENT ON COLUMN REPORT.REPORT_TYPE IS '신고유형';
COMMENT ON COLUMN REPORT.REPORT_NO_TYPE IS '신고번호유형';
COMMENT ON COLUMN REPORT.M_NO IS '회원번호';

ALTER TABLE REPORT MODIFY REPORT_COUNT DEFAULT '0';
ALTER TABLE REPORT MODIFY REOIRT_CREATEDATE DEFAULT SYSDATE;
ALTER TABLE REPORT RENAME COLUMN REOIRT_CREATEDATE TO REPORT_CREATEDATE;

-- 신고 시퀀스 생성
CREATE SEQUENCE SEQ_REPORT_ID;

ALTER TABLE REPORT ADD CONSTRAINT FK_MEMBER_TO_REPORT_1 FOREIGN KEY (
	M_NO
)
REFERENCES MEMBER (
	M_NO
);

ALTER TABLE REPORT MODIFY REOIRT_CREATEDATE VARCHAR2(30);

COMMIT;