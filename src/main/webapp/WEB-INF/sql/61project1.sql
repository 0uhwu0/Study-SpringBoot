USE Board;

-- 전체 : type=all
SELECT *
FROM Board
WHERE 
	title LIKE '%keyword%'
    OR body LIKE '%keyword%'
    OR writer LIKE '%keyword%';
    
-- 제목 : type=title
SELECT *
FROM Board
WHERE 
	title LIKE '%keyword%';
    
USE Board;
SELECT * FROM Suppliers;

CREATE TABLE FileName (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    boardId INT NOT NULL,
    fileName VARCHAR(300) NOT NULL,
    FOREIGN KEY (boardId) REFERENCES Board(id)
);

SELECT * FROM Board WHERE Id = 8197;
SELECT * FROM FileName WHERE boardId = 8212;