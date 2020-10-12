CREATE SCHEMA IF NOT EXISTS DZ1;

DROP TABLE IF EXISTS DZ1.FILMS, DZ1.PERSONS, DZ1.PERSONS2CONTENT;

CREATE TABLE IF NOT EXISTS DZ1.FILMS(
  TITLE  VARCHAR (50)     NOT NULL,
  ID INT     NOT NULL,
  COUNTRY TEXT,
  BOX_OFFICE BIGINT,
  RELEASE_DATE DATE,
  PRIMARY KEY (ID)
);
CREATE TABLE IF NOT EXISTS DZ1.PERSONS(
  ID INT   REFERENCES FILMS(ID),
  FIO VARCHAR (25)
);
CREATE TABLE IF NOT EXISTS  DZ1.PERSONS2CONTENT(
  PERSONE_ID INT     NOT NULL,
  FILM_ID INT,
  PERSONE_TYPE VARCHAR (25)
);
 INSERT INTO DZ1.FILMS (TITLE, ID, COUNTRY, BOX_OFFICE, RELEASE_DATE) VALUES
  ('Начало', 1, 'США, Великобритания', 882332032, 'Jul 8,2010'),
  ('Общество мёртвых поэтов', 2, 'Великобритания', 253860116, 'Jun 2,1989'),
   ('Престиж', 3, 'США, Великобритания', 109676311, 'Oct 17,2006'),
    ('Пианист', 4, 'Польша, Франция, Великобритания, Германия', 120072577, 'May 24,2003'),
    ('Отель Гранд Будапешт', 5, 'Германия', 172936941, 'Jan 1,1973');
INSERT INTO DZ1.PERSONS ( ID,  FIO)  VALUES ( 1, 'Нолан Кристофер'), ( 2,'Питер Уир'), ( 3, 'Нолан Кристофер'), (4, 'Роман Полански'), ( 5, 'Уэс Андерсон');
INSERT INTO DZ1.PERSONS2CONTENT (  PERSONE_ID, FILM_ID, PERSONE_TYPE)  VALUES (1, 1, 'Режиссёр'), (1, 2,'Режиссёр'), (1, 3, 'Режиссёр'), (1, 4, 'Режиссёр'), (1, 5, 'Режиссёр');
