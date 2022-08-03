-- #1 List the entire contents of the book table
-- outputs 28
SELECT * FROM book;

-- #2 List the entire contents of the member table
-- outputs 32
SELECT * FROM member;

-- #3 List the entire contents of the author table
-- outputs 16
SELECT * FROM author;


-- #4 List the entire contents of the publisher table
-- outputs 8
SELECT * FROM publisher;


-- #5 List the entire contents of the phone table
-- outputs 27
SELECT * FROM phone;
	

-- #6 List the entire contents of the author_phone table
-- outputs 22
SELECT * FROM author_phone;


-- #7 List the entire contents of the publisher_phone table
-- outputs 9
SELECT * FROM publisher_phone;

-- #8 List the entire contents of the borrowed_by table
-- outputs 122
SELECT * FROM borrowed_by;

-- #9 List the entire contents of the written_by table
-- outputs 50
SELECT * FROM written_by;

-- #10 List the first name & last names of each Member whose last name begins with B.
-- outputs 6
SELECT m.first_name, m.last_name
FROM member m
WHERE m.last_name LIKE 'B%';

-- #11 List the books published by Coyote Publishing sorted by title .
-- outputs 3
SELECT b.title
FROM book b, publisher p
WHERE p.pub_name='Coyote Publishing' AND b.publisher=p.pub_id
ORDER BY title ASC;

-- #12 For each Member who have a book currently checked out, print out a list of the books currently checked out.
-- outputs 4
SELECT m.first_name, m.last_name, m.member_id
FROM book b, borrowed_by bb, member m
WHERE bb.checkin_date IS NULL AND b.isbn=bb.isbn AND m.member_id=bb.member_id;

-- #13 For each Author, print out a list of books they have written.
-- outputs 50
SELECT a.first_name, a.last_name, a.author_id, b.title
FROM author a, book b, written_by wb
WHERE b.isbn=wb.isbn AND wb.author_id=a.author_id;

-- #14 Print out a list of Authors (firstname lastname)and the associated phone number, who share phone numbers with another author.
-- outputs 8
SELECT a.first_name, a.last_name, ap.phone_number
FROM author a, author_phone ap
WHERE ap.author_id=a.author_id AND ap.phone_number in (
	SELECT ap.phone_number
	FROM author_phone ap
	GROUP BY ap.phone_number
	HAVING COUNT(*) > 1
	)
ORDER BY ap.phone_number
;