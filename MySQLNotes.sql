-- 🟢Start the CLI (Command Line Interface)
mysql-ctl cli

-- 🟢Showing all the available databases
show databases;

-- 🟢Creating New Database Basic Command
CREATE DATABASE database_name;

-- Example
CREATE DATABASE soap_store;

-- 🟢To drop a Database
DROP DATABASE database_name;

-- Example
DROP DATABASE hello_world_db;

-- 🟢To Use a Database
USE database_name;

-- Example
USE dog_walking_app;

-- 🟢To see which database we are using
SELECT database();

-- 🟢What are Tables?
-- Tables are a collection of related data held in a structural format within a databse;

-- 🟢Creating a New Table
CREATE TABLE tablename
  (
    column_name data_type,
    column_name data_type
  );

-- Example
CREATE TABLE cats
  (
    name VARCHAR(100),
    age INT
  );

-- 🟢To check if the table was created successfully
SHOW TABLES;

-- 🟢To describe the syntax of the made table
SHOW COLUMNS FROM tablename;
-- OR
DESC tablename;


-- 🟢To drop a table
DROP TABLE <tablename>;

-- Example
DROP TABLE cats;

-- 🟢Inserting DATA into the TABLE
INSERT INTO table_name(column_name) VALUES(data);

--Example
INSERT INTO cats(name, age) VALUES ('Jetson', 7);

-- 🟢Quick Intro to how to VIEW INSERTED DATA
SELECT * FROM table_name;

-- 🟢To INSERT MULTIPLE data
INSERT INTO table_name 
            (column_name, column_name) 
VALUES      (value, value), 
            (value, value), 
            (value, value);
            
-- If you're wondering how to insert a string (VARCHAR) value that contains quotations, then here's how.
-- You can do it a couple of ways:
-- Escape the quotes with a backslash: "This text has \"quotes\" in it" or 'This text has \'quotes\' in it'
-- Alternate single and double quotes: "This text has 'quotes' in it" or 'This text has "quotes" in it'
            
-- 🟢To view WARNINGS
SHOW WARNINGS;

-- 🟢NULL and NOT NULL
-- So basically here NULL means not defined, by default the NULL in any table is yes i.e. we can have queries where we do not specify a column in a table
-- hence that data value will be set to null. To avoid this we use NOT NULL while initializing the table. Below is an Example
CREATE TABLE cats2
  (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
  );
  
-- Now try inserting an ageless cat will give a warning:

INSERT INTO cats2(name) VALUES('Texas');

-- 🟢Setting up DEFAULT VALUES 
CREATE TABLE cats3
  (
    name VARCHAR(20) DEFAULT 'no name provided',
    age INT DEFAULT 99
  );

-- 🟢Combining NOT NULL and DEFAULT
-- This is not reduntant as even if we have provided default values, we can set the name field to NULL manually if NOT NULL is not specified.
CREATE TABLE cats4
  (
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
  );
  
 -- 🟢Describing Table with PRIMARY KEY
 CREATE TABLE unique_cats (
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
 );
  
 -- Insert some new cats:

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Fred', 23);

-- 🟢To auto increment the value of the primary key we write:
CREATE TABLE unique_cats2 (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

-- 🟢INSERT a couple new cats:

INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);



-- 🟢CRUD Commands

-- Recreate a new cats table:

CREATE TABLE cats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  ); 
DESC cats; 

-- And finally insert some new cats:

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);


-- 🟢SELECT statements
SELECT * FROM cats; /* means selecting all the columns present in the table */
SELECT name FROM cats; 
SELECT age FROM cats; 
SELECT cat_id FROM cats; 
SELECT name, age FROM cats; 
SELECT cat_id, name, age FROM cats; 
SELECT age, breed, name, cat_id FROM cats; 
SELECT cat_id, name, age, breed FROM cats; 

-- 🟢WHERE command
-- T0 select a particular entry or column we use WHERE command

