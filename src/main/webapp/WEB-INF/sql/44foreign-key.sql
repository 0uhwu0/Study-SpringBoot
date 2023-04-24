-- 학생명, 전화번호(여러개 가능)
CREATE TABLE Student (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50)
);
CREATE TABLE StudentPhone(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	StudentId INT NOT NULL,
	Phone VARCHAR(50),
    -- foreign key (외래키 참조키)
    FOREIGN KEY (StudentId) REFERENCES Student(Id)
);

DESC Student;
DESC StudentPhone;

-- 데이터 입력
INSERT INTO Student (Name) VALUES ('손흥민');
INSERT INTO Student (Name) VALUES ('박지성');

SELECT * FROM Student;

INSERT INTO StudentPhone (StudentId, Phone)
VALUES (1, '010-9999-8888');
INSERT INTO StudentPhone (StudentId, Phone)
VALUES (2, '010-8888-9999');

SELECT * FROM StudentPhone;

INSERT INTO StudentPhone (StudentId, Phone)
VALUES (3, '010-7777-7777'); -- fail

INSERT INTO StudentPhone (StudentId, Phone)
VALUES (NULL, '010-5555-5555'); -- ok

SELECT * FROM StudentPhone;

INSERT INTO StudentPhone (StudentId, Phone)
VALUES (NULL, '010-3333-3333'); -- ok

DELETE FROM StudentPhone
WHERE StudentId IS NULL;

ALTER TABLE StudentPhone
MODIFY COLUMN StudentId INT NOT NULL;

SELECT * FROM StudentPhone;

INSERT INTO StudentPhone (StudentId, Phone)
VALUES (1, '010-7777-7777');

SELECT * FROM StudentPhone;

DELETE FROM Student
WHERE Id = 2; -- fail
-- > 외래키 제약사항이 있는 테이블의 데이터를 먼저 지워야함
DELETE FROM StudentPhone
WHERE StudentId = 2;
DELETE FROM Student
WHERE Id = 2;

SELECT * FROM StudentPhone;