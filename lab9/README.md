Assignment: Module Lab 7: Creating a Larger Database in SQL
Class: CS470
Author: Elita Danilyuk

All query scripts have comments throughout.
This being said, the following queries from the 'Activity' result in ERRORS:
  - Activity 3: Delete Grace Slick from the Author table.
    - there is no author with the name Grace Slick
    - Query: `DELETE FROM author a WHERE a.first_name='Grace' AND a.last_name='Slick';`
  - Activity 8: Add a new book to the Main library, ISBN # 96-42013-10513, shelf 8, floor 2, Title Growing your own Weeds, published by pubid 90000 on 6/24/2012.
    - The pub_id does not exist, therefor there is an error with foreign keys
      - Query: `INSERT INTO book VALUES('96-42013-10513', 'Growing Your Own Weeds', 90000, '2012-06-24');`
    - Because the book isn't added it cannot be added to the Main Library (another foreign key constraint)
      - Query: `INSERT INTO located VALUES (57, '96-42013-10513', 'Main', 1, 8, 2, 1);`