-- Start the CLI (Command Line Interface)
mysql-ctl cli

-- Showing all the available databases
show databases;

-- Creating New Database Basic Command
CREATE DATABASE database_name;

-- Example
CREATE DATABASE soap_store;

-- To drop a Database
DROP DATABASE database_name;

-- Example
DROP DATABASE hello_world_db;

-- To Use a Database
USE database_name;

-- Example
USE dog_walking_app;

-- To see which database we are using
SELECT database();

-- What are Tables?
-- Tables are a collection of related data held in a structural format within a databse;

-- Creating a New Table
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

-- To check if the table was created successfully
SHOW TABLES;

-- To describe the syntax of the made table
SHOW COLUMNS FROM tablename;
-- OR
DESC tablename;


-- To drop a table
DROP TABLE <tablename>;

-- Example
DROP TABLE cats;

-- Inserting DATA into the TABLE
INSERT INTO table_name(column_name) VALUES(data);

--Example
INSERT INTO cats(name, age) VALUES ('Jetson', 7);

-- Quick Intro to how to VIEW INSERTED DATA
SELECT * FROM table_name;

-- To INSERT MULTIPLE data
INSERT INTO table_name 
            (column_name, column_name) 
VALUES      (value, value), 
            (value, value), 
            (value, value);
            
-- To view WARNINGS
SHOW WARNINGS;

-- NULL and NOT NULL
-- So basically here NULL means not defined, by default the NULL in any table is yes i.e. we can have queries where we do not specify a column in a table
-- hence that data value will be set to null. To avoid this we use NOT NULL while initializing the table. Below is an Example
CREATE TABLE cats2
  (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
  );
  
-- Now try inserting an ageless cat will give a warning:

INSERT INTO cats2(name) VALUES('Texas');

--Setting up DEFAULT VALUES 
CREATE TABLE cats3
  (
    name VARCHAR(20) DEFAULT 'no name provided',
    age INT DEFAULT 99
  );

-- Combining NOT NULL and DEFAULT
-- This is not reduntant as even if we have provided default values, we can set the name field to NULL manually if NOT NULL is not specified.
CREATE TABLE cats4
  (
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
  );
  
 -- Describing Table with PRIMARY KEY
 CREATE TABLE unique_cats (
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
 );
  
 -- Insert some new cats:

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Fred', 23);

-- To auto increment the value of the primary key we write:
CREATE TABLE unique_cats2 (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

-- INSERT a couple new cats:

INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);