-- Example of selecting by age
SELECT * FROM cats WHERE age=4;

-- 🟢Aliases
SELECT cat_id AS id, name FROM cats;
-- OR
 
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;

-- Aliases helps to query data using another name while keeping the actual names of column in the table unchanged;

-- 🟢UPDATE command 
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';

-- Update Challenge solution

SELECT * FROM cats WHERE name='Jackson';

UPDATE cats SET name='Jack' WHERE name='Jackson'; 
SELECT * FROM cats WHERE name='Jackson';
SELECT * FROM cats WHERE name='Jack';

SELECT * FROM cats WHERE name='Ringo'; 
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
SELECT * FROM cats WHERE name='Ringo';
 
SELECT * FROM cats;
SELECT * FROM cats WHERE breed='Maine Coon';
UPDATE cats SET age=12 WHERE breed='Maine Coon';
SELECT * FROM cats WHERE breed='Maine Coon';

-- 🟢Intro to DELETE command

DELETE FROM cats WHERE name='Egg';
SELECT * FROM cats;
SELECT * FROM cats WHERE name='egg';

DELETE FROM cats; /*This will delete all the data present in the table but the table description would be present.*/


-- 🟥 World of String Functions
-- We can run command from files instead of writing them manually in the command line. For this we first need to create a new file in our folder,
-- then we can write the query or commands inside that file and save the file. To run this file we first need to go to corresct folder.
-- We check this using ls command. If the file is visible then we can run the mysql-ctl cli command to run our command line.

-- To run the command of file we use 
source filename

-- 🟢Creating the book_data.sql file first
-- We also make one book_shop database where we will insert our tables.
CREATE DATABASE book_shop;
use book_shop;

-- Writing in  the book_data.sql file
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
 
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- Running the book_data.sql file in the terminal
source book_data.sql

-- 🟢Looking into CONCAT
-- How basically concat works:
CONCAT(x,y,z) -- from slides
CONCAT(column, anotherColumn) --from slides
CONCAT(author_fname, author_lname)
CONCAT(column, 'text', anotherColumn, 'more text')
CONCAT(author_fname, ' ', author_lname)
CONCAT(author_fname, author_lname); --invalid syntax
 
-- Actually we need to write something like this. We need to make use of SELECT command, even more specifically we should include table name as given below.
SELECT CONCAT('Hello', 'World');
SELECT CONCAT('Hello', '...', 'World');
 
--  This is how we use CONCAT properly.
SELECT CONCAT(author_fname, ' ', author_lname) FROM books; -- This won't change our actual database but will only show as the result.
 
SELECT
  CONCAT(author_fname, ' ', author_lname)
  AS 'full name'
FROM books;
 
SELECT author_fname AS first, author_lname AS last, 
  CONCAT(author_fname, ' ', author_lname) AS full
FROM books;
 
SELECT author_fname AS first, author_lname AS last, 
  CONCAT(author_fname, ', ', author_lname) AS full
FROM books;
 
-- 🟢Use of CONCAT_WS 
SELECT CONCAT(title, '-', author_fname, '-', author_lname) FROM books;
--  This is same as below. We can make use of CONCAT_WS which means CONCAT WITH SEPERATOR. The first argument will specify the separaotr.
SELECT 
    CONCAT_WS(' - ', title, author_fname, author_lname) 
FROM books;


-- 🟢Introducing SUBSTRING
SELECT SUBSTRING('Hello World', 1, 4); --Output: Hell
SELECT SUBSTRING('Hello World', 7); -- Output: World
SELECT SUBSTRING('Hello World', 3, 8); -- Output: llo Wo
SELECT SUBSTRING('Hello World', 3); -- Output: llo World
SELECT SUBSTRING('Hello World', -3); -- Output rld
SELECT SUBSTRING('Hello World', -7); -- Output: o World

