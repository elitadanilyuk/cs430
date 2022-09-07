-- Create an SQL script to perform the following activities.
-- Note: some of these activities will not be allowed by refential integrity. Identify them in your README.txt.

-- #1 Add a new book to the Main library, ISBN # 96-42013-10510, shelf 8, floor 2, Title Growing your own Weeds, published by pubid 10000 on 6/24/2012.
INSERT INTO book VALUES('96-42013-10510', 'Growing Your Own Weeds', 10000, '2012-06-24');
INSERT INTO located VALUES (55, '96-42013-10510', 'Main', 1, 8, 2, 1);

-- #2 Modify the number of copied of ISBN 96-42103-10907 to 8 in the Main library.
UPDATE located SET num_copies=8 
WHERE isbn='96-42103-10907' AND located_at='Main';

-- #3 Delete Grace Slick from the Author table.
-- I commented out this query because it results in an ERROR
  -- there is no author with the name Grace Slick
-- DELETE FROM author a
-- WHERE a.first_name='Grace' AND a.last_name='Slick';

-- #4 Add Commander Adams to the author table, id 305, office phone 970-555-5555
INSERT INTO author VALUES (305, 'Commander', 'Adams');
INSERT INTO phone VALUES ('970-555-5555', '(o)');
INSERT INTO author_phone VALUES (22, 305, '970-555-5555');

-- #5 Add a new book to the South Park library, ISBN # 96-42013-10510, shelf 8, floor 3, Title Growing your own Weeds, published by pubid 10000 on 6/24/2012.
INSERT INTO located VALUES (56, '96-42013-10510', 'South Park', 1, 8, 3, 1);

-- #6 Delete the book Missing Tomorrow from the Main Library.
DELETE l
    FROM located as l
    INNER JOIN book as b ON l.isbn=b.isbn
    WHERE b.title='Missing Tomorrow' AND l.located_at='Main';

-- #7 Add 2 new copies of Eating in the Fort in the South Park library.
UPDATE located
    INNER JOIN book ON located.isbn=book.isbn
    SET located.num_copies=4
    WHERE book.title="Eating in the Fort" AND located.located_at='South Park';

-- #8 Add a new book to the Main library, ISBN # 96-42013-10513, shelf 8, floor 2, Title Growing your own Weeds, published by pubid 90000 on 6/24/2012.
-- I commented out these queries because they result in an ERRORS
  -- The pub_id does not exist, therefor there is an error with foreign keys
  -- Because the book isn't added it cannot be added to the Main Library (another foreign key constraint)
-- INSERT INTO book VALUES('96-42013-10513', 'Growing Your Own Weeds', 90000, '2012-06-24');
-- INSERT INTO located VALUES (57, '96-42013-10513', 'Main', 1, 8, 2, 1);

-- #9 Print the final contents of the Audit table.
SELECT * FROM log;
