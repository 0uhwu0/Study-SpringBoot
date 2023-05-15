USE Board;

SELECT * FROM Board;

CREATE TABLE BoardLike (
	boardId INT NOT NULL,
    memberId VARCHAR(20) NOT NULL,
    PRIMARY KEY (boardId, memberId),
    FOREIGN KEY (boardId) REFERENCES Board(id),
    FOREIGN KEY (memberId) REFERENCES Member(id)
);

SELECT * FROM BoardLike;