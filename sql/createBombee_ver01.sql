-- 회원
DROP TABLE IF EXISTS MEMB RESTRICT;

-- 강사
DROP TABLE IF EXISTS TCHER RESTRICT;

-- 쪽지
DROP TABLE IF EXISTS CHAT RESTRICT;

-- 운동
DROP TABLE IF EXISTS S_TYPE RESTRICT;

-- 프로모션
DROP TABLE IF EXISTS PROMOTION RESTRICT;

-- 개인트레이너
DROP TABLE IF EXISTS TCHER_TRAINER RESTRICT;

-- 프로모션사진
DROP TABLE IF EXISTS PROMOTIONIMG RESTRICT;

-- 일정
DROP TABLE IF EXISTS SCHEDULE RESTRICT;

-- 강사사진
DROP TABLE IF EXISTS TPIC RESTRICT;

-- 회원식단관리
DROP TABLE IF EXISTS MEMBERMANAGEMENT RESTRICT;

-- 강사리뷰
DROP TABLE IF EXISTS TCHER_REVIEW RESTRICT;

-- 회원
CREATE TABLE MEMB (
  MNO         INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  ID          VARCHAR(255) NOT NULL COMMENT '아이디', -- 아이디
  EMAIL       VARCHAR(255) NOT NULL COMMENT '이메일', -- 이메일
  ACCOUNTTYPE INTEGER      NOT NULL COMMENT '가입유형', -- 가입유형
  PWD         VARCHAR(255) NOT NULL COMMENT '비밀번호', -- 비밀번호
  NAME        VARCHAR(255) NOT NULL COMMENT '이름' -- 이름
)
COMMENT '회원';

-- 회원
ALTER TABLE MEMB
  ADD CONSTRAINT PK_MEMB -- 회원 기본키
    PRIMARY KEY (
      MNO -- 회원번호
    );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_MEMB
  ON MEMB ( -- 회원
    ID ASC -- 아이디
  );

-- 회원 유니크 인덱스2
CREATE UNIQUE INDEX UIX_MEMB2
  ON MEMB ( -- 회원
    EMAIL ASC,       -- 이메일
    ACCOUNTTYPE ASC  -- 가입유형
  );

ALTER TABLE MEMB
  MODIFY COLUMN MNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 강사
CREATE TABLE TCHER (
  TNO           INTEGER      NOT NULL COMMENT '강사회원번호', -- 강사회원번호
  SPONO         INTEGER      NULL     COMMENT '운동일련번호', -- 운동일련번호
  INTRODUCTION  VARCHAR(255) NULL     COMMENT '소개', -- 소개
  COMPANY       VARCHAR(255) NOT NULL COMMENT '상호명', -- 상호명
  ZIPCODE       VARCHAR(255) NOT NULL COMMENT '우편번호', -- 우편번호
  COMADDR       VARCHAR(255) NOT NULL COMMENT '근무지주소', -- 근무지주소
  COMDETAILADDR VARCHAR(255) NOT NULL COMMENT '상세주소' -- 상세주소
)
COMMENT '강사';

-- 강사
ALTER TABLE TCHER
  ADD CONSTRAINT PK_TCHER -- 강사 기본키
    PRIMARY KEY (
      TNO -- 강사회원번호
    );

-- 쪽지
CREATE TABLE CHAT (
  CNO     INTEGER NOT NULL COMMENT '채팅번호', -- 채팅번호
  MNO     INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  TNO     INTEGER NOT NULL COMMENT '강사회원번호', -- 강사회원번호
  MSG     TEXT    NOT NULL COMMENT '메세지', -- 메세지
  DATE    DATE    NULL     COMMENT '일시', -- 일시
  CONFIRM BOOLEAN NULL     COMMENT '읽은여부' -- 읽은여부
)
COMMENT '쪽지';

-- 쪽지
ALTER TABLE CHAT
  ADD CONSTRAINT PK_CHAT -- 쪽지 Primary key
    PRIMARY KEY (
      CNO -- 채팅번호
    );

-- 운동
CREATE TABLE S_TYPE (
  SPONO INTEGER      NOT NULL COMMENT '운동일련번호', -- 운동일련번호
  SPO   VARCHAR(255) NOT NULL COMMENT '운동명' -- 운동명
)
COMMENT '운동';

-- 운동
ALTER TABLE S_TYPE
  ADD CONSTRAINT PK_S_TYPE -- 운동 Primary key
    PRIMARY KEY (
      SPONO -- 운동일련번호
    );

-- 프로모션
CREATE TABLE PROMOTION (
  PNO     INTEGER      NOT NULL COMMENT '프로모션 번호', -- 프로모션 번호
  TITL    VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  PRIC    INTEGER      NOT NULL COMMENT '가격', -- 가격
  CONTENT VARCHAR(255) NOT NULL COMMENT '내용', -- 내용
  SDT     DATE         NULL     COMMENT '시작날짜', -- 시작날짜
  EDT     DATE         NULL     COMMENT '종료날짜', -- 종료날짜
  TNO     INTEGER      NOT NULL COMMENT '강사회원번호' -- 강사회원번호
)
COMMENT '프로모션';

