USE Board;
SELECT * FROM Board ORDER BY id DESC;
SELECT * FROM FileName;

SELECT 
				b.id,
				b.title,
				b.body,
				b.inserted,
				b.writer,
				m.nickName
			FROM Board b LEFT JOIN Member m ON b.writer = m.id
			WHERE b.id = 8237;
SELECT * FROM Member;

