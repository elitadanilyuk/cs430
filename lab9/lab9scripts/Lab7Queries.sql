-- #5.1 List the contents of the Library relation in order according to name
-- outputs 2
SELECT * FROM library;


-- #5.2 List the contents of the Located at relation in alphabetic order according to ISBN
-- outputs 55
SELECT * FROM located
ORDER BY isbn ASC;



-- #5.3 For each book that has copies in both libraries, list the book name, number of copies, and library sorted by book name.
-- outputs 48
SELECT b.title, lo.num_copies, li.l_name
FROM book b, located lo, library li
WHERE b.isbn=lo.isbn AND lo.located_at=li.l_name AND lo.isbn in (
	SELECT lo.isbn
	FROM located lo
	GROUP BY lo.isbn
	HAVING COUNT(*) > 1
)
ORDER BY b.title ASC;


-- #5.4 For each library, list library name, and the number of titles sorted by library.
-- outputs 2 rows
	-- main: 28
	-- south park: 27
SELECT li.l_name, COUNT(*)
FROM library li, located lo
WHERE li.l_name=lo.located_at
GROUP by li.l_name;

-- #6 Create a set of triggers that stores action, date and time anyone successfully adds an author, adds or deletes a book from a library, or modifies the number of copies of a book.
DROP TABLE IF EXISTS log;
DROP TRIGGER IF EXISTS logAuthor;
DROP TRIGGER IF EXISTS logBookIn;
DROP TRIGGER IF EXISTS logBookOut;
DROP TRIGGER IF EXISTS logBookCopies;

CREATE TABLE log(
    `action` varchar(75),
    `stamp` datetime,
    `key` int PRIMARY KEY NOT NULL AUTO_INCREMENT
);

DELIMITER |
	CREATE TRIGGER logAuthor
	    AFTER INSERT ON author
	    FOR EACH ROW
	    BEGIN
	        INSERT INTO log (action, stamp) VALUES ('insert author', NOW());
	    END;
	|
	CREATE TRIGGER logBookIn
	    AFTER INSERT ON book
	    FOR EACH ROW
	    BEGIN
	        INSERT INTO log (action, stamp) VALUES ('insert book', NOW());
	    END;
	|
	CREATE TRIGGER logBookOut
	    AFTER DELETE ON book
	    FOR EACH ROW
	    BEGIN
	        INSERT INTO log (action, stamp) VALUES ('delete book', NOW());
	    END;
	|
	CREATE TRIGGER logBookCopies
    AFTER UPDATE
		ON located FOR EACH ROW
    BEGIN
    	IF !(NEW.num_copies <=> OLD.num_copies) THEN
        INSERT INTO log (action, stamp) VALUES ('changed num_copies', NOW());
			END IF;
    END;
	|
DELIMITER ;

-- #7 Create a view that gives Book name, list of authors, and library name on one line. (Hint: The GROUP_CONCAT clause could be handy here)
-- Our implementation of using views requires use of the SECURITY INVOKER syntax. An example is:
	-- CREATE SQL SECURITY INVOKER VIEW view_name AS SELECT * FROM table_name;
DROP VIEW IF EXISTS view_1;

CREATE SQL SECURITY INVOKER VIEW view_1 AS
SELECT b.title, GROUP_CONCAT(DISTINCT a.first_name, ' ', a.last_name), GROUP_CONCAT(DISTINCT li.l_name)
FROM author a, book b, written_by wb, library li
WHERE b.isbn=wb.isbn AND wb.author_id=a.author_id
GROUP BY b.title;

SELECT * FROM view_1;


-- #8 Using this view, provide a list of books, authors, shelf, and library name sorted by book name.
SELECT v.*, GROUP_CONCAT(l.shelf_num)
FROM view_1 v, located l, book b
WHERE v.title=b.title AND b.isbn=l.isbn
GROUP BY v.title;