-- 프로모션
ALTER TABLE PROMOTION
  ADD CONSTRAINT PK_PROMOTION -- 프로모션 기본키
    PRIMARY KEY (
      PNO -- 프로모션 번호
    );

ALTER TABLE PROMOTION
  MODIFY COLUMN PNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '프로모션 번호';

-- 개인트레이너
CREATE TABLE TCHER_TRAINER (
  TRANO   INTEGER NOT NULL COMMENT '개인트레이너일련번호', -- 개인트레이너일련번호
  MNO     INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  TNO     INTEGER NOT NULL COMMENT '강사회원번호', -- 강사회원번호
  SDT     DATE    NULL     COMMENT '시작일', -- 시작일
  EDT     DATE    NULL     COMMENT '종료일', -- 종료일
  CONFIRM BOOLEAN NULL     COMMENT '수락여부' -- 수락여부
)
COMMENT '개인트레이너';

-- 개인트레이너
ALTER TABLE TCHER_TRAINER
  ADD CONSTRAINT PK_TCHER_TRAINER -- 개인트레이너 기본키
    PRIMARY KEY (
      TRANO -- 개인트레이너일련번호
    );

-- 개인트레이너 유니크 인덱스
CREATE UNIQUE INDEX UIX_TCHER_TRAINER
  ON TCHER_TRAINER ( -- 개인트레이너
    MNO ASC, -- 회원번호
    TNO ASC  -- 강사회원번호
  );

-- 프로모션사진
CREATE TABLE PROMOTIONIMG (
  IMGNO INTEGER      NOT NULL COMMENT '프로모션사진일련번호', -- 프로모션사진일련번호
  PNO   INTEGER      NOT NULL COMMENT '프로모션 번호', -- 프로모션 번호
  IMG   VARCHAR(255) NOT NULL COMMENT '사진경로' -- 사진경로
)
COMMENT '프로모션사진';

-- 프로모션사진
ALTER TABLE PROMOTIONIMG
  ADD CONSTRAINT PK_PROMOTIONIMG -- 프로모션사진 기본키
    PRIMARY KEY (
      IMGNO -- 프로모션사진일련번호
    );

-- 일정
CREATE TABLE SCHEDULE (
  SCHNO INTEGER NOT NULL COMMENT '일정번호', -- 일정번호
  TNO   INTEGER NOT NULL COMMENT '강사회원번호', -- 강사회원번호
  WEEK  DATE    NOT NULL COMMENT '요일', -- 요일
  TIME  TIME    NOT NULL COMMENT '시간' -- 시간
)
COMMENT '일정';

-- 일정
ALTER TABLE SCHEDULE
  ADD CONSTRAINT PK_SCHEDULE -- 일정 기본키
    PRIMARY KEY (
      SCHNO -- 일정번호
    );

-- 일정 유니크 인덱스
CREATE UNIQUE INDEX UIX_SCHEDULE
  ON SCHEDULE ( -- 일정
    TNO ASC,  -- 강사회원번호
    WEEK ASC, -- 요일
    TIME ASC  -- 시간
  );

ALTER TABLE SCHEDULE
  MODIFY COLUMN SCHNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '일정번호';

-- 강사사진
CREATE TABLE TPIC (
  TPICNO INTEGER      NOT NULL COMMENT '강사사진일련번호', -- 강사사진일련번호
  TNO    INTEGER      NOT NULL COMMENT '강사회원번호', -- 강사회원번호
  IMG    VARCHAR(255) NOT NULL COMMENT '사진경로' -- 사진경로
)
COMMENT '강사사진';

-- 강사사진
ALTER TABLE TPIC
  ADD CONSTRAINT PK_TPIC -- 강사사진 기본키
    PRIMARY KEY (
      TPICNO -- 강사사진일련번호
    );

-- 회원식단관리
CREATE TABLE MEMBERMANAGEMENT (
  MENUNO    INTEGER      NOT NULL COMMENT '회원식단일련번호', -- 회원식단일련번호
  MEAL      VARCHAR(255) NULL     COMMENT '끼니', -- 끼니
  MENUPIC   VARCHAR(255) NULL     COMMENT '식단사진', -- 식단사진
  DATE      DATE         NULL     COMMENT '날짜', -- 날짜
  CONFIRM   BOOLEAN      NULL     COMMENT '확인여부', -- 확인여부
  TRAINERNO INTEGER      NULL     COMMENT '개인트레이너일련번호', -- 개인트레이너일련번호
  MNO       INTEGER      NULL     COMMENT '회원번호', -- 회원번호
  TNO       INTEGER      NULL     COMMENT '강사회원번호' -- 강사회원번호
)
COMMENT '회원식단관리';

-- 회원식단관리
ALTER TABLE MEMBERMANAGEMENT
  ADD CONSTRAINT PK_MEMBERMANAGEMENT -- 회원식단관리 기본키
    PRIMARY KEY (
      MENUNO -- 회원식단일련번호
    );

