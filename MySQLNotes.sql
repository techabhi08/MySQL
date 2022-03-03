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




















