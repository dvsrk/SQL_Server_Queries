--Match beginning of string(^):
--Gives all the names starting with ‘sa’.Example- sam,samarth.
SELECT name FROM student_tbl WHERE name REGEXP '^sa';


--Match the end of a string($):
--Gives all the names ending with ‘on’.Example – norton,merton.
SELECT name FROM student_tbl WHERE name REGEXP 'on$';


--Match zero or one instance of the strings preceding it(?):
--Gives all the titles containing ‘com’.Example – comedy , romantic comedy.
SELECT title FROM movies_tbl WHERE title REGEXP 'com?'; 


--matches any of the patterns p1, p2, or p3(p1|p2|p3):
--Gives all the names containing ‘be’ or ‘ae’.Example – Abel, Baer.
SELECT name FROM student_tbl WHERE REGEXP 'be|ae' ;


--Matches any character listed between the square brackets([abc]):
--Gives all the names containing ‘j’ or ‘z’.Example – Lorentz, Rajs.
SELECT name FROM student_tbl WHERE REGEXP '[jz]' ;


--Mtches any lower case letter between ‘a’ to ‘z’- ([a-z]) ([a-z] and (.)):
--Retrieve all names that contain a letter in the range of ‘b’ and ‘g’, followed by any character, followed by the letter ‘a’.Example – Tobias, sewall.
--Matches any single character(.)
SELECT name FROM student_tbl WHERE REGEXP '[b-g].[a]' ;


--Matches any character not listed between the square brackets.([^abc]):
--Gives all the names not containing ‘j’ or ‘z’. Example – nerton, sewall.
SELECT name FROM student_tbl WHERE REGEXP '[^jz]' ;


--Matches the end of words[[:>:]]:
--Gives all the titles ending with character “ack”. Example – Black.
SELECT title FROM movies_tbl WHERE REGEXP 'ack[[:>:]]'; 


--Matches the beginning of words[[:<:]]:
--Gives all the titles starting with character “for”. Example – Forgetting Sarah Marshal.
SELECT title FROM movies_tbl WHERE title REGEXP '[[:<:]]for'; 


--Matches a character class[:class:]:
--i.e [:lower:]- lowercase character ,[:digit:] – digit characters etc.
--Gives all the titles containing alphabetic character only. Example – stranger things, Avengers.
SELECT title FROM movies_tbl WHERE REGEXP '[:alpha:]' ;