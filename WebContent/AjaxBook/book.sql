CREATE TABLE 
  book
  (
    isbn VARCHAR2(30),
    title VARCHAR2(100),
    publish VARCHAR2(100),
    price NUMBER(8),
    published DATE,
    bimage VARCHAR2(50) DEFAULT 'noimage.jpg',
    PRIMARY KEY (isbn)
  )
;

INSERT INTO book  VALUES 
('8972807303','엑셀 2003 완전정복하기',
'도서출판 대림',17800,'2005/6/23','a.jpg');

INSERT INTO book  VALUES 
('8972807494','오라클 10g + PL/SQL 입문',
'팜파스',20000,'2006/7/25','b.jpg');

INSERT INTO book  VALUES ('8972807257','HTML 입문 + 웹디자인',
'대림','18000 ','2006/3/27','c.jpg');

INSERT INTO book  VALUES ('8972807133','예제로 배우는 XML',
'대림 출판사','20000','2005/5/30','d.jpg');
INSERT INTO book  VALUES ('8972807087','C 언어  입문',
'대림1','20000','2005/3/25','e.jpg');
INSERT INTO book  VALUES ('8972807346','C++입문',
'도서출판 대림','18000','2006/6/30','f.jpg');
INSERT INTO book  VALUES ('8972807605',
'플래시 액션스크립트 원리','도서출판 팜파스','35000',
'2006/12/30','g.jpg');
INSERT INTO book  VALUES ('8972807621',
'DSLR 카메라  사진 보정 포토샵 ',
'도서출판 팜파스','16000','2006/12/18','h.jpg');
commit;