SELECT title FROM books;
SELECT SUBSTRING("Where I'm Calling From: Selected Stories", 1, 10);
SELECT SUBSTRING(title, 1, 10) FROM books;
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books; -- SUBSTRING can also be used as SUBSTR

-- 🟢Using CONCAT and SUBSTRING together
SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;


-- 🟢Introducing REPLACE
SELECT REPLACE('Hello World', 'Hell', '%$#@'); --Output: %$#@o World
SELECT REPLACE('Hello World', 'l', '7'); -- Output: He77o Wor7d
SELECT REPLACE('Hello World', 'o', '0'); 
SELECT REPLACE('HellO World', 'o', '*'); -- This is case sensitive hence will only replace small o
 
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');
 
SELECT REPLACE(title, 'e ', '3') FROM books;

SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10)
FROM books;
 
SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string'
FROM books;
 
-- The REPLACE() function, as well as the other string functions, 
-- only change the query output, they don't affect the actual data in the database.

-- 🟢Using REVERSE
SELECT REVERSE('Hello World'); --Output: dlroW olleH
SELECT REVERSE('meow meow'); --Output: woem woem
SELECT REVERSE(author_fname) FROM books;
SELECT CONCAT('woof', REVERSE('woof'));
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;


-- 🟢Working with CHAR_LENGTH
SELECT CHAR_LENGTH('Hello World');
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;


-- 🟢Changing case with UPPER and LOWER
SELECT UPPER('Hello World');
SELECT LOWER('Hello World');
SELECT UPPER(title) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;


-- 🟢The order is important when dealing with combining/wrapping certain string functions.
-- For example:
-- This works:
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps"
FROM books;

-- While this does not:
SELECT CONCAT(UPPER(author_fname, ' ', author_lname)) AS "full name in caps" 
FROM books;

-- UPPER only takes one argument and CONCAT takes two or more arguments, so they can't be switched in that way.
-- You could do it this way, however:
SELECT CONCAT(UPPER(author_fname), ' ', UPPER(author_lname)) AS "full name in caps" 
FROM books;

-- But, the first example above would be better (more DRY*) because you wouldn't need to call UPPER two times.


-- 🟢Refining our selections.
-- Adding some new books
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
	  

-- 🟢Using Distinct
SELECT author_lname FROM books;
SELECT DISTINCT author_lname FROM books;

SELECT author_fname, author_lname FROM books;

SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books; -- THis is same as the above query


-- 🟢Sorting data with ORDER BY
-- Basic syntax with exampls:
SELECT author_lname FROM books ORDER BY author_lname;

SELECT title FROM books ORDER BY title;
SELECT author_lname FROM books ORDER BY author_lname DESC; --Printing in DESC ORDER as BY DEFAULT is ASCENDING

SELECT released_year FROM books ORDER BY released_year;
SELECT released_year FROM books ORDER BY released_year DESC;
SELECT released_year FROM books ORDER BY released_year ASC;
 
SELECT title, released_year, pages FROM books ORDER BY released_year;
SELECT title, pages FROM books ORDER BY released_year;


SELECT title, author_fname, author_lname FROM books ORDER BY 2; -- 2 is just a short form to represent the author_fname so that we do not need to write the name full name again.
SELECT title, author_fname, author_lname FROM books ORDER BY 3;
SELECT title, author_fname, author_lname FROM books ORDER BY 1;
SELECT title, author_fname, author_lname FROM books ORDER BY 1 DESC;
SELECT author_lname, titleFROM books ORDER BY 2;
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;



-- 🟢Using LIMIT
SELECT title FROM books LIMIT 3;
SELECT title FROM books LIMIT 1;
SELECT title FROM books LIMIT 10;
SELECT * FROM books LIMIT 1;
 
SELECT title, released_year FROM books RDER BY released_year DESC LIMIT 5;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 1;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 14;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 0,5; -- This syntax uses starting index and then the number of entries to be printed.
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 0,3;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 1,3;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 10,1;
 
