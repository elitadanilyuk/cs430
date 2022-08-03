--  CS430 database schema
--  Module 6: Lab
--  Author: Elita Danilyuk
-- 

SELECT 'LOADING author' as 'INFO';
source load_author.dump ;

SELECT 'LOADING publisher' as 'INFO';
source load_publisher.dump ;

SELECT 'LOADING member' as 'INFO';
source load_member.dump ;

SELECT 'LOADING phone' as 'INFO';
source load_phone.dump ;

SELECT 'LOADING book' as 'INFO';
source load_book.dump ;

SELECT 'LOADING publisher_phone' as 'INFO';
source load_publisher_phone.dump ;

SELECT 'LOADING written_by' as 'INFO';
source load_written_by.dump ;

SELECT 'LOADING author_phone' as 'INFO';
source load_author_phone.dump ;

SELECT 'LOADING borrowed_by' as 'INFO';
source load_borrowed_by.dump ;