-- 강사리뷰
CREATE TABLE TCHER_REVIEW (
  REVIEWNO INTEGER NOT NULL COMMENT '강사리뷰번호', -- 강사리뷰번호
  SCORE    INTEGER NULL     COMMENT '평점', -- 평점
  TRANO    INTEGER NOT NULL COMMENT '개인트레이너일련번호', -- 개인트레이너일련번호
  REVIEW   TEXT    NULL     COMMENT '코멘트', -- 코멘트
  MNO      INTEGER NULL     COMMENT '회원번호', -- 회원번호
  TNO      INTEGER NULL     COMMENT '강사회원번호' -- 강사회원번호
)
COMMENT '강사리뷰';

-- 강사리뷰
ALTER TABLE TCHER_REVIEW
  ADD CONSTRAINT PK_TCHER_REVIEW -- 강사리뷰 기본키
    PRIMARY KEY (
      REVIEWNO -- 강사리뷰번호
    );

-- 강사
ALTER TABLE TCHER
  ADD CONSTRAINT FK_MEMB_TO_TCHER -- 회원 -> 강사
    FOREIGN KEY (
      TNO -- 강사회원번호
    )
    REFERENCES MEMB ( -- 회원
      MNO -- 회원번호
    );

-- 강사
ALTER TABLE TCHER
  ADD CONSTRAINT FK_S_TYPE_TO_TCHER -- 운동 -> 강사
    FOREIGN KEY (
      SPONO -- 운동일련번호
    )
    REFERENCES S_TYPE ( -- 운동
      SPONO -- 운동일련번호
    );

-- 쪽지
ALTER TABLE CHAT
  ADD CONSTRAINT FK_MEMB_TO_CHAT -- 회원 -> 쪽지
    FOREIGN KEY (
      MNO -- 회원번호
    )
    REFERENCES MEMB ( -- 회원
      MNO -- 회원번호
    );

-- 쪽지
ALTER TABLE CHAT
  ADD CONSTRAINT FK_TCHER_TO_CHAT -- 강사 -> 쪽지
    FOREIGN KEY (
      TNO -- 강사회원번호
    )
    REFERENCES TCHER ( -- 강사
      TNO -- 강사회원번호
    );

-- 프로모션
ALTER TABLE PROMOTION
  ADD CONSTRAINT FK_TCHER_TO_PROMOTION -- 강사 -> 프로모션
    FOREIGN KEY (
      TNO -- 강사회원번호
    )
    REFERENCES TCHER ( -- 강사
      TNO -- 강사회원번호
    );

-- 개인트레이너
ALTER TABLE TCHER_TRAINER
  ADD CONSTRAINT FK_MEMB_TO_TCHER_TRAINER -- 회원 -> 개인트레이너
    FOREIGN KEY (
      MNO -- 회원번호
    )
    REFERENCES MEMB ( -- 회원
      MNO -- 회원번호
    );

-- 개인트레이너
ALTER TABLE TCHER_TRAINER
  ADD CONSTRAINT FK_TCHER_TO_TCHER_TRAINER -- 강사 -> 개인트레이너
    FOREIGN KEY (
      TNO -- 강사회원번호
    )
    REFERENCES TCHER ( -- 강사
      TNO -- 강사회원번호
    );

-- 프로모션사진
ALTER TABLE PROMOTIONIMG
  ADD CONSTRAINT FK_PROMOTION_TO_PROMOTIONIMG -- 프로모션 -> 프로모션사진
    FOREIGN KEY (
      PNO -- 프로모션 번호
    )
    REFERENCES PROMOTION ( -- 프로모션
      PNO -- 프로모션 번호
    );

-- 일정
ALTER TABLE SCHEDULE
  ADD CONSTRAINT FK_TCHER_TO_SCHEDULE -- 강사 -> 일정
    FOREIGN KEY (
      TNO -- 강사회원번호
    )
    REFERENCES TCHER ( -- 강사
      TNO -- 강사회원번호
    );

-- 강사사진
ALTER TABLE TPIC
  ADD CONSTRAINT FK_TCHER_TO_TPIC -- 강사 -> 강사사진
    FOREIGN KEY (
      TNO -- 강사회원번호
    )
    REFERENCES TCHER ( -- 강사
      TNO -- 강사회원번호
    );

-- 회원식단관리
ALTER TABLE MEMBERMANAGEMENT
  ADD CONSTRAINT FK_TCHER_TRAINER_TO_MEMBERMANAGEMENT -- 개인트레이너 -> 회원식단관리
    FOREIGN KEY (
      TRAINERNO -- 개인트레이너일련번호
    )
    REFERENCES TCHER_TRAINER ( -- 개인트레이너
      TRANO -- 개인트레이너일련번호
    );

-- 강사리뷰
ALTER TABLE TCHER_REVIEW
  ADD CONSTRAINT FK_TCHER_TRAINER_TO_TCHER_REVIEW -- 개인트레이너 -> 강사리뷰
    FOREIGN KEY (
      TRANO -- 개인트레이너일련번호
    )
    REFERENCES TCHER_TRAINER ( -- 개인트레이너
      TRANO -- 개인트레이너일련번호
    );