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


  