SELECT * FROM tbl LIMIT 95,18446744073709551615; -- THis large number is only used to print out all the values as we know the rows will be anyways less than this.
SELECT title FROM books LIMIT 5;
SELECT title FROM books LIMIT 5, 123219476457;
SELECT title FROM books LIMIT 5, 50;


-- 🟢Better searches with LIKE
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%'; -- searches authors_fname that start with anything and end with anything but has 'da' in the name somewhere
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%'; -- searches author_fname which starts with 'da' and then has anything
SELECT title FROM books WHERE  title LIKE 'the';
SELECT title FROM books WHERE  title LIKE '%the';
SELECT title FROM books WHERE title LIKE '%the%';



-- 🟢More Wildcards

SELECT title, stock_quantity FROM books; 

-- Underscores are a way to represent 1 character, hence this will show all entries 4 digit long as we used 4 _.
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____'; 
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__'; 

(235)234-0987 LIKE '(___)___-____' -- This is how a number of US can be searched.

SELECT title FROM books;

-- Using backslash helps to find names that themselves include % or _ or any wildcard. 
-- Hence here we are finding names that contains anything before or after but there is a % sign present in the name.
SELECT title FROM books WHERE title LIKE '%\%%' 
 
SELECT title FROM books WHERE title LIKE '%\_%'



-- 🟢The COUNT Function
SELECT COUNT(*) FROM books;
SELECT COUNT(author_fname) FROM books;

SELECT COUNT(DISTINCT author_fname) FROM books; 
SELECT COUNT(DISTINCT author_lname) FROM books;
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;

SELECT title FROM books WHERE title LIKE '%the%'; 
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';


-- 🟢The GROUP BY Function

-- Group By summarizes or aggregates the identical data into a single row.
SELECT title, author_lname FROM books;
 
SELECT title, author_lname FROM books GROUP BY author_lname;

SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;
 
 
SELECT title, author_fname, author_lname FROM books; 
SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
 
SELECT released_year FROM books;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;




-- 🟢MIN and MAX Basics

SELECT MIN(released_year) FROM books;
 
SELECT MIN(pages) FROM books;
SELECT MAX(pages) FROM books;
 
SELECT MAX(released_year) FROM books;
SELECT MAX(pages), title FROM books; -- This WILL NOT give the title of book with max pages.

-- To find the TITLE of book with MIN or MAX pages we can do this instead of the one written above
SELECT * FROM books WHERE pages = (SELECT Min(pages) FROM books); 
SELECT title, pages FROM books WHERE pages = (SELECT Max(pages) FROM books); 
SELECT title, pages FROM books WHERE pages = (SELECT Min(pages) FROM books); 
 
 -- OR can do this
SELECT * FROM books ORDER BY pages ASC LIMIT 1;
SELECT title, pages FROM books ORDER BY pages ASC LIMIT 1;
SELECT * FROM books ORDER BY pages DESC LIMIT 1;



-- 🟢USING MIN and MAX with GROUP BY

SELECT author_fname, author_lname, Min(released_year) FROM books GROUP  BY author_lname, author_fname;
SELECT author_fname, author_lname,Max(pages) FROM books GROUP BY author_lname, author_fname;
SELECT CONCAT(author_fname, ' ', author_lname) AS author, MAX(pages) AS 'longest book' FROM books GROUP BY author_lname, author_fname;



-- 🟢The SUM Function
SELECT SUM(pages) FROM books;
SELECT SUM(released_year) FROM books;
 
SELECT author_fname, author_lname, Sum(pages) FROM books GROUP BY author_lname, author_fname;
SELECT author_fname, author_lname, Sum(released_year) FROM books GROUP BY author_lname, author_fname;



-- 🟢The AVG Function
SELECT AVG(released_year) FROM books;
 
SELECT AVG(pages) FROM books;
 
SELECT AVG(stock_quantity) FROM books GROUP BY released_year;
 
SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;
SELECT author_fname, author_lname, AVG(pages) FROM booksGROUP BY author_lname, author_fname;


-- 🟢Revisiting Data Types

-- 🟢CHAR and VARCHAR
CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));
INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle');
INSERT INTO dogs (name, breed) VALUES ('robby', 'corgi');
INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retriever');
SELECT * FROM dogs;
 
INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retrievesadfdsafdasfsafr');
SELECT * FROM dogs;


-- 🟢DECIMAL

CREATE TABLE items(price DECIMAL(5,2)); --This 5 represents the total number of digits that can be included while 2 represents digits to the shown after decimal
INSERT INTO items(price) VALUES(7); 
INSERT INTO items(price) VALUES(7987654);
INSERT INTO items(price) VALUES(34.88);
INSERT INTO items(price) VALUES(298.9999);
INSERT INTO items(price) VALUES(1.9999);
 
SELECT * FROM items;



-- 🟢FLOAT and DOUBLE
CREATE TABLE thingies (price FLOAT);
INSERT INTO thingies(price) VALUES (88.45);
SELECT * FROM thingies;
INSERT INTO thingies(price) VALUES (8877.45);
SELECT * FROM thingies;
INSERT INTO thingies(price) VALUES (8877665544.45);
SELECT * FROM thingies;


-- 🟢Creating the DATE data
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
 
SELECT * FROM people;



-- 🟢DATE Math

SELECT * FROM people;
SELECT DATEDIFF(NOW(), birthdate) FROM people;
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;

SELECT birthdt FROM people; 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
 
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;





-- 🟢Working with TIMESTAMPS
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO comments (content) VALUES('lol what a funny article');
INSERT INTO comments (content) VALUES('I found this offensive');
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
 
SELECT * FROM comments ORDER BY created_at DESC;
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
 
INSERT INTO comments2 (content) VALUES('dasdasdasd');
INSERT INTO comments2 (content) VALUES('lololololo');
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
SELECT * FROM comments2;
 
SELECT * FROM comments2 ORDER BY changed_at;
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);




-- 🟢Power of LOGICAL Operators

-- 🟢NOT EQUAL

SELECT title FROM books WHERE released_year = 2017;
SELECT title FROM books WHERE released_year != 2017;
SELECT title, author_lname FROM books;
SELECT title, author_lname FROM books WHERE author_lname = 'Harris';
SELECT title, author_lname FROM books WHERE author_lname != 'Harris';


-- 🟢NOT LIKE

SELECT title FROM books WHERE title LIKE 'W';
SELECT title FROM books WHERE title LIKE 'W%';
SELECT title FROM books WHERE title LIKE '%W%';
SELECT title FROM books WHERE title LIKE 'W%';
SELECT title FROM books WHERE title NOT LIKE 'W%';


-- 🟢GREATER THAN

SELECT title, released_year FROM books ORDER BY released_year;
SELECT title, released_year FROM books WHERE released_year > 2000 ORDER BY released_year;
SELECT title, released_year FROM books WHERE released_year >= 2000 ORDER BY released_year;
 
SELECT title, stock_quantity FROM books;
SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;

SELECT 99 > 1; 
SELECT 99 > 567;

100 > 5 -- true 
-15 > 15 -- false
9 > -10 -- true
1 > 1 -- false
'a' > 'b' -- false
'A' > 'a' -- false
'A' >=  'a' -- true
 
SELECT title, author_lname FROM books WHERE author_lname = 'Eggers';
SELECT title, author_lname FROM books WHERE author_lname = 'eggers';
SELECT title, author_lname FROM books WHERE author_lname = 'eGGers';



-- 🟢LESS THAN

SELECT title, released_year FROM books;
 
SELECT title, released_year FROM books WHERE released_year < 2000;
SELECT title, released_year FROM books WHERE released_year <= 2000;
 
