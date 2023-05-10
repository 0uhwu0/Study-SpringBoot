USE Board;

SELECT * FROM Member;
SELECT * FROM Board;
SELECT * FROM FileName ORDER BY 1 DESC;
UPDATE Board
SET writer = 'qqq';

ALTER TABLE Board
ADD FOREIGN KEY (writer) REFERENCES Member(id);

-- 권한 테이블
CREATE TABLE MemberAuthority (
	memberId VARCHAR(20) NOT NULL,
	authority VARCHAR(30) NOT NULL,
    FOREIGN KEY (memberId) REFERENCES Member(id),
    PRIMARY KEY (memberId, authority)
);
SELECT * FROM MemberAuthority;

INSERT INTO MemberAuthority
VALUES ('admin0', 'admin');

SELECT * 
FROM Member m LEFT JOIN MemberAuthority ma ON m.id = ma.memberId
WHERE m.id = 'user1';
DESC Member;