SELECT 3 < -10; -- false
SELECT -10 < -9; -- true
SELECT 42 <= 42; -- true
SELECT 'h' < 'p'; -- true
SELECT 'Q' <= 'q'; -- true


-- 🟢Logical AND

SELECT title, author_lname, released_year FROM books WHERE author_lname='Eggers';
SELECT title, author_lname, released_year FROM books WHERE released_year > 2010;
 
SELECT  
    title, 
    author_lname, 
    released_year FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010;
 
SELECT 1 < 5 && 7 = 9; -- false
SELECT -10 > -20 && 0 <= 0; -- true
SELECT -40 <= 0 AND 10 > 40; --false
SELECT 54 <= 54 && 'a' = 'A'; -- true

SELECT * 
FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010 
    AND title LIKE '%novel%';


-- 🟢Logical OR

SELECT 
    title, 
    author_lname, 
    released_year 
FROM books
WHERE author_lname='Eggers' || released_year > 2010;
 
 
SELECT 40 <= 100 || -2 > 0;-- true
SELECT 10 > 5 || 5 = 5; -- true
SELECT 'a' = 5 || 3000 > 2000; -- true
 
SELECT title, 
       author_lname, 
       released_year, 
       stock_quantity 
FROM   books 
WHERE  author_lname = 'Eggers' 
              || released_year > 2010 
OR     stock_quantity > 100;


-- 🟢BETWEEN

SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;
 
SELECT CAST('2017-05-02' AS DATETIME);
 
show databases;
use new_testing_db;
SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
 
SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);
    
    
-- 🟢IN and NOT IN
    
    show databases();
use book_shop;
 
SELECT 
    title, 
    author_lname 
FROM books
WHERE author_lname='Carver' OR
      author_lname='Lahiri' OR
      author_lname='Smith';
 
SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
SELECT title, released_year FROM books WHERE released_year IN (2017, 1985);
 
SELECT title, released_year FROM books
WHERE released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;
 
SELECT title, released_year FROM books WHERE released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0;
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0 ORDER BY released_year;
    
    
 
 -- 🟢CASE Statements
 
 SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
 
SELECT title,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 


 -- 🟢One To Many

 -- 🟢Working with FOREIGN KEYS

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98);


-- 🟢Finding Orders Placed By George: 2 Step Process

SELECT id FROM customers WHERE last_name='George';
SELECT * FROM orders WHERE customer_id = 1;

-- 🟢Finding Orders Placed By George: Using a subquery

SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name='George'
    );
    
-- 🟢Cross Join Craziness

SELECT * FROM customers, orders; 


-- 🟢INNER JOINS

-- 🟢IMPLICIT INNER JOIN

SELECT * FROM customers, orders 
WHERE customers.id = orders.customer_id;
-- IMPLICIT INNER JOIN

SELECT first_name, last_name, order_date, amount
FROM customers, orders 
    WHERE customers.id = orders.customer_id;
    
-- 🟢EXPLICIT INNER JOINS

SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
    
SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
    
SELECT *
FROM orders
JOIN customers
    ON customers.id = orders.customer_id;
    
-- 🟢ARBITRARY JOIN - meaningless, but still possible 

SELECT * FROM customers
JOIN orders ON customers.id = orders.id;


-- 🟢CODE: Left Joins

-- Getting Fancier (Inner Joins Still)

SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
ORDER BY order_date;


SELECT 
    first_name, 
    last_name, 
    SUM(amount) AS total_spent
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC;

-- 🟢LEFT JOINS

SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
    
    
SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id; 
    
    
SELECT 
    first_name, 
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;


-- 🟢Right Joins Part 1
-- 🟢OUR FIRST RIGHT JOIN (seems the same as a left join?)

SELECT * FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;
    
    
-- 🟢ALTERING OUR SCHEMA to allow for a better example (optional)

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT
);

-- 🟢INSERTING NEW DATA (no longer bound by foreign key constraint)

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
 
INSERT INTO orders (order_date, amount, customer_id) VALUES
('2017/11/05', 23.45, 45),
(CURDATE(), 777.77, 109);

-- 🟢MANY TO MANY RELATIONSHIP
-- 🟢Creating Our Tables

-- 🟢CREATING THE REVIEWERS TABLE

CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);
-- 🟢CREATING THE SERIES TABLE

CREATE TABLE series(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4),
    genre VARCHAR(100)
);
-- 🟢CREATING THE REVIEWS TABLE

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);

-- 🟢INSERTING A BUNCH OF DATA

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
    
-- 🟢TV Joins Challenge 1 SOLUTION

SELECT 
    title, 
    rating 
FROM series
JOIN reviews
    ON series.id = reviews.series_id;
    
-- 🟢Challenge 2 AVG rating

SELECT
    title,
    AVG(rating) as avg_rating
FROM series
JOIN reviews
    ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating;

-- 🟢CHALLENGE 3  - Two Solutions

SELECT
    first_name,
    last_name,
    rating
FROM reviewers
INNER JOIN reviews
    ON reviewers.id = reviews.reviewer_id;
    

SELECT
    first_name,
    last_name,
    rating
FROM reviews
INNER JOIN reviewers
    ON reviewers.id = reviews.reviewer_id;
    
    
-- 🟢CHALLENGE 4 - UNREVIEWED SERIES

SELECT title AS unreviewed_series
FROM series
LEFT JOIN reviews
    ON series.id = reviews.series_id
WHERE rating IS NULL;

-- 🟢Challenge 5 - GENRE AVG RATINGS

SELECT genre, 
       Round(Avg(rating), 2) AS avg_rating 
FROM   series 
       INNER JOIN reviews 
               ON series.id = reviews.series_id 
GROUP  BY genre; 

-- 🟢CHALLENGE 6 - Reviewer Stats 

SELECT first_name, 
       last_name, 
       Count(rating)                               AS COUNT, 
       Ifnull(Min(rating), 0)                      AS MIN, 
       Ifnull(Max(rating), 0)                      AS MAX, 
       Round(Ifnull(Avg(rating), 0), 2)            AS AVG, 
       IF(Count(rating) > 0, 'ACTIVE', 'INACTIVE') AS STATUS 
FROM   reviewers 
       LEFT JOIN reviews 
              ON reviewers.id = reviews.reviewer_id 
GROUP  BY reviewers.id; 

-- 🟢CHALLENGE 6 - Reviewer Stats With POWER USERS 

SELECT first_name, 
       last_name, 
       Count(rating)                    AS COUNT, 
       Ifnull(Min(rating), 0)           AS MIN, 
       Ifnull(Max(rating), 0)           AS MAX, 
       Round(Ifnull(Avg(rating), 0), 2) AS AVG, 
       CASE 
         WHEN Count(rating) >= 10 THEN 'POWER USER' 
         WHEN Count(rating) > 0 THEN 'ACTIVE' 
         ELSE 'INACTIVE' 
       end                              AS STATUS 
FROM   reviewers 
       LEFT JOIN reviews 
              ON reviewers.id = reviews.reviewer_id 
GROUP  BY reviewers.id;

-- 🟢CHALLENGE 7 - 3 TABLES!

SELECT 
    title,
    rating,
    CONCAT(first_name,' ', last_name) AS reviewer
FROM reviewers
INNER JOIN reviews 
    ON reviewers.id = reviews.reviewer_id
INNER JOIN series
    ON series.id = reviews.series_id
ORDER BY title;


-- 🟢IG Clone Users Schema

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- 🟢IG Clone Photos Schema

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- 🟢IG Clone Comments Schema

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- 🟢IG Clone LIKES Schema

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

-- 🟢IG Clone FOLLOWS Schema

CREATE TABLE follows(
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

-- 🟢IG Clone Hashtags Schema

CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);
